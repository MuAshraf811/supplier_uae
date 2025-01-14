part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class NewMessageState extends ChatState {}


final class FetchingMessagesState extends ChatState {}
final class FetchingMessagesErrorState extends ChatState { 
  final String error;

  FetchingMessagesErrorState({required this.error});
}
final class FetchingMessagesSuccessState extends ChatState {}


final class FetchingChatMessagesSuccessState extends ChatState {
  final List<MessageprodModel> messages;

  FetchingChatMessagesSuccessState(this.messages);
}