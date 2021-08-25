import 'package:airplan/ui/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomButton(
        title: 'Sign Out',
        onPressed: () {},
        width: 220,
      ),
    );
  }
}
