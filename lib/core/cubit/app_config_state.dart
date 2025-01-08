part of 'app_config_cubit.dart';

sealed class AppConfigState {}  
final class ConfigIntialState extends AppConfigState{}
final class LanguageChangeState extends AppConfigState{}