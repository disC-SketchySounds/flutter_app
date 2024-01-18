class CustomUploadSketchException implements Exception {
  final String errorMessage;

  CustomUploadSketchException(this.errorMessage);

  @override
  String toString() {
    return "Es ist ein Fehler beim Hochladen des Bilds aufgetreten: $errorMessage";
  }
}
