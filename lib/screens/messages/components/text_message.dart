import 'package:chatappai/models/ChatMessage.dart';
import 'package:chatappai/providers/tts_stt_message_provider.dart';
import 'package:chatappai/screens/messages/components/audio_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    this.message,
  }) : super(key: key);

  final ChatMessage? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: MediaQuery.of(context).platformBrightness == Brightness.dark
      //     ? Colors.white
      //     : Colors.black,
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 0.75,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(message!.isSender ? 1 : 0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Consumer<TextToSpeechSpeechToTextMessageProvider>(
        builder: (context, tts, child) => Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * .7,
          ),
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${message!.text} ",
                    textAlign: TextAlign.left,
                  ),
                  if (!message!.isSender)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            tts.speek(message!.text);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: AudioMessage(message: message),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            tts.speek(message!.text);
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Icon(CupertinoIcons.mic, color: kPrimaryColor),
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
