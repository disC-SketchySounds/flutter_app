class CustomGetAnalysisException implements Exception {
  final String errorMessage;

  CustomGetAnalysisException(this.errorMessage);

  @override
  String toString() {
    return "Es ist ein Fehler bei Laden der Analyse aufgetreten: $errorMessage";
  }
}
