import 'package:flutter/material.dart';

class FileInputComponent extends FormField<List<String>?> {
  final GlobalKey<FormFieldState>? inputKey;

  FileInputComponent({
    required String label,
    List<String>? initialValue,
    FormFieldSetter<List<String>?>? onSaved,
    bool isRequired = false,
    this.inputKey,
    Key? key,
  }) : super(
          key: inputKey,
          initialValue: initialValue,
          onSaved: onSaved,
          validator: (value) {
            if (isRequired && (value == null || value.isEmpty)) {
              return 'This field is required';
            }
            return null;
          },
          builder: (FormFieldState<List<String>?> state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 600,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: [
                              ...(state.value ?? []).map(
                                (e) => Chip(
                                  label: Text(e),
                                  onDeleted: () {
                                    state.didChange(
                                      state.value!
                                          .where((element) => element != e)
                                          .toList(),
                                    );
                                  },
                                ),
                              ),
                              FilledButton(
                                onPressed: () {},
                                child: const Text('Adicionar'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (state.hasError)
                      Text(
                        state.errorText!,
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );

  @override
  FormFieldState<List<String>?> createState() => _FileInputComponentState();
}

class _FileInputComponentState extends FormFieldState<List<String>?> {
  FileInputComponent get _widget => super.widget as FileInputComponent;

  @override
  void initState() {
    setValue(_widget.initialValue);
    super.initState();
  }
}

class FileInputSkeleton extends StatelessWidget {
  const FileInputSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 600,
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Flexible(
                //   fit: FlexFit.tight,
                //   child: Wrap(
                //     spacing: 8.0,
                //     runSpacing: 8.0,
                //     children: [
                //       ButtonSkeleton(
                //         characterLength: 125,
                //       )
                //     ],
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
