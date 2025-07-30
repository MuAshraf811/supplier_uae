import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
<<<<<<< HEAD
import 'package:supplier/core/utils/constants/storage_const.dart';
import 'package:supplier/core/utils/native/image_picker.dart';
import 'package:supplier/core/utils/storage/shared_preferences.dart';
import 'package:supplier/features/client/chat/model/message_prod_model.dart';
=======
import 'package:supplier_app/core/utils/constants/app_const.dart';
import 'package:supplier_app/core/utils/constants/storage_const.dart';
import 'package:supplier_app/core/utils/native/image_picker.dart';
import 'package:supplier_app/core/utils/storage/shared_preferences.dart';
import 'package:supplier_app/features/client/chat/model/message_model.dart';
import 'package:supplier_app/features/client/chat/model/message_prod_model.dart';
>>>>>>> 057b281301ca97393404df537bfcf6817dae9f82
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  final ScrollController chatScrollController = ScrollController();
  final TextEditingController messageController = TextEditingController();
  final chatTextFieldKey = GlobalKey<FormState>();
  // List<MessageModel> allMessages = AppConst.chatMessagesExamples;
  List<MessageprodModel>? allChatMessages = [];

  String? imagepath;
StreamSubscription? messageSubscription;


  void fetchMessages() {
    messageSubscription = getMessagesStream().listen(
      (messages) {  
        
        log("Step 2 : $messages");
        emit(FetchingChatMessagesSuccessState(messages));
      },
      onError: (error) {
        emit(FetchingMessagesErrorState( error:  error.toString()));
      },
    );
  }


  Stream<List<MessageprodModel>> getMessagesStream() {
    return FirebaseFirestore.instance
        .collection("Chat")
        .doc(SharedPreferencesManager.getStringValue(
            key: StorageConstants.userDataIdKey))
        .collection("messages")
        .orderBy('time', descending: true)
        .snapshots()
        .map((snapshot) { 
          log('Step 1 : $snapshot');
          return snapshot.docs
            .map((doc) => MessageprodModel.fromJson(doc.data()))
            .toList();
        });
  }

  void setUpScrollControllerConfigs() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (chatScrollController.hasClients) {
          chatScrollController
              .jumpTo(chatScrollController.position.maxScrollExtent);
        }
      },
    );
  }

  void getAllmessages() async {
    try {
      // await FirebaseFirestore.instance
      //   .collection("chat_owners").add({
      //     "userIdForChat": SharedPreferencesManager.getStringValue(key: StorageConstants.userDataId),
      //   });

      final res = await FirebaseFirestore.instance
          .collection("Chat")
          .doc(SharedPreferencesManager.getStringValue(
              key: StorageConstants.userDataIdKey))
          .collection("messages")
          .orderBy("time", descending: false)
          .get();
      final List<QueryDocumentSnapshot<Map<String, dynamic>>> response =
          res.docs;
      final chats =
          response.map((e) => MessageprodModel.fromJson(e.data())).toList();

      allChatMessages = [...chats];

      emit(FetchingMessagesSuccessState());
    } catch (e) {
      log(e.toString());
      emit(FetchingMessagesErrorState(error: e.toString()));
    }
  }

  void sendAMessage({String? customMsg}) async {
    try {
      MessageprodModel message = MessageprodModel(
        message: customMsg?? messageController.text,
        time:
            "${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}:${DateTime.now().second.toString().padLeft(2, '0')}",
        userId: SharedPreferencesManager.getStringValue(
            key: StorageConstants.userDataIdKey),
      );
      await FirebaseFirestore.instance
          .collection("Chat")
          .doc(SharedPreferencesManager.getStringValue(
              key: StorageConstants.userDataIdKey))
          .collection("messages")
          .add(
            message.toMap(),
          );

      getAllmessages();
    } catch (e) {
      log(e.toString());
      emit(FetchingMessagesErrorState(error: e.toString()));
    }
  }

  // void sendMessage() {
  //   final message = messageController.text;
  //   AppConst.chatMessagesExamples.add(
  //     MessageModel(
  //       message: message,
  //       time: "${DateTime.now().hour}:${DateTime.now().minute}",
  //       isSender: true,
  //     ),
  //   );
  //   chatScrollController.jumpTo(chatScrollController.position.maxScrollExtent);

  //   emit(NewMessageState());
  // }

  void pickImage({required isFromCamera}) async {
    imagepath =
        await ImagePickerHelper.pick(isFromCamera).then((val) => val?.path);
  }

  @override
  Future<void> close() {
    messageController.dispose();
    chatScrollController.dispose(); 
        messageSubscription?.cancel();

    return super.close();
  }

  void ploadImages() {}
}
