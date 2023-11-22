
import 'package:flutter/material.dart';
import '../../../widget/custom_text_form_field.dart';

class TextItemListview extends StatelessWidget {
  const TextItemListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 21),
      child: CustomTextFormField(
        keyboardType: TextInputType.text,
        hintText: 'Search',
        suffixIcon: const Icon(Icons.search),
        onChanged: (value) {},
      ),
    );
  }
}
