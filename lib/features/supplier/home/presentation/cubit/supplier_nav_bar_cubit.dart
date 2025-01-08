import 'package:flutter_bloc/flutter_bloc.dart';

class SupplierNavBarCubit extends Cubit<int> {
  SupplierNavBarCubit() : super(0);
  changeNavBarPages(int value) {
    emit(value);
  }
}
