
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supplier/features/client/home/model/order_model.dart';

import '../../../../../../core/utils/constants/category_constants.dart';
part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());
  final formKey = GlobalKey<FormState>();
  TextEditingController orderExtraDetailsController = TextEditingController();
  int indexFromChoice = 0;
  late String radioButtonGroupValue;
  late OrderModel addedOrder;
  Map<String, dynamic> orderDetails = {};
  initGroupVal(int index) {
    radioButtonGroupValue = CategoryConstants.printing[index].radioOptions[0];
  }
 
  rebuildRadioOnChooseing(String choice, int choiceIndex) {
    radioButtonGroupValue = choice;
    indexFromChoice = choiceIndex;
    emit(RadioCurrentChoice(choice: choice, choiceIndex: choiceIndex));
  }

  String returnDateWithTime() {
    return "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}\n ${DateTime.now().hour.toString().padLeft(2, "0")}:${DateTime.now().minute.toString().padLeft(2, "0")}";
  }

  addOrder() {
    addedOrder = OrderModel(
      orderCategoryName: "Printing",
      orderType: radioButtonGroupValue,
      orderDate:returnDateWithTime(),
      orderDetails:
          orderDetails.toString().replaceAll("{", "").replaceAll("}", "").replaceAll(",", ""),
      orderExtraDescription: orderExtraDetailsController.text,
    );
  }
}
