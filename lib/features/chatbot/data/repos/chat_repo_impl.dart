import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timelens/core/errors/failures.dart';
import 'package:timelens/features/chatbot/domain/entities/mssg_entity.dart';
import 'package:timelens/features/chatbot/domain/repos/chat_repo.dart';

class ChatRepoImpl implements ChatRepo {
  final SupabaseClient supabase;

  ChatRepoImpl({required this.supabase});

  @override
  Future<Either<Failure, MssgEntity>> exchangeMessage(
      String chatId, String message) async {
    try {
      final response = await supabase.functions.invoke(
        'chat',
        body: {
          'message': message,
          'chat_id': chatId,
        },
      );

      final data = response.data;
      log("Data from chat repo: ${data.toString()} ");

      if (data == null) {
        throw Exception('No response from edge function');
      }

      final reply = MssgEntity(
        content: data['reply'],
        role: 'assistant',
        chatId: chatId,
      );

      log("successfuly got reply: ${reply.content}");
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
}
