import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supplier/core/cubit/app_config_cubit.dart';
import 'package:supplier/core/utils/configurations.dart';
import 'core/bloc_observer/bloc_observer.dart';
import 'core/utils/constants/storage_const.dart';
import 'firebase_options.dart';
import 'package:supplier/app.dart';
import 'package:supplier/core/utils/constants/app_const.dart';
import 'package:supplier/core/utils/service_locator.dart';
import 'package:supplier/core/utils/storage/shared_preferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "supa_keys.env");
  Bloc.observer = MyBlocObserver();

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
  await NotificationsManager().initialize();

  AppConfigCubit.currentUserDataId = SharedPreferencesManager.getStringValue(key: StorageConstants.userDataIdKey);
  AppConfigCubit.currentUserId = SharedPreferencesManager.getStringValue(key: StorageConstants.userDataIdKey);
  AppConfigCubit.isLogged = SharedPreferencesManager.getBoolValue(key: StorageConstants.isUserLoggedKey)??false;
  AppConfigCubit.isSupplier = SharedPreferencesManager.getBoolValue(key: StorageConstants.isSupplierKey)??false;
  AppConfigCubit.isBoarded = SharedPreferencesManager.getBoolValue(key: StorageConstants.isBoardedKey)??false;
  AppConfigCubit.isEnglish = SharedPreferencesManager.getBoolValue(key: StorageConstants.isEnglishKey)??true;

  // runApp(DevicePreview(builder: (context) => const EPrinter(),));
  runApp(const EPrinter());
}


Future<void> _handleBackGroundFirebaseMessage(RemoteMessage message)async{ 
  await Firebase.initializeApp();
}


