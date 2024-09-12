import '../../entities/action.dart';
import '../page_builder.dart';

class BuilderNavigationActionSerializer {
  static BuilderNavigationAction fromJson(Map<String, dynamic> json) {
    return BuilderNavigationAction(
      page: json['page'] != null ? PageBuilder.fromJson(json['page']) : null,
    );
  }
}
