import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/constants/storage_const.dart';
import '../utils/storage/shared_preferences.dart';
part "app_config_state.dart";

class AppConfigCubit extends Cubit<AppConfigState> {
  AppConfigCubit():super(ConfigIntialState());
  static bool isEnglish = true;
  static bool isBoarded = false;
  static bool isLogged = false;
  static bool isSupplier = false;
  static String currentUserDataId = '';
  static String currentUserId = '';
  changeLanguage(String val){
    val == "English"? isEnglish=true:isEnglish=false;

    SharedPreferencesManager.storeBoolValue(
        key: StorageConstants.isEnglishKey, value: isEnglish);

    emit(LanguageChangeState());
  }




}