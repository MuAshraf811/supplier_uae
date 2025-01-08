import 'package:flutter_bloc/flutter_bloc.dart';

class MainHomeCubit extends Cubit<int> {
  MainHomeCubit() : super(0);
  changeCategoryIndex(int index) {
    emit(index);
  }
}
