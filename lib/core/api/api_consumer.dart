import 'dio_helper.dart';

class ApiConsumer {
  const ApiConsumer._();

  factory ApiConsumer() => const ApiConsumer._();

  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? query,
    bool withAuth = false,
  }) async {
    final response = await DioHelper.getData(
      url: endpoint,
      query: query,
      withAuth: withAuth,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? query,
    bool withAuth = false,
    bool isFromData = false,
  }) async {
    final response = await DioHelper.postData(
      url: endpoint,
      data: data,
      query: query,
      withAuth: withAuth,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> put(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? query,
    bool withAuth = false,
  }) async {
    final response = await DioHelper.putData(
      url: endpoint,
      data: data,
      query: query,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> delete(
    String endpoint, {
    Map<String, dynamic>? query,
    bool withAuth = false,
  }) async {
    final response = await DioHelper.deleteData(
      url: endpoint,
      query: query,
    );
    return response.data;
  }
}
