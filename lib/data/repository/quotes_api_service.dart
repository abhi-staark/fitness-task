import 'package:dio/dio.dart';
import 'package:wellbeingapp/models/quotes_model.dart';

class ApiService {
  final Dio dio = Dio();

  Future<List<Quote>> fetchQuotes() async {
    try {
      final response = await dio.get('https://dummyjson.com/quotes');
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data['quotes'];
        final List<Quote> quotes =
            jsonList.map((json) => Quote.fromJson(json)).toList();
        return quotes;
      } else {
        throw Exception('Failed to load quotes');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
