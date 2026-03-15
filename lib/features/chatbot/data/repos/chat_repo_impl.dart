import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timelens/constants.dart';
import 'package:timelens/core/data_sources/supa_era_data_source.dart';
import 'package:timelens/core/errors/failures.dart';
import 'package:timelens/features/chatbot/domain/entities/mssg_entity.dart';
import 'package:timelens/features/chatbot/domain/repos/chat_repo.dart';

class ChatRepoImpl implements ChatRepo {
  final SupabaseClient supabase;
  final SupabaseDataSource dataSource;

  ChatRepoImpl({required this.supabase, required this.dataSource});

  @override
  Future<Either<Failure, MssgEntity>> exchangeMessage(
      String chatId, String message) async {
    try {
      debugPrint("chatId: $chatId, message: $message");
      final response = await supabase.functions.invoke(
        'chat',
        body: {
          'message': message,
          'chat_id': chatId,
        },
      );

      final data = response.data;

      if (data == null) {
        throw Exception('No response from edge function');
      }

      final reply = MssgEntity(
        content: data['reply'],
        role: 'assistant',
        chatId: chatId,
      );

      debugPrint("successfuly got reply: ${reply.content}");
      return Right(reply);
    } on PostgrestException catch (e) {
      debugPrint("Database error: ${e.message}");
      return Left(DatabaseFailure('Failed : ${e.message}'));
    } on SocketException catch (e) {
      debugPrint("Network error: $e");
      return Left(NetworkFailure('No internet connection'));
    } catch (e) {
      debugPrint("Unexpected error: $e");
      return Left(ServerFailure('Failed : ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<MssgEntity>>> getMessages(String chatId) async {
    try {
      final response = await dataSource.fetchDataBy(
          tableName: kSupaChatTable, query: kSupaChatId, value: chatId);

      // Convert each map to MssgEntity
      final mssgs = response.map((json) => MssgEntity.fromMap(json)).toList();

      debugPrint("Successfully fetched ${mssgs.length} mssgs");
      return Right(mssgs);
    } on PostgrestException catch (e) {
      debugPrint("Database error: ${e.message}");
      return Left(DatabaseFailure('Failed to fetch mssgs: ${e.message}'));
    } on SocketException catch (e) {
      debugPrint("Network error: $e");
      return Left(NetworkFailure('No internet connection'));
    } catch (e) {
      debugPrint("Unexpected error: $e");
      return Left(ServerFailure('Failed to load mssgs: ${e.toString()}'));
    }
  }

  @override
  Stream<List<MssgEntity>> messagesStream(String chatId) {
    return dataSource
        .fetchDataByStream(
            tableName: kSupaChatTable, query: kSupaChatId, value: chatId)
        .map(
      (response) {
        return response.map((json) => MssgEntity.fromMap(json)).toList();
      },
    );
  }
}
