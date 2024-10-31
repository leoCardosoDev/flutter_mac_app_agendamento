import 'package:flutter/material.dart';

class AlertArea extends StatefulWidget {
  const AlertArea({super.key});

  @override
  State<AlertArea> createState() => _AlertAreaState();
}

class _AlertAreaState extends State<AlertArea> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffc3e9e9),
          borderRadius: BorderRadius.circular(9),
        ),
        padding: const EdgeInsets.all(24),
        child: const Row(
          children: [
            Expanded(child: Text('Este é um alerta de texto')),
            Icon(
              Icons.check_circle_outline_outlined,
              color: Color(0xff1EE0CC),
            )
          ],
        ),
      ),
    );
  }
}
