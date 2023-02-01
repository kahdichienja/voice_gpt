import 'package:chatappai/constants.dart';
import 'package:chatappai/providers/tts_stt_message_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'chat_input_field.dart';
import 'message.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<TextToSpeechSpeechToTextMessageProvider>(
          builder: (context, tts, child) {
            return Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ListView.builder(
                  itemCount: tts.demeChatMessages.toList().length,
                  controller: tts.scrollcontroller,
                  itemBuilder: (context, index) =>
                      Message(message: tts.demeChatMessages.toList()[index]),
                ),
              ),
            );
          },
        ),
        const ChatInputField(),
      ],
    );
  }
}
