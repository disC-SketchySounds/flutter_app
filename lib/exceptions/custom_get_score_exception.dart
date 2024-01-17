class CustomGetScoreException implements Exception {
  final String errorMessage;

  CustomGetScoreException(this.errorMessage);

  @override
  String toString() {
    return "Es ist ein Fehler bei Laden der Partitur aufgetreten: $errorMessage";
  }
}