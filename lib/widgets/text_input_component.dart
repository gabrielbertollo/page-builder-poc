import 'package:flutter/material.dart';

class TextInputComponent extends StatefulWidget {
  final String label;
  final String? initialValue;
  final GlobalKey<FormFieldState>? inputKey;
  final bool isRequired;

  const TextInputComponent({
    required this.label,
    this.initialValue,
    this.inputKey,
    this.isRequired = false,
    super.key,
  });

  @override
  State<TextInputComponent> createState() => _TextInputComponentState();
}

class _TextInputComponentState extends State<TextInputComponent> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller = TextEditingController(text: widget.initialValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 600,
        ),
        child: TextFormField(
          key: widget.inputKey,
          controller: _controller,
          validator: (value) {
            if (widget.isRequired && (value == null || value.isEmpty)) {
              return 'This field is required';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: widget.label,
            filled: true,
          ),
        ),
      ),
    );
  }
}
