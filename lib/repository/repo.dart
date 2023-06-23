import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bayesiantech_assignment_part2/classes/comment.dart';

class Repository {
  static const baseurl = "https://jsonplaceholder.typicode.com/photos";

  Future<List> fetchcomments () async {
    final url = Uri.parse(baseurl);
    final response = await http.get(url);
    if (!(response.statusCode == 200 || response.statusCode == 201)) {
      throw Exception('somethng went wrong');
    } else{
      var body = await jsonDecode(response.body) ;
      final list = await body.take(3).map((e) => MyComment.fromJson(e)).toList() ;
      return list;
    }
  }

  Future updatecomments (MyComment comment) async {
    final url = Uri.parse('$baseurl/1');
    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(comment.tojson())
    );
    if (!(response.statusCode == 200 || response.statusCode == 201)) {
      throw Exception('somethng went wrong');
    } 
  }
  
}