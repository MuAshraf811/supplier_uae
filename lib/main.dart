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
import 'package:sentry_flutter/sentry_flutter.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "supa_keys.env");
  Bloc.observer = MyBlocObserver();

  SharedPreferencesManager.init(); 
  ServiceLocator.setObjects();  
   await Supabase.initialize(
    url: AppConst.supabaseUrl, 
   anonKey: dotenv.env["SUPA_BASE_KEY"]??"NO KEY FOUND",  
   
    // Replace with your Supabase Anon Key
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

   await SentryFlutter.init(
    (options) {
      options.dsn = 'https://2bd27d374c952eb9105422ab091cc47a@o4509559589109760.ingest.de.sentry.io/4509559590617168'; 
       options.debug = true;
      // Adds request headers and IP for users,
      // visit: https://docs.sentry.io/platforms/dart/data-management/data-collected/ for more info
      options.sendDefaultPii = true;
    },
    appRunner: () => runApp(
      SentryWidget(
        child: const EPrinter(),
      ),
    ),
  );
 
}


Future<void> _handleBackGroundFirebaseMessage(RemoteMessage message)async{ 
  await Firebase.initializeApp();
}


