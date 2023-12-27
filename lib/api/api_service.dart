import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

/// Service for accessing the SketchySounds API as a Singleton class
class APIService {
  static final APIService instance = APIService._();

  static const apiUrl = 'http://127.0.0.1:4010/';

  /// private constructor
  APIService._();

  // API call functions

  /// Upload sketch to the api.
  Future<int> uploadSketch(String filePath) async {
    throw UnimplementedError("uploadSketch is not implemented yet.");
  }

  /// Save sketch to files, return path
  Future<String> getSketch(String transactionID) async {
    throw UnimplementedError("downloadSketch is not implemented yet.");
  }

  /// Get analysis, return full text as string
  Future<String> getAnalysis(String transactionID) async {
    throw UnimplementedError("getAnalysis is not implemented yet.");
  }

  /// Request status of transaction
  Future<String> getStatus(String transactionID) async {
    throw UnimplementedError("getStatus is not implemented yet.");
  }

  Future<String> getError(String transactionID) async {
    throw UnimplementedError("getError is not implemented yet.");
  }



}
