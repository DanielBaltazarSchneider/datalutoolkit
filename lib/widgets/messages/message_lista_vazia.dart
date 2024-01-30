import 'package:datalutoolkit/extension/context/context.dart';
import 'package:flutter/material.dart';

class MessageListaVazia extends StatelessWidget {
  const MessageListaVazia({Key? key, required this.title, this.onTap, this.dense = false}) : super(key: key);

  final String title;
  final VoidCallback? onTap;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          if (!dense) SizedBox(height: context.screenHeight * 0.25),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: context.fontSize(16), fontWeight: FontWeight.w600, color: Colors.black),
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: onTap == null ? null : () => onTap!(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Clique em  ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: context.fontSize(16), fontWeight: FontWeight.w600, color: Colors.black),
                ),
                const Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(
                      Icons.add_circle,
                      color: Colors.black,
                      size: 30,
                    ),
                    Positioned(
                      right: 0,
                      bottom: -5,
                      child: Icon(
                        Icons.touch_app,
                        color: Colors.black,
                        size: 15,
                      ),
                    ),
                  ],
                ),
                Text(
                  " para cadastrar",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: context.fontSize(16), fontWeight: FontWeight.w600, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
