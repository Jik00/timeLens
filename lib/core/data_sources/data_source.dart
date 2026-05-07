abstract class DataSource {
  Future<void> addData(
      {required String tableName, required Map<String, dynamic> data});

  Future<List<Map<String, dynamic>>> fetchAllData({required String tableName});

  Future<List<Map<String, dynamic>>> fetchDataBy({
    required String tableName,
    required String query,
    required String value,
    String? query2,
    String? value2,
  });

  Stream<List<Map<String, dynamic>>> fetchDataByStream({
    required String tableName,
    required String query,
    required String value,
  });
}
