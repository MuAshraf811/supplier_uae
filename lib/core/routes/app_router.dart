import 'package:supplier/core/cubit/nav_bar_cubit.dart';
import 'package:supplier/core/utils/constants/route_constants.dart';
import 'package:supplier/core/utils/service_locator.dart';
import 'package:supplier/features/client/Authentication/presentation/controllers/auth/authentication_cubit.dart';
import 'package:supplier/features/client/Authentication/presentation/screens/complete_logIn_view.dart';
import 'package:supplier/features/client/Authentication/presentation/screens/forget_password_view.dart';
import 'package:supplier/features/client/home/presentatoin/cubit/cubit/home_page_cubit.dart';
import 'package:supplier/features/client/home/presentatoin/screens/detailed_item_packaging.dart';
import 'package:supplier/features/client/home/presentatoin/screens/detailed_packaging_view.dart';
import 'package:supplier/features/client/home/presentatoin/screens/other_detailed_screen.dart';
import 'package:supplier/features/client/settings/presentation/views/account_view.dart';
import 'package:supplier/features/onboarding&splash/first_view.dart';
import 'package:supplier/features/onboarding&splash/on_boarding_view.dart';
import 'package:supplier/features/onboarding&splash/user_type_view.dart';
import 'package:supplier/features/supplier/Authentication/presentation/cubit/supplier_auth_cubit.dart';
import 'package:supplier/features/supplier/Authentication/presentation/screens/login_view.dart';
import 'package:supplier/features/supplier/Authentication/presentation/screens/supplier_register_view.dart';
import 'package:supplier/features/supplier/home/presentation/cubit/supplier_nav_bar_cubit.dart';
import 'package:supplier/features/supplier/home/presentation/screens/filter_view.dart';
import 'package:supplier/features/supplier/home/presentation/screens/supplier_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/client/Authentication/presentation/screens/login_view.dart';
import '../../features/client/Authentication/presentation/screens/register_view.dart';
import '../../features/client/chat/presentation/cubit/chat_cubit.dart';
import '../../features/client/chat/presentation/views/chat_view.dart';
import '../../features/client/home/presentatoin/cubit/main_home_cubit.dart';
import '../../features/client/home/presentatoin/screens/detailed_category_item_view.dart';
import '../../features/client/home/presentatoin/screens/home_page.dart';
import '../../features/supplier/settings/presentation/views/terms_conditions.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.homePage:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<MainHomeCubit>(
                create: (context) => MainHomeCubit(),
              ),
              BlocProvider(
                create: (context) => NavBarCubit(),
              ),
            ],
            child: const HomePageView(),
          ),
        );
      case RouteConstants.logInView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<AuthenticationCubit>(
            create: (context) =>
            ServiceLocator.getIt<AuthenticationCubit>()..getUserData(),

            child: const LoginView(),
          ),
        );
      case RouteConstants.termsAndConditionsView:
        return MaterialPageRoute(
          builder: (context) => const TermsAndConditionsView(),
        ); 
         case RouteConstants.firstView:
        return MaterialPageRoute(
          builder: (context) => const FirstView(),
        );
      case RouteConstants.changePasswordView:
        return MaterialPageRoute(
          builder: (context) => const ChangePasswordView(),
        );
      case RouteConstants.otherDetailedView:
        final args = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (context) {
            return OtherDetailedScreen(
              data: args,
            );
          },
        );
      case RouteConstants.onBoardingView:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingView(),
        );
      case RouteConstants.accountView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<AuthenticationCubit>(
            create: (context) =>
                ServiceLocator.getIt.get<AuthenticationCubit>(),
            child: const AccountView(),
          ),
        );
      case RouteConstants.detailedItemPackagingView:
        final args = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (context) => DetailedItemPackaging(
            packageOrderIndex: args["packageOrderIndex"],
            title: args["title"],
          ),
        );
      case RouteConstants.detailedPackagingView:
        final args = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (context) => DetailedPackagingView(
            packageItemIndex: args["packageItemIndex"],
            itemTitle: args["title"],
            innerIndex: args["innerIndex"],
          ),
        );
      case RouteConstants.chatView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<ChatCubit>(
            create: (context) => ServiceLocator.getIt.get<ChatCubit>()
              ..setUpScrollControllerConfigs()
              ,
            child: const ChatView(),
          ),
        );
      case RouteConstants.detailedItemCategoryView:
        final args = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => BlocProvider<HomePageCubit>(
            create: (context) => HomePageCubit(),
            child: DetailedCategoryItemView(
              categoryItemIndex: args,
            ),
          ),
        );
      // case RouteConstants.supplierFilterView:
      //   return MaterialPageRoute(
      //     builder: (context) => const FilterView(),
      //   );
      case RouteConstants.supplierLogInView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<SupplierAuthCubit>(
            create: (context) => SupplierAuthCubit(),
            child: const SupplierLoginView(),
          ),
        );
      case RouteConstants.supplierRegistererView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<SupplierAuthCubit>(
            create: (context) => ServiceLocator.getIt.get<SupplierAuthCubit>(),
            child: const SupplierRegisterView(),
          ),
        );
      case RouteConstants.supplierHomeView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<SupplierNavBarCubit>(
            create: (context) => SupplierNavBarCubit(),
            child: const SupplierHomeView(),
          ),
        );
      case RouteConstants.registerView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<AuthenticationCubit>(
            create: (context) =>
            ServiceLocator.getIt<AuthenticationCubit>()..getUserData(),

            child: const RegisterView(),
          ),
        ); 
        case RouteConstants.completeLoginView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<AuthenticationCubit>(
            create: (context) =>
            ServiceLocator.getIt<AuthenticationCubit>()..getUserData(),

            child: const CompleteLoginView(),
          ),
        );
      case RouteConstants.forgetPasswordView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<AuthenticationCubit>(
            create: (context) =>
            ServiceLocator.getIt<AuthenticationCubit>()..getUserData(),

            child: const ForgetPasswordClientView(),
          ),
        );
      case RouteConstants.userTypeView:
        return MaterialPageRoute(
          builder: (context) => const UserTypeView(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const HomePageView(),
        );
    }
  }
}
