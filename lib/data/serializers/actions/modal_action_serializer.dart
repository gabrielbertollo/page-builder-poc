import '../../entities/action.dart';

class ModalActionSerializer {
  static ModalAction fromJson(Map<String, dynamic> json) {
    return ModalAction(
      modalName: json['modal'],
    );
  }
}
