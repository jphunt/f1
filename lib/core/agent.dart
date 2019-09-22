import 'package:dio/dio.dart';

class Agent {
  Dio _dio;
  Dio get dio => _dio;

  Agent.instance() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com',
        headers: {
          'Authorization': '',
        },
      ),
    );
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options) async {
          print(options.headers.toString());
          print(options.uri.toString());
          return options;
        },
      ),
    );
  }

  Future getRequest(String path) async {
    return _dio.get(path);
  }

  Future postRequest(String path, Map<String, dynamic> data) async {
    return _dio.post(path, data: data);
  }
}

main(List<String> args) async {
  var agent = Agent.instance();
  var response = await agent.getRequest('/todos/4');
  print(response.toString());
}
