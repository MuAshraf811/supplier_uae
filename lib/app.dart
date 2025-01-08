import 'package:supplier/core/cubit/app_config_cubit.dart';
import 'package:supplier/core/routes/app_router.dart';
import 'package:supplier/core/utils/service_locator.dart';
import 'package:supplier/generated/l10n.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/constants/app_const.dart';
import 'core/utils/constants/route_constants.dart';
import 'core/utils/storage/shared_preferences.dart';
import 'features/client/Authentication/presentation/controllers/auth/authentication_cubit.dart';

class EPrinter extends StatelessWidget {
  const EPrinter({super.key});

  @override
  Widget build(BuildContext context) {
    AppConfigCubit.isUserLogged = SharedPreferencesManager.getBoolValue(key: AppConst.isUserLogged)??false;
    AppConfigCubit.userDataId = SharedPreferencesManager
        .getStringValue(key: AppConst.userDataId);
    if(AppConfigCubit.userDataId == "No Value Found"){
      AppConfigCubit.userDataId = '';
    }
    AppConfigCubit.isSupplier = SharedPreferencesManager.getBoolValue(key: AppConst.isSupplier)??false;
    AppConfigCubit.isBoarded = SharedPreferencesManager.getBoolValue(key: AppConst.isBoarded)??false;
    AppConfigCubit.isEnglish = SharedPreferencesManager.getBoolValue(key: AppConst.isEnglish)??true;

    print('isLogged: ${AppConfigCubit.isUserLogged}');
    print('userDataId: ${AppConfigCubit.userDataId}');
    print('isBoarded: ${AppConfigCubit.isBoarded}');
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
            AuthenticationCubit()..getUserData(),
            // AuthenticationCubit()..getUserData(),
          ),
        ],
        child: BlocBuilder<AppConfigCubit, AppConfigState>(
          builder: (context , state)=> MaterialApp(
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
            AppConfigCubit.isBoarded?
            ( AppConfigCubit.isUserLogged?
                  ( AppConfigCubit.isSupplier?
                      RouteConstants.supplierHomeView:
                      RouteConstants.homePage
                  )
                : RouteConstants.userTypeView
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
}
