import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../core/constant/color.dart';
import '../../core/constant/route.dart';
import '../../cubits/auth_cubit/auth_cubit.dart';
import '../../cubits/data_cubit/data_cubit.dart';
import '../../data/model/help_model.dart';
import '../../data/service/service.dart';
import '../widget/custom_button.dart';
import '../widget/custom_help_box.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  List<HelpModels> helpModel = [];
  bool isloading = true;
  @override
  void initState() {
    super.initState();
    Service.init();
    getInit();
  }

  Future<void> getInit() async {
    helpModel = await Service.getHelp();
    isloading = false;
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
              child: FutureBuilder(
                future: Service.getHelp(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        List<HelpModels> helpModels = snapshot.data!;
                        return HelpBox(
                          helpModels: helpModels[index],
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("error");
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
