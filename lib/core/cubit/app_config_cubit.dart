import 'package:flutter_bloc/flutter_bloc.dart'; 
part "app_config_state.dart";

class AppConfigCubit extends Cubit<AppConfigState> {
  AppConfigCubit():super(ConfigIntialState());
  static bool isEnglish = true;
  static bool isBoarded = false;
  static bool isUserLogged = false;
  static bool isSupplier = false;
  static String userDataId = '';
  changeLanguage(String val){
    val == "en"? isEnglish=true:isEnglish=false;
    emit(LanguageChangeState());
  }




}