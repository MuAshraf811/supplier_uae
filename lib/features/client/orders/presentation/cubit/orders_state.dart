part of 'orders_cubit.dart';

@immutable
sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}
final class AddingOrderState extends OrdersState{} 
final class AddingOrderSuccessState extends OrdersState{}
final class AddingOrderErrorState extends OrdersState{ 
  final String error ;

  AddingOrderErrorState({required this.error}); 

} 
final class FetchingOrderState extends OrdersState{} 
final class FetchingOrderSuccessState extends OrdersState{}
final class FetchingOrderErrorState extends OrdersState{ 
  final String error ;

  FetchingOrderErrorState({required this.error}); 

}