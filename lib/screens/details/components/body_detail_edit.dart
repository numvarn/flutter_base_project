import 'package:base_project/components/rounded_input_field.dart';
import 'package:base_project/components/text_field_container.dart';
import 'package:base_project/constants.dart';
import 'package:base_project/validation/signup_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:smart_select/smart_select.dart';

class BodyDetailEdit extends StatefulWidget {
  @override
  _BodyDetailEditState createState() => _BodyDetailEditState();
}

class _BodyDetailEditState extends State<BodyDetailEdit> {
  SignupValidation validationService;

  // * mark text form field
  // * for phone number field
  var maskPhoneFormatter = new MaskTextInputFormatter(mask: '###-###-####', filter: {"#": RegExp(r'[0-9]')});

  final RoundedLoadingButtonController _btnController = new RoundedLoadingButtonController();

  bool nameIsShow = false;
  bool phoneIsShow = false;
  bool dobIsShow = false;
  bool addressIsShow = false;
  bool genderIsShow = false;

  Size size;
  String _date = "Not set";

  /*
  * Initial Controller
  */
  String genderValue = 'male';
  var nameController = TextEditingController(text: "พิศาล");
  var lastnameContaller = TextEditingController(text: "สุขขี");
  var phoneController = TextEditingController(text: "084-298-2456");
  var dobController = TextEditingController(text: "1981 - 06 - 28");
  var addressController = TextEditingController(text: "40 / 6 หมู่ 6 ต.หนองครก อ.เมือง ศรีสะเกษ 33000");

  @override
  Widget build(BuildContext context) {
    // * Sign-up validation services
    validationService = Provider.of<SignupValidation>(context);

    size = MediaQuery.of(context).size;

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
                // * Gender
                InkWell(
                  onTap: () {
                    setState(() {
                      genderIsShow = !genderIsShow;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'เพศ',
                              style: TextStyle(color: kTextSecondaryColor),
                            ),
                            Text(
                              'ชาย',
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: TextStyle(color: kPrimaryColor),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            genderIsShow == false
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
                      Divider(),
                    ],
                  ),
                ),
                if (genderIsShow)
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: _genderChoice(context),
                        ),
                      ],
                    ),
                  ),
                Divider(),
                // * Firstname & Lastname
                InkWell(
                  onTap: () {
                    setState(() {
                      nameIsShow = !nameIsShow;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ชื่อ - สกุล',
                              style: TextStyle(color: kTextSecondaryColor),
                            ),
                            Text(
                              'พิศาล สุขขี',
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: TextStyle(color: kPrimaryColor),
                            ),
                          ],
                        ),
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
                          child: RoundedInputField(
                            hintText: "ชื่อ",
                            errorText: validationService.firstname.error,
                            controller: nameController,
                            icon: Icons.person_outline,
                            onChanged: (firstname) {
                              validationService.validateFirstName(firstname);
                            },
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: RoundedInputField(
                            hintText: "นามสกุล",
                            errorText: validationService.lastname.error,
                            controller: lastnameContaller,
                            icon: Icons.person_outline,
                            onChanged: (lastname) {
                              validationService.validateLastName(lastname);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                Divider(),
                // * Phone
                InkWell(
                  onTap: () {
                    setState(() {
                      phoneIsShow = !phoneIsShow;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'เบอร์โทร',
                              style: TextStyle(color: kTextSecondaryColor),
                            ),
                            Text(
                              '084-298-2456',
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: TextStyle(color: kPrimaryColor),
                            ),
                          ],
                        ),
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
                            hintText: "เบอร์โทรติดต่อ",
                            errorText: validationService.phone.error,
                            controller: phoneController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [maskPhoneFormatter],
                            icon: Icons.phone_outlined,
                            onChanged: (value) {
                              validationService.validatePhone(value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                Divider(),
                // * DOB
                InkWell(
                  onTap: () {
                    setState(() {
                      dobIsShow = !dobIsShow;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'วัน-เดือน-ปี เกิด',
                              style: TextStyle(color: kTextSecondaryColor),
                            ),
                            Text(
                              '1981 - 06 - 28',
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: TextStyle(color: kPrimaryColor),
                            ),
                          ],
                        ),
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
                            hintText: "วัน-เดือน-ปีเกิด",
                            errorText: validationService.dob.error,
                            controller: dobController,
                            icon: Icons.calendar_today_outlined,
                            onChanged: (dob) {
                              validationService.validateDOB(dob);
                            },
                            onTab: () => _selectDateOfBirth(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                Divider(),
                // * Address
                InkWell(
                  onTap: () {
                    setState(() {
                      addressIsShow = !addressIsShow;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
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
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
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
                      Divider(),
                    ],
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
                            errorText: validationService.address.error,
                            icon: Icons.home_outlined,
                            controller: addressController,
                            onChanged: (value) {
                              validationService.validateAddress(value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                Divider(),
                SizedBox(
                  height: boxMarginBottom,
                ),
                SizedBox(
                  width: double.infinity,
                  child: _submitButton(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /*
   * Date picker for select date of birth in Thai format
  */
  void _selectDateOfBirth(BuildContext context) {
    DatePicker.showDatePicker(
      context,
      theme: DatePickerTheme(
        headerColor: Colors.blue[50],
        containerHeight: size.height * .3,
        itemStyle: TextStyle(color: Colors.black, fontSize: 18),
      ),
      showTitleActions: true,
      minTime: DateTime(1970, 1, 1),
      maxTime: DateTime(2022, 12, 31),
      onConfirm: (date) {
        print('confirm $date');
        _date = '${date.year} - ${date.month} - ${date.day}';
        setState(() {
          dobController.text = _date.toString();
          validationService.validateDOB(_date.toString());
        });
      },
      currentTime: DateTime.now(),
      locale: LocaleType.th,
    );
  }

  // * Gender choice widget
  Widget _genderChoice(BuildContext context) {
    List<S2Choice<String>> options = [
      S2Choice<String>(value: 'male', title: 'ชาย'),
      S2Choice<String>(value: 'female', title: 'หญิง'),
    ];

    return TextFieldContainer(
      child: SmartSelect<String>.single(
        title: 'เพศ',
        value: genderValue,
        choiceDivider: false,
        modalConfirm: false,
        choiceItems: options,
        modalType: S2ModalType.popupDialog,
        modalStyle: S2ModalStyle(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 5,
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          clipBehavior: Clip.antiAlias,
        ),
        modalHeaderStyle: S2ModalHeaderStyle(
          centerTitle: false,
        ),
        onChange: (state) {
          genderValue = state.value;
        },
      ),
    );
  }

  /*
  * Submit button
  */
  Widget _submitButton(BuildContext context) {
    return RoundedLoadingButton(
      child: Text(
        "แก้ไขข้อมูล",
        textAlign: TextAlign.center,
        style: TextStyle(color: kPrimaryColor),
      ),
      controller: _btnController,
      width: MediaQuery.of(context).size.width,
      color: kPrimaryLightColor,
      borderRadius: 10,
      elevation: 0,
      onPressed: () {
        _onSubmit();
      },
    );
  }

  /*
  * Submit data
  */
  Future _onSubmit() async {
    print("$genderValue");
    print("${nameController.text}");
    print("${lastnameContaller.text}");
    print("${phoneController.text}");
    print("${dobController.text}");
    print("${addressController.text}");

    _btnController.success();
  }
}
