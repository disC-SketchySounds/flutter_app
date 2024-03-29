import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_app/exceptions/custom_get_analysis_exception.dart';
import 'package:flutter_app/exceptions/custom_get_music_exception.dart';
import 'package:flutter_app/exceptions/custom_get_score_exception.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path_provider/path_provider.dart';

import '../exceptions/custom_upload_sketch_exception.dart';

/// Service for accessing the SketchySounds API as a Singleton class
class APIService {
  static final APIService instance = APIService._();

  static String apiUrl = 'http://192.168.178.23:4242';
  static const apiVersion = 'v1';
  static String apiEndpoint = '$apiUrl/api/$apiVersion';

  /// private constructor
  APIService._();

  // API call functions

  /// Upload sketch to the api and return transaction id.
  Future<String?> uploadSketch(String filePath) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('$apiEndpoint/upload-dall-e'));

    if (kDebugMode) {
      print('Loading from $filePath');
    }
    if (kDebugMode) {
      print(apiUrl);
    }
    request.files.add(
      await http.MultipartFile.fromPath(
        'inputFile',
        filePath,
        contentType: MediaType('image', 'jpeg'),
      ),
    );

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    if (streamedResponse.statusCode == 200) {
      var data = json.decode(response.body);
      return data['transaction_id'];
    } else {
      var responseData = json.decode(response.body);
      String errorMessage = responseData['message'] ?? 'Unbekannter Fehler';
      throw CustomUploadSketchException(errorMessage);
    }
  }

  /// Save sketch to files, return path
  Future<String?> getScore(String transactionID) async {
    final uri = Uri.parse('$apiEndpoint/score/$transactionID');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      var dir = await getApplicationDocumentsDirectory();
      String filePath =
          '${dir.path}/score_${DateTime.now().millisecondsSinceEpoch}.png';
      if (kDebugMode) {
        print("Saved to $filePath");
      }
      File file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      return filePath;
    } else if (response.statusCode == 204) {
      return null;
    } else if (response.statusCode == 409) {
      String errorText = await getError(transactionID);
      throw CustomGetScoreException(errorText);
    } else {
      var responseData = json.decode(response.body);
      String errorMessage = responseData['message'] ?? 'Unbekannter Fehler';
      throw CustomGetScoreException(errorMessage);
    }
  }

  /// Get analysis, return full text as string list
  Future<List<String>?> getAnalysis(String transactionID) async {
    final uri = Uri.parse('$apiEndpoint/analysis/$transactionID');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);

      if (responseData['analysis'] is List) {
        List<String> stringList = List<String>.from(
            responseData['analysis'].map((item) => item.toString()));

        // Convert to set and back to remove duplicates
        Set<String> stringSet = Set<String>.from(stringList);
        List<String> uniqueList = List<String>.from(stringSet);

        return uniqueList;
      } else {
        throw Exception("No list returned");
      }
    } else if (response.statusCode == 204) {
      return null;
    } else if (response.statusCode == 409) {
      String errorText = await getError(transactionID);
      throw CustomGetAnalysisException(errorText);
    } else {
      var responseData = json.decode(response.body);
      String errorMessage = responseData['message'] ?? 'Unbekannter Fehler';
      throw CustomGetAnalysisException(errorMessage);
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
      String errorMessage = responseData['message'] ?? 'Unbekannter Fehler';
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
      String errorMessage = responseData['message'] ?? 'Unbekannter Fehler';
      throw Exception(errorMessage);
    }
  }

  /// Save music to files, return path
  Future<String?> getMusic(String transactionID) async {
    final uri = Uri.parse('$apiEndpoint/music/$transactionID');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      var dir = await getApplicationDocumentsDirectory();
      String filePath =
          '${dir.path}/music_${DateTime.now().millisecondsSinceEpoch}.wav';
      File file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      return filePath;
    } else if (response.statusCode == 204) {
      return null;
    } else if (response.statusCode == 409) {
      String errorText =
          "Beim Generieren der Musik ist ein Fehler aufgetreten.";
      throw CustomGetMusicException(errorText);
    } else {
      var responseData = json.decode(response.body);
      String errorMessage = responseData['message'] ?? 'Unbekannter Fehler';
      throw CustomGetMusicException(errorMessage);
    }
  }
}
