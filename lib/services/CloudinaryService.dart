// cloudinary_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;


class CloudinaryService {
  static const String cloudName = 'dtjsc8w0t';
  static const String apiKey = '585899264949573';
  static const String apiSecret = 'cXqkJgTzcLQ9FpIfZdsctdC6364';

  static Future<String> uploadImage(String imagePath) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://api.cloudinary.com/v1_1/$cloudName/image/upload'),
      );

      request.files.add(await http.MultipartFile.fromPath(
        'file',
        imagePath,
        filename: 'image',
      ));

      request.headers.addAll({
        'Authorization': 'Basic $apiKey:$apiSecret',
      });

      var response = await request.send();
      var responseData = await response.stream.toBytes();
      var responseString = utf8.decode(responseData);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(responseString);
        return data['secure_url'];
      } else {
        throw Exception('Failed to upload image: $responseString');
      }
    } catch (error) {
      throw Exception('Error uploading image: $error');
    }
  }
}
