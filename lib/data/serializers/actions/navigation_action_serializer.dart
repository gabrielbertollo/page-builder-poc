import '../../entities/action.dart';

class NavigationActionSerializer {
  static NavigationAction fromJson(Map<String, dynamic> json) {
    return NavigationAction(
      routeName: json['route'],
      requestUrl: json['requestUrl'],
    );
  }
}
