class CustomUploadSketchException implements Exception {
  final String errorMessage;

  CustomUploadSketchException(this.errorMessage);

  @override
  String toString() {
    return "CustomException: $errorMessage";
  }
}

void main() {
  try {

  } on CustomUploadSketchException catch (e) {

  }
}
