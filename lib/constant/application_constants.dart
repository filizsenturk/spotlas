class ApplicationConstants {
  static const API_URL = "http://161.35.162.216:1210/interview/home/reel?lat=51.5&lon=-0.17&page=";
  static Uri myUri(int pageKey)=>Uri.parse(API_URL+'$pageKey');
}


