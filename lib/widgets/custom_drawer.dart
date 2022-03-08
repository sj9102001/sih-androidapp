import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: ListView(
          padding: const EdgeInsets.only(left: 40, top: 50, right: 40),
          children: <Widget>[
            buildMenuItem(text: 'Student', icon: Icons.people),
            buildMenuItem(
                text: 'Teacher', icon: Icons.admin_panel_settings_outlined),
            const Divider(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

Widget buildMenuItem({required String text, required IconData icon}) {
  return ListTile(
    leading: Icon(
      icon,
      color: Colors.white,
    ),
    title: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
    onTap: () {},
  );
}
