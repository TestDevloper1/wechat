import 'package:dio/dio.dart';

import '../model/meme_model.dart';

class MemesService {
  final Dio dio = Dio();

  Future<List<Meme>> fetchMemes() async {
    try {
      final response = await dio.get('https://twilsms.com/meme_template/api/memes');
      if (response.statusCode == 200) {
        final List<dynamic> memeDataList = response.data['memes']['data'];
        return memeDataList.map((json) => Meme.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load memes');
      }
    } catch (error) {
      print('Error fetching memes: $error');
      throw Exception('Failed to load memes');
    }
  }
}