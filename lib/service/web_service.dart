import 'package:feed/model/my_data.dart';
import 'package:http/http.dart' as http;
import '../constant/application_constants.dart';

class WebService {
  Future<List<MyData>> fetchJobs(pageKey) async {
    final response = await http.get(ApplicationConstants.myUri(pageKey));
    if (response.statusCode == 200) {
      return myDataFromJson(response.body);
    }
    return [];
  }
}
