import 'package:base_project/components/rounded_input_field.dart';
import 'package:base_project/components/text_field_container.dart';
import 'package:base_project/constants.dart';
import 'package:base_project/validation/signup_validation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_select/smart_select.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class ProfileForm extends StatefulWidget {
  @override
  ProfileFormState createState() => ProfileFormState();
}

class ProfileFormState extends State<ProfileForm> {
  SignupValidation validationService;

  // controller
  static TextEditingController nameController = TextEditingController();
  static TextEditingController lastnameController = TextEditingController();
  static TextEditingController genderController = TextEditingController();
  static TextEditingController dobController = TextEditingController();

  Size size;
  String _date = "Not set";
  String genderValue = 'male';

  @override
  Widget build(BuildContext context) {
    // * Sign-up validation services
    validationService = Provider.of<SignupValidation>(context);

    // * Set defaul gender
    validationService.setGender(genderValue);

    size = MediaQuery.of(context).size;

    return Container(
      width: size.width * .8,
      child: Form(
        child: Column(
          children: [
            _genderChoice(context),
            RoundedInputField(
              hintText: "ชื่อ",
              errorText: validationService.firstname.error,
              controller: nameController,
              icon: Icons.person_outline,
              onChanged: (firstname) {
                validationService.validateFirstName(firstname);
              },
            ),
            RoundedInputField(
              hintText: "นามสกุล",
              errorText: validationService.lastname.error,
              controller: lastnameController,
              icon: Icons.person_outline,
              onChanged: (lastname) {
                validationService.validateLastName(lastname);
              },
            ),
            RoundedInputField(
              hintText: "วัน-เดือน-ปีเกิด",
              errorText: validationService.dob.error,
              icon: Icons.calendar_today_outlined,
              controller: dobController,
              onChanged: (dob) {
                validationService.validateDOB(dob);
              },
              onTab: () => _selectDateOfBirth(context),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  _validateProfileForm();
                },
                child: Text("ต่อไป"),
                style: outlineCurveStyle,
              ),
            )
          ],
        ),
      ),
    );
  }

  /*
   * Date picker for select date of birth in Thai format
  */
  void _selectDateOfBirth(BuildContext context) {
    DatePicker.showDatePicker(context,
        theme: DatePickerTheme(
          headerColor: Colors.blue[50],
          containerHeight: size.height * .3,
          itemStyle: TextStyle(color: Colors.black, fontSize: 18),
        ),
        showTitleActions: true,
        minTime: DateTime(1970, 1, 1),
        maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
      print('confirm $date');
      _date = '${date.year} - ${date.month} - ${date.day}';
      setState(() {
        dobController.text = _date.toString();
        validationService.validateDOB(_date.toString());
      });
    }, currentTime: DateTime.now(), locale: LocaleType.th);
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
          validationService.setGender(state.value);
        },
      ),
    );
  }

  void _validateProfileForm() {
    if (validationService.profileIsValid()) {
      validationService.setIndex(2);
    }
  }
}
