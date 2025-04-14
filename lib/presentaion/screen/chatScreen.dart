import 'package:devloper_app/presentaion/screen/widget/ChatBubble.dart';
import 'package:flutter/material.dart';

import 'widget/ChatInputField.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();

  List<Map<String, dynamic>> messages = [
    {'text': 'مرحبا بك، كيف أقدر أساعدك؟', 'isMe': false},
    {'text': 'أريد معرفة فرص التدريب المتاحة', 'isMe': true},
  ];

  @override
  void initState() {
    super.initState();
    // نمرر للأسفل بعد فتح الصفحة
    WidgetsBinding.instance.addPostFrameCallback((_) => scrollToBottom());
  }

  void scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void sendMessage(String text) {
    setState(() {
      messages.add({'text': text, 'isMe': true});
    });
    Future.delayed(Duration(milliseconds: 100),
        scrollToBottom); // التمرير للأسفل بعد إضافة الرسالة
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7A4DFF),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.all(16),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return ChatBubble(
                      text: messages[index]['text'],
                      isMe: messages[index]['isMe'],
                    );
                  },
                ),
              ),
            ),
            ChatInputField(onSend: sendMessage),
          ],
        ),
      ),
    );
  }
}
