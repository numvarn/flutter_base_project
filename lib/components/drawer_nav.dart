import 'package:base_project/constants.dart';
import 'package:base_project/models/user_model.dart';
import 'package:base_project/screens/operations/operations_screen.dart';
import 'package:base_project/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerNavigator extends StatefulWidget {
  @override
  _DrawerNavigatorState createState() => _DrawerNavigatorState();
}

class _DrawerNavigatorState extends State<DrawerNavigator> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Drawer(
      child: Container(
        child: Consumer<UserModel>(
          builder: (context, userModel, child) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                      ),
                      accountName: Text(
                        "${userModel.profile['firstname']} ${userModel.profile['lastname']}",
                        style: contentBulletStyle,
                      ),
                      accountEmail: Text(
                        "${userModel.profile['email']}",
                        style: TextStyle(fontSize: textTheme.subtitle1.fontSize, color: kTextSecondaryColor),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.home_outlined),
                      title: Text(
                        'หน้าแรก',
                        style: TextStyle(fontSize: textTheme.subtitle1.fontSize, color: kTextSecondaryColor),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => OperationScreen()));
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
                child: Column(
                  children: [
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.verified),
                      title: Text(
                        'เวอร์ชั่น 1.0.0',
                        style: TextStyle(fontSize: textTheme.subtitle1.fontSize, color: kTextSecondaryColor),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text(
                        'ออกจากระบบ',
                        style: TextStyle(fontSize: textTheme.subtitle1.fontSize, color: kTextSecondaryColor),
                      ),
                      onTap: () {
                        userModel.clear();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
