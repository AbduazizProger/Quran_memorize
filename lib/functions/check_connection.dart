import 'package:http/http.dart' as http;

Future<bool> checkInternet() async {
  try {
    final response = await http.get(Uri.http('https://example.com'));
    return response.statusCode == 200;
  } catch (e) {
    return false;
  }
}
