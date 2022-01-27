class ConverterNotFountException<T> implements Exception {
  String message = "Error :: Cannot find converter for type $T";

  ConverterNotFountException();
}
