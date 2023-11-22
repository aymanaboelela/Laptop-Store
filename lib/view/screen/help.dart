
import 'package:flutter/material.dart';
import '../../core/constant/color.dart';
import '../../core/constant/route.dart';
import '../../data/model/help_model.dart';
import '../../data/service/login_service.dart';
import '../widget/custom_button.dart';
import '../widget/custom_help_box.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  List<Help> helpModel = [];
  @override
  void initState() {
    super.initState();
    Service.init();
    getInit();
  }

  Future<void> getInit() async {
    helpModel = await Service.getHelp();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        padding: const EdgeInsets.only(right: 35, left: 35, bottom: 20),
        child: CustomButton(
          onTap: () {
            Navigator.pushNamed(context, kHome);
          },
          title: "Continue",
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(gradient: kBackgroundScreen),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 65, bottom: 50),
              alignment: Alignment.center,
              child: const Text(
                "Help",
                style: TextStyle(fontSize: 32, color: kWhite),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: helpModel.length,
                itemBuilder: (context, index) {
                  return HelpBox(
                      title: helpModel[index].question!,
                      content: helpModel[index].answer!);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
