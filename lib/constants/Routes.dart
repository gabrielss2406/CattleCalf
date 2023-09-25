class Routes {
  // API
  static const String authService = "http://34.201.246.151/";
  //static const String authService = "http://10.0.2.2:8000/";

  static String syncWeights() {
    return "${authService}dataAnalyzer/syncWeights";
  }
  static String syncExpense() {
    return "${authService}dataAnalyzer/syncExpense";
  }
  static String syncTypes() {
    return "${authService}dataAnalyzer/syncTypes";
  }
  static String arroba() {
    return "${authService}dataAnalyzer/arroba";
  }
  static String weightAnalysis() {
    return "${authService}dataAnalyzer/weight";
  }
  static String expenseAnalysis() {
    return "${authService}dataAnalyzer/expense";
  }
  static String login() {
    return "${authService}users/login";
  }
  static String register() {
    return "${authService}users/register";
  }
}