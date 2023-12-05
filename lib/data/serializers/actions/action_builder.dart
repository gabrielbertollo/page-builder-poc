import '../../entities/action.dart';
import 'cancel_action_serializer.dart';
import 'modal_action_serializer.dart';
import 'navigation_action_serializer.dart';
import 'refresh_action_serializer.dart';
import 'submit_action_serializer.dart';

class ActionSerializer {
  static Action fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'modal':
        return ModalActionSerializer.fromJson(json);
      case 'navigation':
        return NavigationActionSerializer.fromJson(json);
      case 'cancel':
        return CancelActionSerializer.fromJson(json);
      case 'submit':
        return SubmitActionSerializer.fromJson(json);
      case 'refresh':
        return RefreshActionSerializer.fromJson(json);
      default:
        throw Exception('Invalid action type');
    }
  }
}
