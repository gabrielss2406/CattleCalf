bool isNumeric(String str) {
  final numericRegExp = RegExp(r'^[0-9.]+$');
  return numericRegExp.hasMatch(str);
}