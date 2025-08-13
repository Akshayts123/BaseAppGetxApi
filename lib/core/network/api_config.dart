class ApiConfig {
  ApiConfig._();

  static const String baseUrl = "https://jsonplaceholder.typicode.com/";
  static const header = {'content-Type': 'application/json'};
  static const Duration receiveTimeout = Duration(milliseconds: 1500000);
  static const Duration connectionTimeout = Duration(milliseconds: 1500000);
  static const String comments= '/comments';
  static const String posts = '/posts';
}
