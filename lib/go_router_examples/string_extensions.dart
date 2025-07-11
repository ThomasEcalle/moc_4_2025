extension StringExtensions on String {
  bool isToto() {
    return this == 'toto';
  }

  bool get isTata {
    return toLowerCase() == 'tata';
  }
}
