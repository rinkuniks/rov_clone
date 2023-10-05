import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final VoidCallback? onPressed;
  final String btnText;
  final double? mWidth;
  final double? mHeight;

  const Button({super.key,
    required this.onPressed,
    required this.btnText,
     this.mWidth,
     this.mHeight,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.mWidth ?? 200,
      height: widget.mHeight ?? 45,
      child: FilledButton(onPressed: widget.onPressed,
          child: Text(widget.btnText,
            style: const TextStyle(color: Colors.white, fontSize: 16),)),
    );
  }
}

//Choose as per your Own Button

// ElevatedButton(onPressed: onPressed, child: const Text('Elevated')),
// FilledButton(onPressed: onPressed, child: const Text('Filled')),
// FilledButton.tonal(
// onPressed: onPressed, child: const Text('Filled Tonal')),
// OutlinedButton(onPressed: onPressed, child: const Text('Outlined')),
// TextButton(onPressed: onPressed, child: const Text('Text')),
