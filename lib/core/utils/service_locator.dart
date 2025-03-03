import 'package:firebase_auth/firebase_auth.dart';
import 'package:supplier/core/utils/notification_service.dart';
import 'package:supplier/features/client/Authentication/otp/otp_remote_data_source_firebase_impl.dart';
import 'package:supplier/features/client/Authentication/presentation/controllers/auth/authentication_cubit.dart';
import 'package:supplier/features/client/chat/presentation/cubit/chat_cubit.dart';
import 'package:supplier/features/client/orders/presentation/cubit/orders_cubit.dart';
import 'package:supplier/features/client/settings/presentation/controller/cubit/settings_cubit.dart';
import 'package:supplier/features/supplier/Authentication/presentation/cubit/supplier_auth_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/supplier/chatSupplier/presentation/cubit/chat_cubit.dart';

class ServiceLocator {
  static GetIt getIt = GetIt.instance;

  static void setObjects() {

    getIt.registerLazySingleton<OtpRemoteDataSourceFirebaseImpl>(() => OtpRemoteDataSourceFirebaseImpl(auth: FirebaseAuth.instance),);

    getIt.registerLazySingleton<AuthenticationCubit>(
      () => AuthenticationCubit(),
    );
    getIt.registerLazySingleton<SupplierAuthCubit>(
      () => SupplierAuthCubit(),
    );
    

    getIt.registerLazySingleton<OrdersCubit>(
      () => OrdersCubit(),
    );
    getIt.registerLazySingleton<SettingsCubit>(
      () => SettingsCubit(),
    );

    getIt.registerFactory<ChatCubit>(
          () => ChatCubit(),
    );
    getIt.registerFactory<SupplierChatCubit>(
          () => SupplierChatCubit(),
    );


  getIt.registerLazySingleton<NotificationService>(
        () => NotificationService(userId: 'admin'),
  );



  }
}
