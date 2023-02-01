import 'package:chatappai/constants.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const BackButton(),
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/user_2.png"),
          ),
          const SizedBox(width: kDefaultPadding * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Chat GPT V3",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Active",
                style: TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      ),
      // actions: [
      //   IconButton(
      //     icon: const Icon(Icons.local_phone),
      //     onPressed: () {},
      //   ),
      //   IconButton(
      //     icon: const Icon(Icons.videocam),
      //     onPressed: () {},
      //   ),
      //   const SizedBox(width: kDefaultPadding / 2),
      // ],
    );
  }
}
