import 'dart:async';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:chatappai/models/ChatMessage.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:text_to_speech/text_to_speech.dart';
class TextToSpeechSpeechToTextMessageProvider extends ChangeNotifier {
  final Set<ChatMessage> _chatChatMessages = <ChatMessage>{};
  Set<ChatMessage> get demeChatMessages => _chatChatMessages;
  TextToSpeech tts = TextToSpeech();

  late final ChatGPT _openAI;

  TextEditingController controller = TextEditingController();
  TextEditingController get textcontroller => controller;

  final ScrollController _scrollcontroller = ScrollController();
  ScrollController get scrollcontroller => _scrollcontroller;

  final stt.SpeechToText _speech = stt.SpeechToText();

  //sk-

  bool _isListening = false;
  bool get isListening => _isListening;

  double _confidence = 1.0;
  double get confidence => _confidence;

  final String _textspeak =
      "My name is Optimus Prime, And this message is to my creators, leave planet Earth alone ,because am coming for you!";
  String get textspeak => _textspeak;

  void init() {
    speek(textspeak);
    _openAI = ChatGPT.instance.builder(
        "sk-",
        baseOption: HttpSetup(receiveTimeout: 6000));
  }

  void speek(String val) {
    // tts.setPitch(pitch);
    tts.speak(val);
    notifyListeners();
  }


  void testChat() {
    String _res = "";
    _chatChatMessages.add(
      ChatMessage(
        text: textcontroller.text,
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isSender: true,
      ),
    );
    try {
      final request = CompleteReq(
        prompt: textcontroller.text,
        model: kTranslateModelV3,
        max_tokens: 4090,
      );
      _openAI.onCompleteStream(request: request).listen((response) {
        _res = response!.choices.first.text;
        speek(_res);
        _chatChatMessages.add(
          ChatMessage(
            text: _res,
            messageType: ChatMessageType.text,
            messageStatus: MessageStatus.viewed,
            isSender: false,
          ),
        );

        _chatChatMessages.toSet();
      });
    } catch (e) {
      debugPrint("${e.toString()} ");
    }

    _scrollcontroller.animateTo(
      scrollcontroller.position.maxScrollExtent,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 300),
    );

    controller.text = "";

    notifyListeners();
  }

  void listen() async {
    if (isListening == false) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        _isListening = true;
        _speech.listen(
          onResult: (val) {
            controller.text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          },
        );
        _isListening = false;
        testChat();
      }
    } else {
      _isListening = false;
      _speech.stop();
    }
    notifyListeners();
  }
}
