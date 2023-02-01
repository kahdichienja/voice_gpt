import 'package:avatar_glow/avatar_glow.dart';
import 'package:chatappai/providers/tts_stt_message_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TextToSpeechSpeechToTextMessageProvider>(
      builder: (context, tts, child) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding / 2,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 32,
              color: const Color(0xFF087949).withOpacity(0.08),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  tts.listen();
                },
                child: Icon(tts.isListening ? Icons.mic : Icons.mic_none),
              ),
              const SizedBox(width: kDefaultPadding),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding * 0.75,
                  ),
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      // Icon(
                      //   Icons.sentiment_satisfied_alt_outlined,
                      //   color: Theme.of(context)
                      //       .textTheme
                      //       .bodyText1!
                      //       .color!
                      //       .withOpacity(0.64),
                      // ),
                      const SizedBox(width: kDefaultPadding / 4),
                      Expanded(
                        child: TextField(
                          controller: tts.controller,
                          decoration: const InputDecoration(
                            hintText: "Type message",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Provider.of<TextToSpeechSpeechToTextMessageProvider>(
                            context,
                            listen: false,
                          ).testChat();
                        },
                        child: Icon(
                          Icons.send,
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .color!
                              .withOpacity(0.64),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
