import 'dart:developer';

import 'package:flutter/material.dart';

import 'button_component.dart';
import 'file_input_component.dart';
import 'text_input_component.dart';

class FormComponent extends StatefulWidget {
  final List<Widget> children;
  final GlobalKey<FormState> formKey;
  final String submitText;

  const FormComponent({
    required this.children,
    required this.formKey,
    this.submitText = 'Submit',
    super.key,
  });

  @override
  State<FormComponent> createState() => _FormComponentState();
}

class _FormComponentState extends State<FormComponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Form(
        key: widget.formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...widget.children,
              const SizedBox(height: 16),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 600,
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FilledButton.tonal(
                    onPressed: () {
                      for (final element in widget.children) {
                        if (element is FileInputComponent) {
                          GlobalKey<FormFieldState> key =
                              element.inputKey as GlobalKey<FormFieldState>;
                          log(key.currentState?.value.toString() ?? '');
                        } else if (element is TextInputComponent) {
                          GlobalKey<FormFieldState> key =
                              element.inputKey as GlobalKey<FormFieldState>;
                          log(key.currentState?.value);
                        }
                      }
                    },
                    child: Text(widget.submitText),
                  ),
                ),
              ),
            ],
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
          children: [
            ...children,
            const SizedBox(height: 16),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 600,
              ),
              child: const Align(
                alignment: Alignment.bottomRight,
                child: ButtonSkeleton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
