import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path_provider/path_provider.dart';

/// Service for accessing the SketchySounds API as a Singleton class
class APIService {
  static final APIService instance = APIService._();

  static const apiUrl = 'http://192.168.178.23:4242';
  static const apiVersion = 'v1';
  static const apiEndpoint = '$apiUrl/api/$apiVersion';

  /// private constructor
  APIService._();

  // API call functions

  /// Upload sketch to the api and return transaction id.
  Future<String?> uploadSketch(String filePath) async {
    var request = http.MultipartRequest('POST', Uri.parse('$apiEndpoint/upload'));

    request.files.add(
      await http.MultipartFile.fromPath(
        'inputFile',
        filePath,
        contentType: MediaType('image', 'jpeg'),
      ),
    );

    var streamedResponse = await request.send();
    if (streamedResponse.statusCode == 200) {
      var response = await http.Response.fromStream(streamedResponse);
      var data = json.decode(response.body);
      return data['transaction_id'];
    }

    return null;
  }

  /// Save sketch to files, return path
  Future<String> getSketch(String transactionID) async {
    final uri = Uri.parse('$apiEndpoint/score/$transactionID');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      var dir = await getApplicationDocumentsDirectory();
      String filePath = '${dir.path}/$transactionID.jpeg';
      File file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      return filePath;
    } else if (response.statusCode == 204) {
      throw Exception("No data yet");
    } else {
      var responseData = json.decode(response.body);
      String errorMessage = responseData['message'] ?? 'Unknown error occurred';
      throw Exception(errorMessage);
    }
  }

  /// Get analysis, return full text as string
  Future<String> getAnalysis(String transactionID) async {
    final uri = Uri.parse('$apiEndpoint/analysis/$transactionID');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      return responseData['analysis'];
    } else if (response.statusCode == 204) {
      throw Exception("No data yet");
    } else {
      var responseData = json.decode(response.body);
      String errorMessage = responseData['message'] ?? 'Unknown error occurred';
      throw Exception(errorMessage);
    }
  }

  /// Request status of transaction
  Future<String> getStatus(String transactionID) async {
    final uri = Uri.parse('$apiEndpoint/status/$transactionID');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      return responseData['status'];
    } else {
      var responseData = json.decode(response.body);
      String errorMessage = responseData['message'] ?? 'Unknown error occurred';
      throw Exception(errorMessage);
    }
  }

  Future<String> getError(String transactionID) async {
    final uri = Uri.parse('$apiEndpoint/error/$transactionID');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      return responseData['error'];
    } else {
      var responseData = json.decode(response.body);
      String errorMessage = responseData['error'] ?? 'Unknown error occurred';
      throw Exception(errorMessage);
    }
  }



}
