import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String label;

  const ButtonWidget({
    super.key,
    required this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.blue,
        height: 30.0,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
