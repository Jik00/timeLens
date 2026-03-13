import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDataSource {
  final SupabaseClient supabase;

  SupabaseDataSource(this.supabase);

  Future<List<Map<String, dynamic>>> fetchAllData(
      {required String tableName}) async {
    try {
      final response = await supabase
          .from(tableName)
          .select()
          .order('created_at', ascending: true);

      log("Fetched ${response.length} objects");
      return response;
    } catch (e) {
      log("Error fetching data: $e");
      rethrow;
    }
  }
  Future<List<Map<String, dynamic>>> fetchDataBy(
      {required String tableName, required String query, required String value}) async {
    try {
      final response = await supabase
          .from(tableName)
          .select()
          .filter(query, 'eq', value)
          .order('created_at', ascending: true);

      log("Fetched ${response.length} objects");
      return response;
    } catch (e) {
      log("Error fetching data: $e");
      rethrow;
    }
  }
}
