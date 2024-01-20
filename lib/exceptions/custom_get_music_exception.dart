class CustomGetMusicException implements Exception {
  final String errorMessage;

  CustomGetMusicException(this.errorMessage);

  @override
  String toString() {
    return errorMessage;
  }
}
