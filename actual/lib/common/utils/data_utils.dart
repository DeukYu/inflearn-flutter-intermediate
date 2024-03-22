import 'package:actual/common/const/data.dart';

class DataUtils {
  static String pathToUrl(String value) {
    return 'http://$ip$value';
  }

  static List<String> listpathsToUrls(List values) {
    if (values.isEmpty) return [];
    return values.map((e) => pathToUrl(e)).toList();
  }
}
