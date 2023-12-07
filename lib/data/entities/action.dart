import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../home.dart';
import '../../view/pages/page_provider.dart';
import '../../view/widgets/form_component.dart';

abstract class Action {
  void handleInteraction({BuildContext? context});
}

class ModalAction implements Action {
  final String? modalName;

  ModalAction({this.modalName});

  @override
  void handleInteraction({BuildContext? context}) {
    showDialog(
      context: context!,
      builder: (_) {
        return ChangeNotifierProvider.value(
          value: context.read<HomeProvider>(),
          child: context.read<PageProvider>().modals![modalName!]!,
        );
      },
    );
  }
}

class NavigationAction implements Action {
  final String? routeName;
  final String? requestUrl;

  NavigationAction({
    this.routeName,
    this.requestUrl,
  });

  @override
  void handleInteraction({BuildContext? context}) {
    Navigator.pushNamed(context!, routeName!, arguments: {
      'requestUrl': requestUrl,
    });
  }
}

class CancelAction implements Action {
  @override
  void handleInteraction({BuildContext? context}) {
    Navigator.maybePop(context!);
  }
}

class RefreshAction implements Action {
  @override
  void handleInteraction({BuildContext? context}) {
    context!.read<HomeProvider>().refresh();
  }
}

class SubmitAction implements Action {
  final String? formId;

  SubmitAction({this.formId});

  @override
  void handleInteraction({
    BuildContext? context,
    ValueNotifier<bool>? notifier,
    Function? onSuccess,
  }) async {
    await GetIt.I
        .get<FormProvider>(instanceName: formId)
        .submit(notifier: notifier);

    if (onSuccess != null) {
      onSuccess();
    }
  }
}
