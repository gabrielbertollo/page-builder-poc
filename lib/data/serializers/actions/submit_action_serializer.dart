import '../../entities/action.dart';

class SubmitActionSerializer {
  static SubmitAction fromJson(Map<String, dynamic> json) {
    return SubmitAction(
      formId: json['form'],
    );
  }
}
