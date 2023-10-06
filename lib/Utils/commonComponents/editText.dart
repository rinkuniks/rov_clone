import 'package:flutter/material.dart';

class EditText extends StatefulWidget {
  final String labelText;
  final int? maxLen;
  final TextEditingController myController;
  final ValueChanged<String>? onChange;
  final TextInputType? inputType;

  const EditText({
    super.key,
    required this.labelText,
    this.maxLen,
    required this.myController,
    this.onChange,
    this.inputType,
  });

  @override
  State<EditText> createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(color: Colors.white),
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10),
            child: TextField(
              controller: widget.myController,
              onChanged: widget.onChange,
              textAlign: TextAlign.start,
              maxLength: widget.maxLen ?? 250,
              keyboardType: widget.inputType ?? TextInputType.text,
              decoration: InputDecoration(
                counterText: "",
                labelText: widget.labelText,
                labelStyle: const TextStyle(
                  color: Colors.black87,
                ),
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
