import 'dart:developer';

import 'package:supplier_app/core/utils/url_launcher_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 


part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial()); 

 void launchUrl({required String url})async{  

try {
  await UrlLauncherHandler.go(url: url); 
  
} catch (e) { 
  log(e.toString());
emit(LaunchingUrlErrorState(error: e.toString()));}

 }



}
