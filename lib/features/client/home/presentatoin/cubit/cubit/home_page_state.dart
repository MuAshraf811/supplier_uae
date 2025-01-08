part of 'home_page_cubit.dart';


sealed class HomePageState {}

final class HomePageInitial extends HomePageState {}

final class RadioCurrentChoice extends HomePageState {
  final String choice;
   int choiceIndex = 0;

   RadioCurrentChoice({required this.choice, required this.choiceIndex});
}
