import 'package:flutter/material.dart';
import 'package:newproject/app/routes/global_key.dart';
import 'package:newproject/app/routes/route.dart';
import 'package:newproject/commons/controls/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('hahahah'),
      ),
      body: Center(
        child: CustomButton(
          text: 'CLIck me',
          onTap: () {
            gNavigator?.pushNamed(Routes.secondPage);
          },
        ),
      ),
    );
  }
}
