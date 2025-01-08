part of 'quotation_cubit.dart';

@immutable
sealed class QuotationState {}

final class QuotationInitial extends QuotationState {}
final class AddingQuotationState extends QuotationState{} 
final class AddingQuotationSuccessState extends QuotationState{}
final class AddingQuotationErrorState extends QuotationState{ 
  final String error;

  AddingQuotationErrorState({required this.error});
   
}