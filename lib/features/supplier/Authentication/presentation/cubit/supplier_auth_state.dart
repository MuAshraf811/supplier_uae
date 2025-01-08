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

