part of 'offers_cubit.dart';

@immutable
sealed class OffersState {}

final class OffersInitial extends OffersState {}
final class FetchingOfferState extends OffersState{} 
final class FetchingOfferSuccessState extends OffersState{}
final class FetchingOfferErrorState extends OffersState{ 
  final String error;

  FetchingOfferErrorState({required this.error}); 

}