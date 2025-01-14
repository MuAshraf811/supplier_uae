part of 'supplier_auth_cubit.dart';

@immutable
sealed class SupplierAuthState {}

final class SupplierAuthInitial extends SupplierAuthState {}
final class FetchingTradeLisenceState extends SupplierAuthState{} 
final class FetchingTradeLisenceSuccessState extends SupplierAuthState{}
final class FetchingTradeLisenceErrorState extends SupplierAuthState{ 
  final String error;

  FetchingTradeLisenceErrorState({required this.error}); 

}



final class UploadingTradeLisenceState extends SupplierAuthState{} 
final class  UploadingTradeLisenceSuccessState extends SupplierAuthState{}
final class  UploadingTradeLisenceErrorState extends SupplierAuthState{ 
  final String error;

  UploadingTradeLisenceErrorState({required this.error}); 

}
 


final class UploadingUserState extends SupplierAuthState{} 
final class  UploadingUserStateSuccessState extends SupplierAuthState{}
final class  UploadingUserStateErrorState extends SupplierAuthState{ 
  final String error;

  UploadingUserStateErrorState({required this.error}); 

}


final class LogingInState extends SupplierAuthState{} 
final class  LogingInSuccessState extends SupplierAuthState{}
final class  LogingInErrorState extends SupplierAuthState{ 
  final String error;

  LogingInErrorState({required this.error}); 

}



final class UpdatingSupplierDataState extends SupplierAuthState {}

final class UpdatingSupplierDataSuccessState extends SupplierAuthState {}

final class UpdateSupplierDataErrorState extends SupplierAuthState {
  final String error;

  UpdateSupplierDataErrorState({required this.error});
}


final class FetchingSupplierDataState extends SupplierAuthState {}

final class FetchingSupplierDataSuccessState extends SupplierAuthState {}

final class FetchSupplierDataErrorState extends SupplierAuthState {
  final String error;

  FetchSupplierDataErrorState({required this.error});
}


final class LoadingLogInWithGoogleState extends SupplierAuthState {}

final class SuccessLogInWithGoogleState extends SupplierAuthState {}
final class NewUserState extends SupplierAuthState {}

final class ErrorLogInWithGoogleState extends SupplierAuthState {
  final String error;

  ErrorLogInWithGoogleState({required this.error});
}

final class LoadingLogInWithAppleState extends SupplierAuthState {}
final class NewUserStata extends SupplierAuthState {}


final class SuccessLogInWithAppleState extends SupplierAuthState {}

final class ErrorLogInWithAppleState extends SupplierAuthState {
  final String error;

  ErrorLogInWithAppleState({required this.error});
}