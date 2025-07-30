import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';


class CustomPhoneField extends StatelessWidget {
  const CustomPhoneField({
    super.key, required this.context, required this.thePhoneController, required this.myWidth,
  });

  final BuildContext context;
  final PhoneController thePhoneController;
  final double myWidth;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: MediaQuery.of(context).size.width>450?
      const BoxConstraints(
          maxHeight: 60,minHeight: 50
      ):
      BoxConstraints(
          maxHeight: 60,minHeight: 60,
        minWidth: myWidth,
        maxWidth: myWidth,
      ),
      child: PhoneFormField(
        controller: thePhoneController,
        validator: PhoneValidator.compose([
          PhoneValidator.required(context),
          PhoneValidator.validMobile(context),
        ]),
        countrySelectorNavigator: const CountrySelectorNavigator.dialog(),
        onChanged: (phoneNumber) {
          thePhoneController.value = PhoneNumber(isoCode: phoneNumber.isoCode, nsn: phoneNumber.nsn);
          print('changed into +${thePhoneController.value.countryCode}${thePhoneController.value.nsn}');
        },
        enabled: true,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          // color: AppColors.goDark
        ),
        decoration: InputDecoration(
          labelText: 'Phone number',
          labelStyle: Theme.of(context).textTheme.bodySmall,

          counterText: '',
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1,strokeAlign: 5,color: Colors.grey,),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue,width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1,strokeAlign: 5,color: Colors.grey,),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1,strokeAlign: 5,color: Colors.grey,),
            borderRadius: BorderRadius.circular(10),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1,strokeAlign: 5,color: Colors.grey,),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red,width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        isCountrySelectionEnabled: true,
        isCountryButtonPersistent: true,
        countryButtonStyle: CountryButtonStyle(
            showDialCode: true,
            showIsoCode: false,
            showFlag: false,
            // flagSize: 24,
            textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 15,
                // color: AppColors.goDark,
                fontWeight: FontWeight.w500
            ),
            // showDropdownIcon: true
        ),
      ),
    );
  }
}
