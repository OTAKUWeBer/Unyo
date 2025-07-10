//External dependencies
import 'package:http/http.dart';
//Internal dependencies
import 'package:unyo/core/services/api/http/helpers/http_client.dart';

class HttpService {

  //Empty constructor
  const HttpService();

  Client createHttp() {
    return Client();
  }

  getData(String url) async {
    final client = HttpClient(client: createHttp());
    final response = await client.get(url);
    return response;
  }

  postData(String url, dynamic body) async {
    final client = HttpClient(client: createHttp());
    final response = await client.post(url, body: body);

    return response;
  }

  putData(String url, dynamic body) async {
    final client = HttpClient(client: createHttp());
    final response = await client.put(url, body: body);
    return response;
  }
}
