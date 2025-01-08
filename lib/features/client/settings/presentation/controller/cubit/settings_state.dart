part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}
final class LaunchingUrlErrorState extends SettingsState{ 
  final String error;

  LaunchingUrlErrorState({required this.error});
} 


