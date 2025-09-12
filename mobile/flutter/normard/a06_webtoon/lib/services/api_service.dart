import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://webtoon-crawler.nomadcoders.workers.dev';
  final String today = 'today';

  void getTodaysToons() async {
    final String url = '$baseUrl/$today';

    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      print(response.body);

      return;
    } 
    throw Error();
  }

}