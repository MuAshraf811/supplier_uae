import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ntp/ntp.dart';
import 'package:supplier_app/core/cubit/app_config_cubit.dart';
import 'package:supplier_app/core/utils/configurations.dart';
import 'core/bloc_observer/bloc_observer.dart';
import 'core/utils/constants/storage_const.dart';
import 'firebase_options.dart';
import 'package:supplier_app/app.dart';
import 'package:supplier_app/core/utils/constants/app_const.dart';
import 'package:supplier_app/core/utils/service_locator.dart';
import 'package:supplier_app/core/utils/storage/shared_preferences.dart';
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
    anonKey: dotenv.env["SUPA_BASE_KEY"] ??
        "NO KEY FOUND", // Replace with your Supabase Anon Key
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_handleBackGroundFirebaseMessage);
  await NotificationsManager().initialize();

  AppConfigCubit.currentUserDataId = SharedPreferencesManager.getStringValue(
      key: StorageConstants.userDataIdKey);
  AppConfigCubit.currentUserId = SharedPreferencesManager.getStringValue(
      key: StorageConstants.userDataIdKey);
  AppConfigCubit.isLogged = SharedPreferencesManager.getBoolValue(
          key: StorageConstants.isUserLoggedKey) ??
      false;
  AppConfigCubit.isSupplier = SharedPreferencesManager.getBoolValue(
          key: StorageConstants.isSupplierKey) ??
      false;
  AppConfigCubit.isBoarded = SharedPreferencesManager.getBoolValue(
          key: StorageConstants.isBoardedKey) ??
      false;
  AppConfigCubit.isEnglish = SharedPreferencesManager.getBoolValue(
          key: StorageConstants.isEnglishKey) ??
      true;

  runApp(
      AppExpiryWrapper(
      expiryDate: DateTime(2025, 8, 5),
      child: const EPrinter()
      )
  );
}

Future<void> _handleBackGroundFirebaseMessage(RemoteMessage message) async {
  await Firebase.initializeApp();
}

class AppExpiryWrapper extends StatefulWidget {
  final DateTime expiryDate;
  final Widget child;

  const AppExpiryWrapper({
    super.key,
    required this.expiryDate,
    required this.child,
  });

  @override
  State<AppExpiryWrapper> createState() => _AppExpiryWrapperState();
}

class _AppExpiryWrapperState extends State<AppExpiryWrapper> {
  late Future<DateTime> _networkTime;
  bool _isExpired = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _networkTime = _getNetworkTime();
  }

  Future<DateTime> _getNetworkTime() async {
    try {
      final DateTime networkTime = await NTP.now();
      setState(() {
        _isExpired = networkTime.isAfter(widget.expiryDate);
        _hasError = false;
      });
      return networkTime;
    } catch (e) {
      setState(() => _hasError = true);
      return DateTime.now(); // Fallback that won't affect the expired check
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DateTime>(
      future: _networkTime,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        if (_hasError) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: NoInternetScreen(),
          );
        }

        if (_isExpired) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: ExpiryScreen(),
          );
        }

        return widget.child;
      },
    );
  }
}

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'No Internet Connection',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            const Text('Please connect to the internet to continue'),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Add logic to retry time fetch
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpiryScreen extends StatelessWidget {
  const ExpiryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Application Crashed',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('This application is no longer available',textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text('Please contact Supplier support team to report this issue',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,),),
            SizedBox(height: 20),
            Text('at support@supplieruae.com',textAlign: TextAlign.center,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            // Add your custom message here
          ],
        ),
      ),
    );
  }
}
