import 'package:chatappai/models/Chat.dart';
import 'package:chatappai/screens/chats/components/chat_card.dart';
import 'package:chatappai/screens/messages/message_screen.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const MessagesScreen();

    Column(
      children: [
        MessagesScreen(),
        // Expanded(
        //   child: ListView.builder(
        //     itemCount: chatsData.length,
        //     itemBuilder: (context, index) => ChatCard(
        //       chat: chatsData[index],
        //       press: () => Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => MessagesScreen(),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
