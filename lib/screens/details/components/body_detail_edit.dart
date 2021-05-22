import 'package:base_project/components/rounded_input_field.dart';
import 'package:base_project/constants.dart';
import 'package:flutter/material.dart';

class BodyDetailEdit extends StatefulWidget {
  @override
  _BodyDetailEditState createState() => _BodyDetailEditState();
}

class _BodyDetailEditState extends State<BodyDetailEdit> {
  bool nameIsShow = false;
  bool phoneIsShow = false;
  bool dobIsShow = false;
  bool addressIsShow = false;

  var nameController = TextEditingController();
  var lastnameContaller = TextEditingController();
  var phoneController = TextEditingController();
  var dobController = TextEditingController();
  var addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    nameController.text = "พิศาล";
    lastnameContaller.text = "สุขขี";
    phoneController.text = "084-298-2456";
    dobController.text = "1981 - 06 - 28";
    addressController.text = "40 / 6 หมู่ 6 ต.หนองครก อ.เมือง ศรีสะเกษ 33000";

    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(
          top: boxMarginBottom,
          bottom: 350,
        ),
        child: Center(
          child: Container(
            width: size.width * .9,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      nameIsShow = !nameIsShow;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ชื่อ - สกุล',
                            style: TextStyle(color: kTextSecondaryColor),
                          ),
                          Text(
                            'พิศาล สุขขี',
                            style: TextStyle(color: kPrimaryColor),
                          ),
                        ],
                      ),
                      nameIsShow == false
                          ? Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 14,
                              color: kTextSecondaryColor,
                            )
                          : Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 22,
                              color: kTextSecondaryColor,
                            ),
                    ],
                  ),
                ),
                if (nameIsShow)
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: RoundedInputField(controller: nameController, icon: Icons.person_outline),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: RoundedInputField(
                            controller: lastnameContaller,
                            icon: Icons.person_outline,
                          ),
                        ),
                      ],
                    ),
                  ),
                Divider(),
                InkWell(
                  onTap: () {
                    setState(() {
                      phoneIsShow = !phoneIsShow;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'เบอร์โทร',
                            style: TextStyle(color: kTextSecondaryColor),
                          ),
                          Text(
                            '084-298-2456',
                            style: TextStyle(color: kPrimaryColor),
                          ),
                        ],
                      ),
                      phoneIsShow == false
                          ? Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 14,
                              color: kTextSecondaryColor,
                            )
                          : Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 22,
                              color: kTextSecondaryColor,
                            ),
                    ],
                  ),
                ),
                if (phoneIsShow)
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: RoundedInputField(
                            controller: phoneController,
                            icon: Icons.phone_outlined,
                          ),
                        ),
                      ],
                    ),
                  ),
                Divider(),
                InkWell(
                  onTap: () {
                    setState(() {
                      dobIsShow = !dobIsShow;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'วัน-เดือน-ปี เกิด',
                            style: TextStyle(color: kTextSecondaryColor),
                          ),
                          Text(
                            '1981 - 06 - 28',
                            style: TextStyle(color: kPrimaryColor),
                          ),
                        ],
                      ),
                      dobIsShow == false
                          ? Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 14,
                              color: kTextSecondaryColor,
                            )
                          : Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 22,
                              color: kTextSecondaryColor,
                            ),
                    ],
                  ),
                ),
                if (dobIsShow)
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: RoundedInputField(
                            controller: dobController,
                            icon: Icons.calendar_today_outlined,
                          ),
                        ),
                      ],
                    ),
                  ),
                Divider(),
                InkWell(
                  onTap: () {
                    setState(() {
                      addressIsShow = !addressIsShow;
                    });
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ที่อยู่ติดต่อ',
                              style: TextStyle(color: kTextSecondaryColor),
                            ),
                            Text(
                              '40 / 6 หมู่ 6 ตำบล หนองครก อำเภอเมือง จังหวัดศรีสะเกษ 33000',
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: TextStyle(color: kPrimaryColor),
                            ),
                          ],
                        ),
                        addressIsShow == false
                            ? Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 14,
                                color: kTextSecondaryColor,
                              )
                            : Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 22,
                                color: kTextSecondaryColor,
                              ),
                      ],
                    ),
                  ),
                ),
                if (addressIsShow)
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: RoundedInputField(
                            hintText: "ที่อยู่",
                            minLines: 5,
                            maxLines: 7,
                            icon: Icons.home_outlined,
                            controller: addressController,
                          ),
                        ),
                      ],
                    ),
                  ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
