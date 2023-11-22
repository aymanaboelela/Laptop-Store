
import 'package:flutter/material.dart';

import '../../core/constant/color.dart';

class OtpField extends StatelessWidget {
  const OtpField({
    super.key,
    this.onSaved,
  });
  final FormFieldSetter<String>? onSaved;
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return SizedBox(
    
      width: 68,
      child: TextFormField(
        controller: controller,
        //? autovalidateMode: AutovalidateMode.always, //! AUTO VALIDATE
        autofocus: true,
        onSaved: onSaved,
        onChanged: (data) {
          if (data.length == 1) {
            FocusScope.of(context).nextFocus();
            controller.value;
          }
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "";
          }
          if (value.contains(RegExp(r'[a-z]'))) {
            return "";
          }
          if (value.contains(RegExp(r'[A-Z]'))) {
            return "";
          }
          return null;
        },
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 25),
          counterText: '',
          errorStyle: TextStyle(fontSize: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            borderSide: BorderSide(
              color: kWhite,
            ),
          ),
          fillColor: kWhite,
          filled: true,
        ),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
