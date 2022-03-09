import 'package:flutter/material.dart';
import 'package:sihapp/widgets/custom_elevatedbutton.dart';

import 'package:provider/provider.dart';
import '../providers/standard_info.dart';

// ignore: must_be_immutable
class TestPage extends StatelessWidget {
  TestPage({Key? key}) : super(key: key);
  static const routeName = '/test-page';
  var grades = ["10", "12"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('Test Screen'),
      ),
      body: Center(
        child: Column(children: [
          CustomElevatedButton(
            labelText: 'Standard',
            icon: Icons.abc,
            onPressedHandler: () {
              Provider.of<StandardInfoProvider>(context, listen: false)
                  .testApiCall();
            },
          ),
          CustomElevatedButton(
            labelText: 'Standard with num',
            icon: Icons.place,
            onPressedHandler: () {
              Provider.of<StandardInfoProvider>(context, listen: false)
                  .testApiCallWithNumber(10);
            },
          ),
        ]),
      ),
    );
  }
}
