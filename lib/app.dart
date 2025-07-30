import 'package:supplier_app/core/cubit/app_config_cubit.dart';
import 'package:supplier_app/core/routes/app_router.dart';
import 'package:supplier_app/core/utils/service_locator.dart';
import 'package:supplier_app/generated/l10n.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/configurations.dart';
import 'core/utils/constants/route_constants.dart';
import 'core/utils/constants/storage_const.dart';
import 'core/utils/storage/shared_preferences.dart';
import 'features/client/Authentication/presentation/controllers/auth/authentication_cubit.dart';
import 'features/supplier/Authentication/presentation/cubit/supplier_auth_cubit.dart';
import 'features/supplier/notifications/presentation/cubit/notification_cubit.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class EPrinter extends StatelessWidget {
  const EPrinter({super.key});

  @override
  Widget build(BuildContext context) {
   NotificationsManager().initialize();

    initErrorHandling();
    AppConfigCubit.currentUserDataId = SharedPreferencesManager.getStringValue(key: StorageConstants.userDataIdKey);
    AppConfigCubit.currentUserId = SharedPreferencesManager.getStringValue(key: StorageConstants.userId);
    AppConfigCubit.isLogged = SharedPreferencesManager.getBoolValue(key: StorageConstants.isUserLoggedKey)??false;
    AppConfigCubit.isSupplier = SharedPreferencesManager.getBoolValue(key: StorageConstants.isSupplierKey)??false;
    AppConfigCubit.isBoarded = SharedPreferencesManager.getBoolValue(key: StorageConstants.isBoardedKey)??false;
    AppConfigCubit.isEnglish = SharedPreferencesManager.getBoolValue(key: StorageConstants.isEnglishKey)??true;

    NotificationsCubit().clearNotifications();
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppConfigCubit>(
            create: (context) =>
                AppConfigCubit(),
          ),
          BlocProvider<AuthenticationCubit>(
            create: (context) =>
            ServiceLocator.getIt<AuthenticationCubit>(),
            // ServiceLocator.getIt<AuthenticationCubit>()..getUserData(),
            // AuthenticationCubit()..getUserData(),
          ),
          BlocProvider<SupplierAuthCubit>(
            create: (context) =>
            ServiceLocator.getIt<SupplierAuthCubit>() ,
            // AuthenticationCubit()..getUserData(),
          ),
        ],
        child: BlocBuilder<AppConfigCubit, AppConfigState>(
          builder: (context , state)=> MaterialApp(
            navigatorKey: navigatorKey,
            localizationsDelegates:const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                locale: AppConfigCubit.isEnglish? const Locale("en")
                    :const Locale("ar"),
            debugShowCheckedModeBanner: false,
            initialRoute: 
            // RouteConstants.suppCompleteLoginView,
            AppConfigCubit.isBoarded?
            ( AppConfigCubit.isLogged?
                  ( AppConfigCubit.isSupplier?
                      RouteConstants.supplierHomeView:
                      RouteConstants.homePage
                  )
                : RouteConstants.firstView
            )
                :RouteConstants.onBoardingView,
            onGenerateRoute: AppRouter.onGenerateRoute,
            theme: ThemeData(

            ),
          ),
        ),
      ),
    );
  }


  void initErrorHandling() {
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.dumpErrorToConsole(details);
      
      if (navigatorKey.currentState?.mounted ?? false) {
        showDialog(
          context: navigatorKey.currentState!.context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Oops, Something went wrong'),
              content: const SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Text(details.exceptionAsString()),
                     SizedBox(height: 16),
                     Text('Please try again or contact support if the problem persists.'),
                  ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  };
  }
}
