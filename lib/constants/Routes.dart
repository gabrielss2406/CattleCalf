class Routes {
  // API
  static const String authService = "http://34.201.246.151/";

  static String syncWeights() {
    return "${authService}dataAnalyzer/syncWeights";
  }
  static String syncExpense() {
    return "${authService}dataAnalyzer/syncExpense";
  }
  static String syncTypes() {
    return "${authService}dataAnalyzer/syncTypes";
  }
}