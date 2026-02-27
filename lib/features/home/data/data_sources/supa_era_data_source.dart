import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseEraDataSource {
  final SupabaseClient supabase;

  SupabaseEraDataSource(this.supabase);

  Future<List<Map<String, dynamic>>> fetchEras(
      {required String tableName}) async {
    try {
      final response = await supabase
          .from(tableName)
          .select()
          .order('created_at', ascending: true);

      log("Fetched ${response.length} eras");
      return response;
    } catch (e) {
      log("Error fetching eras: $e");
      rethrow;
    }
  }
}
