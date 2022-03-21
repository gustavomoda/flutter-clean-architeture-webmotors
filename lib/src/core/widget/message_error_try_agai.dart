import 'package:flutter/material.dart';

class MessageErrorTryAgain extends StatelessWidget {
  const MessageErrorTryAgain({
    Key? key,
    required this.message,
    required this.onPressed,
  }) : super(key: key);

  final String message;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(message, textAlign: TextAlign.center),
            TextButton(onPressed: onPressed, child: const Text('Tentar novamente'))
          ],
        ),
      );
}
