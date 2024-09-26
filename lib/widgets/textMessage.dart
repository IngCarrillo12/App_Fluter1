import 'package:flutter/material.dart';

class Textmessage extends StatelessWidget {
  final String message;
  final String title;
  final IconData? icon;

  const Textmessage({
    super.key,
    required this.message,
    required this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Courier',
            ),
          ),
          Flexible(
            child: Row(
              children: [
                if (icon != null) Icon(icon),
                const SizedBox(width: 10), 
                Flexible(
                  child: Text(
                    message,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Courier',
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.visible,
                    softWrap: true, 
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
