import 'package:flutter/material.dart';

class ChatInputField extends StatelessWidget {
  final Function(String) onSend;
  final TextEditingController _controller = TextEditingController();

  ChatInputField({required this.onSend});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 10, top: 10, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Row(
        children: [
          Icon(Icons.emoji_emotions, color: Colors.grey),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Type message here...',
                border: InputBorder.none,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (_controller.text.trim().isNotEmpty) {
                onSend(_controller.text.trim());
                _controller.clear();
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF7A4DFF),
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(12),
              child: Icon(Icons.send, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
