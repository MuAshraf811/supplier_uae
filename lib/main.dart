import 'package:firebase_core/firebase_core.dart';
import 'package:supplier/core/cubit/app_config_cubit.dart';
import 'package:supplier/core/utils/configurations.dart';
import 'firebase_options.dart';
import 'package:supplier/app.dart';
import 'package:supplier/core/utils/constants/app_const.dart';
import 'package:supplier/core/utils/service_locator.dart';
import 'package:supplier/core/utils/storage/shared_preferences.dart';
import 'package:supplier/core/utils/widgets/custom_error_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "supa_keys.env");

  SharedPreferencesManager.init(); 
  ServiceLocator.setObjects();  
   await Supabase.initialize(
    url: AppConst.supabaseUrl, 
   anonKey: dotenv.env["SUPA_BASE_KEY"]??"NO KEY FOUND", // Replace with your Supabase Anon Key
  ); 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
   FirebaseMessaging.onBackgroundMessage(_handleBackGroundFirebaseMessage); 
  await Configurations.initializeFCM();
   FlutterError.onError = (FlutterErrorDetails details){ 
    FlutterError.dumpErrorToConsole(details); 
    runApp(CustomErrorWidget(errorMessage: details));
   };

  AppConfigCubit.isUserLogged = SharedPreferencesManager.getBoolValue(key: AppConst.isUserLogged)??false;
  AppConfigCubit.isSupplier = SharedPreferencesManager.getBoolValue(key: AppConst.isSupplier)??false;
  AppConfigCubit.isBoarded = SharedPreferencesManager.getBoolValue(key: AppConst.isBoarded)??false;
  AppConfigCubit.isEnglish = SharedPreferencesManager.getBoolValue(key: AppConst.isEnglish)??true;

  runApp(const EPrinter());
}


Future<void> _handleBackGroundFirebaseMessage(RemoteMessage message)async{ 
  await Firebase.initializeApp();
}