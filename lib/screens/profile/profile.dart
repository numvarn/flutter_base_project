import 'package:base_project/components/img_cached_container.dart';
import 'package:base_project/constants.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key key}) : super(key: key);

  final double sizeBox = 14.0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            // height: MediaQuery.of(context).size.height + 30,
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Center(
                    child: Text(
                      "นายพิศาล สุขขี",
                      style: contentBulletStyle,
                    ),
                  ),
                ),
                SizedBox(height: sizeBox),
                ClipRRect(
                  borderRadius: BorderRadius.circular(200.0),
                  child: CachedImageContainer(
                    imgUrl: 'https://numvarn.github.io/resume/images/phisan.jpg',
                    height: 160,
                  ),
                ),
                SizedBox(height: sizeBox),
                Align(
                  alignment: Alignment.center,
                  child: new Text(
                    'สาขาวิชาวิทยาการคอมพิวเตอร์\nคณะศิลปศาสตร์และวิทยาศาสตร์',
                    style: contentTextStyle,
                  ),
                ),
                SizedBox(height: sizeBox),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "ประวัติการศึกษา",
                    style: contentSubBulletStyle,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.arrow_forward),
                  title: Align(
                    child: new Text(
                      'วท.ม. (วิทยาการคอมพิวเตอร์) มหาวิทยาลัยศิลปากร',
                    ),
                    alignment: Alignment(-1.8, 0),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.arrow_forward),
                  title: Align(
                    child: new Text(
                      'วท.บ. (วิทยาการคอมพิวเตอร์) มหาวิทยาลัยศิลปากร',
                    ),
                    alignment: Alignment(-1.8, 0),
                  ),
                ),
                SizedBox(height: sizeBox),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "สำหรับติดต่อ",
                    style: contentSubBulletStyle,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.phone_android),
                  title: Align(
                    child: new Text(
                      '084-298-2456',
                    ),
                    alignment: Alignment(-1, 0),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Align(
                    child: new Text(
                      'www.facebook.com/numvarn',
                    ),
                    alignment: Alignment(-1, 0),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.web),
                  title: Align(
                    child: new Text(
                      'www.comsci-sskru.com',
                    ),
                    alignment: Alignment(-1, 0),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.email_outlined),
                  title: Align(
                    child: new Text(
                      'phisan.s@sskru.ac.th',
                    ),
                    alignment: Alignment(-1, 0),
                  ),
                ),
                SizedBox(height: sizeBox),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "ประวัติการทำงาน",
                    style: contentSubBulletStyle,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.arrow_forward),
                  title: Align(
                    child: new Text(
                      'อาจารประจำสาขาวิชาวิทยาการคอมพิวเตอร์,\n\nคณะศิลปศาสตร์และวิทยาศาสตร์,\n\nมหาวิทยาลัยราชภัฏศรีสะเกษ',
                    ),
                    alignment: Alignment(-1.8, 0),
                  ),
                ),
                SizedBox(height: sizeBox),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "ความสามารถพิเศษ",
                    style: contentSubBulletStyle,
                  ),
                ),
                SizedBox(height: sizeBox),
                ListTile(
                  leading: Icon(Icons.developer_board),
                  title: Align(
                    child: new Text(
                      'เชี่ยวชาญการเขียนโปรแกรมด้วย Python',
                    ),
                    alignment: Alignment(-1, 0),
                  ),
                ),
                SizedBox(height: sizeBox),
                ListTile(
                  leading: Icon(Icons.developer_board),
                  title: Align(
                    child: new Text(
                      'เชี่ยวชาญการการพัฒนาเว็บแอพพลิเคชั่นด้วย Django Framework',
                    ),
                    alignment: Alignment(-1, 0),
                  ),
                ),
                SizedBox(height: sizeBox),
                ListTile(
                  leading: Icon(Icons.developer_board),
                  title: Align(
                    child: new Text(
                      'การวิเคราะห์ประมวลผลข้อมูลขนาดใหญ่ด้วย Python',
                    ),
                    alignment: Alignment(-1, 0),
                  ),
                ),
                SizedBox(height: sizeBox),
                ListTile(
                  leading: Icon(Icons.developer_board),
                  title: Align(
                    child: new Text(
                      'การพัฒนาระบบงานเว็บเชอร์วิสด้วย Django Rest Framework',
                    ),
                    alignment: Alignment(-1, 0),
                  ),
                ),
                SizedBox(height: sizeBox),
                ListTile(
                  leading: Icon(Icons.developer_board),
                  title: Align(
                    child: new Text(
                      'การพัฒนาโมบายแอพพลิเคชันด้วย Flutter',
                    ),
                    alignment: Alignment(-1, 0),
                  ),
                ),
                SizedBox(
                  height: size.height * .4,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
