import 'package:base_project/components/img_cached_gallery_container.dart';
import 'package:base_project/constants.dart';
import 'package:flutter/material.dart';

class PersonProfileScreen extends StatelessWidget {
  const PersonProfileScreen({Key key}) : super(key: key);
  static double sizeBox = 14.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
        child: Container(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(200.0),
                child: CachedImageGalleryContainer(
                  imgUrl: 'https://numvarn.github.io/resume/asset/network_photos/cristina-gottardi-wndpWTiDuT0-unsplash.jpg',
                  height: 160,
                  width: 160,
                ),
              ),
              SizedBox(height: sizeBox),
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
              Align(
                alignment: Alignment.center,
                child: Text(
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
                  child: Text(
                    'วท.ม. (วิทยาการคอมพิวเตอร์) มหาวิทยาลัยศิลปากร',
                  ),
                  alignment: Alignment(-1.8, 0),
                ),
              ),
              ListTile(
                leading: Icon(Icons.arrow_forward),
                title: Align(
                  child: Text(
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
                  child: Text(
                    '084-298-2456',
                  ),
                  alignment: Alignment(-1, 0),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Align(
                  child: Text(
                    'www.facebook.com/numvarn',
                  ),
                  alignment: Alignment(-1, 0),
                ),
              ),
              ListTile(
                leading: Icon(Icons.web),
                title: Align(
                  child: Text(
                    'www.comsci-sskru.com',
                  ),
                  alignment: Alignment(-1, 0),
                ),
              ),
              ListTile(
                leading: Icon(Icons.email_outlined),
                title: Align(
                  child: Text(
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
                  child: Text(
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
                  child: Text(
                    'เชี่ยวชาญการเขียนโปรแกรมด้วย Python',
                  ),
                  alignment: Alignment(-1, 0),
                ),
              ),
              SizedBox(height: sizeBox),
              ListTile(
                leading: Icon(Icons.developer_board),
                title: Align(
                  child: Text(
                    'เชี่ยวชาญการการพัฒนาเว็บแอพพลิเคชั่นด้วย Django Framework',
                  ),
                  alignment: Alignment(-1, 0),
                ),
              ),
              SizedBox(height: sizeBox),
              ListTile(
                leading: Icon(Icons.developer_board),
                title: Align(
                  child: Text(
                    'การวิเคราะห์ประมวลผลข้อมูลขนาดใหญ่ด้วย Python',
                  ),
                  alignment: Alignment(-1, 0),
                ),
              ),
              SizedBox(height: sizeBox),
              ListTile(
                leading: Icon(Icons.developer_board),
                title: Align(
                  child: Text(
                    'การพัฒนาระบบงานเว็บเชอร์วิสด้วย Django Rest Framework',
                  ),
                  alignment: Alignment(-1, 0),
                ),
              ),
              SizedBox(height: sizeBox),
              ListTile(
                leading: Icon(Icons.developer_board),
                title: Align(
                  child: Text(
                    'การพัฒนาโมบายแอพพลิเคชันด้วย Flutter',
                  ),
                  alignment: Alignment(-1, 0),
                ),
              ),
              SizedBox(height: 300),
            ],
          ),
        ),
      ),
    );
  }
}
