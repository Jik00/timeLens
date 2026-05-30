import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;
import 'package:timelens/core/services/storage_service.dart';

class SupabaseStorageService implements StorageService {
  final SupabaseClient _client = Supabase.instance.client;

  @override
  Future<String> uploadFile(
      {required File file,
      required String filePath,
      required String bucketName}) async {
    
    try {
      if (!await file.exists()) {
        throw Exception("File does not exist: ${file.path}");
      }

      final String fileName = p.basename(file.path);
      final fullPath = "$filePath/$fileName";

      final uploadResult = await _client.storage.from(bucketName).upload(
            fullPath,
            file,
            fileOptions: const FileOptions(upsert: true),
          );

      // Check if upload was successful

      if (uploadResult.isEmpty) {
        throw Exception("Upload returned empty response");
      }

      final publicUrl = _client.storage.from(bucketName).getPublicUrl(fullPath);

      return publicUrl;
    } catch (e) {
      throw Exception("Failed to upload: $e");
    }
  }
}
