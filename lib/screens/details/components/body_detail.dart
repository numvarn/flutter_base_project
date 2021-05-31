import 'package:flutter/material.dart';
import '/components/dialog_confirm.dart';
import '/components/img_cached_gallery_container.dart';
import '/constants.dart';
import '/data/image_network.dart';
import '/screens/details/detail_edit_screen.dart';

class BodyDetail extends StatefulWidget {
  const BodyDetail({Key key}) : super(key: key);

  @override
  _BodyDetailState createState() => _BodyDetailState();
}

class _BodyDetailState extends State<BodyDetail> {
  @override
  Widget build(BuildContext context) {
    print("build detail page");
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(
          top: boxMarginBottom,
          bottom: 350,
        ),
        child: Column(
          children: [
            Container(
                width: size.width * .9,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: kPrimaryColor.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    Icon(Icons.person_outline),
                    SizedBox(
                      height: primaryMarginBottom,
                    ),
                    Text(
                      "Phisan Sookkhee",
                      style: contentSubBulletStyle,
                    ),
                    SizedBox(
                      height: secondaryMarginBottom,
                    ),
                    Text(
                      "Department of Computer Sciences",
                      style: contentTextStyle,
                    ),
                    SizedBox(
                      height: secondaryMarginBottom,
                    ),
                    Text(
                      "Sisaket Rajabhat University",
                      style: contentTextStyle,
                    ),
                    SizedBox(
                      height: primaryMarginBottom,
                    ),
                    Divider(),
                    SizedBox(
                      height: primaryMarginBottom,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About",
                            style: contentTextStyle,
                          ),
                          SizedBox(
                            height: primaryMarginBottom,
                          ),
                          Text("อาจารย์ประจำสาขาวิชาวิทยาการคอมพิวเตอร์\nคณะศิลปศาสตร์และวิทยาศาสตร์, \nมหาวิทยาลัยราชภัฏศรีะสเกษ"),
                          SizedBox(
                            height: primaryMarginBottom,
                          ),
                          Text(
                            "Contact",
                            style: contentTextStyle,
                          ),
                          SizedBox(
                            height: primaryMarginBottom,
                          ),
                          Text("phone : 084-298-2456"),
                          SizedBox(
                            height: secondaryMarginBottom,
                          ),
                          Text("mail : phisan.s@sskru.ac.th"),
                          SizedBox(
                            height: primaryMarginBottom,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DetailEditScreen()),
                          );
                        },
                        child: Text("แก้ไขประวัติ"),
                        style: roundBorderStyle,
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: boxMarginBottom,
            ),
            /*
            * Socail net word QR-Code
            */
            Container(
              width: size.width * .9,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: kPrimaryColor.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Social Contact",
                    style: contentTextStyle,
                  ),
                  SizedBox(
                    height: primaryMarginBottom,
                  ),
                  GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.all(12),
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    crossAxisCount: 2,
                    children: [
                      for (var index = 0; index < qrcodeList.length; index++)
                        Stack(
                          fit: StackFit.expand,
                          children: [
                            Card(
                              margin: EdgeInsets.all(0),
                              semanticContainer: true,
                              elevation: 1,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              child: CachedImageGalleryContainer(
                                imgUrl: qrcodeList[index]['url'],
                              ),
                            ),
                            Positioned(
                              right: 9,
                              top: 6,
                              child: Container(
                                height: 28,
                                width: 28,
                                child: Center(
                                  child: ClipOval(
                                    child: Material(
                                      color: kPrimaryLightColor.withOpacity(0.9),
                                      child: IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (_) => CustomConfirmDialog(
                                              title: "ต้องการลบ QR Code !",
                                              subtitle: "กรุณากดปุ่มยืนยันเพื่อลบภาพคิวอาร์โค๊ดออกจากร้านค้า",
                                              onpress: () async {
                                                Navigator.pop(context);
                                              },
                                            ),
                                            // QRCodeDeleteDialog(qrcodeID: qrcodes[index]['id'], storeID: qrcodes[index]['store']),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.close,
                                          size: 13,
                                        ),
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
