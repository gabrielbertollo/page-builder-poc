import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'file_input_component.dart';
import 'text_input_component.dart';

class FormProvider extends ChangeNotifier {
  final String action;
  final String method; // TODO enum
  final List<Widget> fields;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FormProvider({
    required this.action,
    required this.method,
    required this.fields,
  });

  void refresh() {
    notifyListeners();
  }

  Future<void> submit({ValueNotifier<bool>? notifier}) async {
    if (notifier != null) notifier.value = true;

    formKey.currentState?.save();

    await Future.delayed(const Duration(milliseconds: 800));

    for (final field in fields) {
      if (field is FileInputComponent) {
        GlobalKey<FormFieldState> key =
            field.inputKey as GlobalKey<FormFieldState>;
        log(key.currentState?.value.toString() ?? '');
      } else if (field is TextInputComponent) {
        GlobalKey<FormFieldState> key =
            field.inputKey as GlobalKey<FormFieldState>;
        log(key.currentState?.value.toString() ?? '');
      }
    }

    if (notifier != null) notifier.value = false;

    /// TODO submit form with url and method
    /// if (widget.method == 'POST') {
    ///  await Dio().post(widget.url, data: widget.data);
    /// } else if (widget.method == 'PUT') {
    /// ...
  }
}

class FormComponent extends StatelessWidget {
  final String id;
  final List<Widget> children;
  final String? action;
  final String? method;

  const FormComponent({
    required this.id,
    required this.children,
    this.action,
    this.method = 'POST',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (GetIt.I.isRegistered<FormProvider>(instanceName: id)) {
      GetIt.I.unregister<FormProvider>(instanceName: id);
    }
    GetIt.I.registerSingleton<FormProvider>(
      FormProvider(
        action: action ?? '',
        method: method ?? 'POST',
        fields: children,
      ),
      instanceName: id,
    );

    return SizedBox(
      width: double.infinity,
      child: Form(
        key: GetIt.I.get<FormProvider>(instanceName: id).formKey,
        child: SingleChildScrollView(
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }
}

class FormSkeleton extends StatelessWidget {
  final List<Widget> children;

  const FormSkeleton({
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
