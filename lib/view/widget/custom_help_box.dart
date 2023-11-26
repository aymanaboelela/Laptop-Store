import 'package:flutter/material.dart';
import 'package:laptop_express/data/model/help_model.dart';

import '../../core/constant/color.dart';

class HelpBox extends StatefulWidget {
  const HelpBox({
    super.key,
     required this.helpModels,
  });

  final HelpModels helpModels;

  
  @override
  State<HelpBox> createState() => _HelpBoxState();
}

class _HelpBoxState extends State<HelpBox> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isVisible = !isVisible;
        setState(() {});
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        alignment: Alignment.center,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: kBlack.withOpacity(0.25),
              blurRadius: 8,
              offset: const Offset(2, 2),
              spreadRadius: 2)
        ], color: kWhite, borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5, right: 5),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  widget.helpModels.question,
                  textAlign: TextAlign.start,
                  style: const TextStyle(color: kBlue, fontSize: 20),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      isVisible = !isVisible;
                      setState(() {});
                    },
                    icon: Icon(
                      isVisible
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down_outlined,
                      size: 35,
                    ))
              ],
            ),
            Visibility(
              visible: isVisible,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Text(
                  widget.helpModels.answer,
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
