part of 'authentication_cubit.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class LoadingAuthenticationWithEmailState extends AuthenticationState {}

final class SuccessAuthenticationWithEmailState extends AuthenticationState {}

final class ErrorAuthenticationWithEmailState extends AuthenticationState {
  final String error;

  ErrorAuthenticationWithEmailState({required this.error});
}

final class LoadingLogInWithEmailState extends AuthenticationState {} 
final class LoadingAddingUserState extends AuthenticationState {}


final class SuccessLogInWithEmailState extends AuthenticationState {}

final class ErrorLogInWithEmailState extends AuthenticationState {
  final String error;

  ErrorLogInWithEmailState({required this.error});
}

final class LoadingLogInWithGoogleState extends AuthenticationState {}

final class SuccessLogInWithGoogleState extends AuthenticationState {}

final class ErrorLogInWithGoogleState extends AuthenticationState {
  final String error;

  ErrorLogInWithGoogleState({required this.error});
} 

final class LoadingLogInWithAppleState extends AuthenticationState {} 
final class NewUserState extends AuthenticationState {}


final class SuccessLogInWithAppleState extends AuthenticationState {}

final class ErrorLogInWithAppleState extends AuthenticationState {
  final String error;

  ErrorLogInWithAppleState({required this.error});
}



final class AddingUserDataState extends AuthenticationState {}

final class AddingUserDataSuccessState extends AuthenticationState {}

final class AddingUserDataErrorState extends AuthenticationState {
  final String error;

  AddingUserDataErrorState({required this.error});
} 
final class FetchingUserDataState extends AuthenticationState {}

final class FetchingUserDataSuccessState extends AuthenticationState {}

final class FetchUserDataErrorState extends AuthenticationState {
  final String error;

  FetchUserDataErrorState({required this.error});
}



final class UpdatingUserDataState extends AuthenticationState {}

final class UpdatingUserDataSuccessState extends AuthenticationState {}

final class UpdateUserDataErrorState extends AuthenticationState {
  final String error;

  UpdateUserDataErrorState({required this.error});
}



final class SendingPasswordResetEmailState extends AuthenticationState {}

final class SendingPasswordResetEmailSuccessState extends AuthenticationState {}

final class SendingPasswordResetEmailErrorState extends AuthenticationState {
  final String error;

  SendingPasswordResetEmailErrorState({required this.error});
}
final class PassFieldChangedState extends AuthenticationState {}
