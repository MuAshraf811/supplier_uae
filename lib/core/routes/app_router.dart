import 'package:supplier_app/core/cubit/nav_bar_cubit.dart';
import 'package:supplier_app/core/utils/constants/route_constants.dart';
import 'package:supplier_app/core/utils/service_locator.dart';
import 'package:supplier_app/features/client/Authentication/presentation/screens/complete_logIn_view.dart';
import 'package:supplier_app/features/client/Authentication/presentation/screens/forget_password_view.dart';
import 'package:supplier_app/features/client/home/presentatoin/cubit/cubit/home_page_cubit.dart';
import 'package:supplier_app/features/client/home/presentatoin/screens/detailed_item_packaging.dart';
import 'package:supplier_app/features/client/home/presentatoin/screens/detailed_packaging_view.dart';
import 'package:supplier_app/features/client/home/presentatoin/screens/other_detailed_screen.dart';
import 'package:supplier_app/features/client/settings/presentation/views/account_view.dart';
import 'package:supplier_app/features/supplier/Authentication/presentation/screens/supplier_complete_logIn_view.dart';
import 'package:supplier_app/features/onboarding&splash/first_view.dart';
import 'package:supplier_app/features/onboarding&splash/on_boarding_view.dart';
import 'package:supplier_app/features/onboarding&splash/user_type_view.dart';
import 'package:supplier_app/features/supplier/Authentication/presentation/screens/login_view.dart';
import 'package:supplier_app/features/supplier/Authentication/presentation/screens/supplier_register_view.dart';
import 'package:supplier_app/features/supplier/home/presentation/cubit/supplier_nav_bar_cubit.dart';
import 'package:supplier_app/features/supplier/home/presentation/screens/supplier_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supplier_app/features/supplier/settings/presentation/views/supplier_account_view.dart';
import '../../features/client/Authentication/presentation/screens/login_view.dart';
import '../../features/client/Authentication/presentation/screens/register_view.dart';
import '../../features/client/chat/presentation/cubit/chat_cubit.dart';
import '../../features/client/chat/presentation/views/chat_view.dart';
import '../../features/client/home/presentatoin/cubit/main_home_cubit.dart';
import '../../features/client/home/presentatoin/screens/detailed_category_item_view.dart';
import '../../features/client/home/presentatoin/screens/home_page.dart';
import '../../features/client/settings/presentation/views/terms_conditions.dart';
import '../../features/supplier/chatSupplier/presentation/cubit/chat_cubit.dart';
import '../../features/supplier/chatSupplier/presentation/views/chat_view.dart';
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
          builder: (context) => LoginView(),
        );
      case RouteConstants.termsAndConditionsSupplierView:
        return MaterialPageRoute(
          builder: (context) => const TermsAndConditionsViewSupplier(),
        );
      case RouteConstants.termsAndConditionsClientView:
        return MaterialPageRoute(
          builder: (context) => const TermsAndConditionsViewClient(),
        );
      case RouteConstants.firstView:
        return MaterialPageRoute(
          builder: (context) => const FirstView(),
        );
      case RouteConstants.changePasswordView:
        return MaterialPageRoute(
          builder: (context) => const ChangePasswordView(),
        );
      case RouteConstants.changeSupplierPasswordView:
        return MaterialPageRoute(
          builder: (context) => const SupplierChangePasswordView(),
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
          builder: (context) => AccountView(),
        );
      case RouteConstants.supplierAccountView:
        return MaterialPageRoute(
          builder: (context) => SupplierAccountView(),

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
      case RouteConstants.chatSupplierView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<SupplierChatCubit>(
            create: (context) => ServiceLocator.getIt.get<SupplierChatCubit>()
              ..setUpScrollControllerConfigs()
            ,
            child: const SupplierChatView(),
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
      case RouteConstants.supplierLogInView:
        return MaterialPageRoute(
          builder: (context) => SupplierLoginView(),
        );
      case RouteConstants.supplierRegistererView:
        return MaterialPageRoute(
          builder: (context) => const SupplierRegisterView(),
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
          builder: (context) => const RegisterView(),

        );
      case RouteConstants.completeLoginView:
        return MaterialPageRoute(
          builder: (context) =>  CompleteLoginView(),

        );
      case RouteConstants.suppCompleteLoginView:
        return MaterialPageRoute(
          builder: (context) =>  SupplierCompleteLoginView(),

        );
      case RouteConstants.forgetPasswordView:
        return MaterialPageRoute(
          builder: (context) =>  ForgetPasswordClientView(),

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
