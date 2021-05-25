import 'package:base_project/validation/validation_item.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

class SignupValidation with ChangeNotifier {
  /*
  * * Carousel Controller
  */
  CarouselController buttonCarouselController = CarouselController();

  ValidationItem _email = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);
  ValidationItem _passwordConfirm = ValidationItem(null, null);

  ValidationItem _firstname = ValidationItem(null, null);
  ValidationItem _lastname = ValidationItem(null, null);
  ValidationItem _dob = ValidationItem(null, null);

  ValidationItem _phone = ValidationItem(null, null);
  ValidationItem _address = ValidationItem(null, null);

  String _gender = '';

  // * Getters
  ValidationItem get email => _email;
  ValidationItem get password => _password;
  ValidationItem get passwordConfirm => _passwordConfirm;

  ValidationItem get firstname => _firstname;
  ValidationItem get lastname => _lastname;
  ValidationItem get dob => _dob;

  ValidationItem get phone => _phone;
  ValidationItem get address => _address;

  get gender => _gender;

  // * -------------------------------------
  // * Get current carousel index
  int _selectedIndex = 0;

  get getSelectedIndex => _selectedIndex;
  get getCarouselController => buttonCarouselController;

  void setGender(String gender) {
    _gender = gender;
  }

  void setIndex(int index) {
    _selectedIndex = index;
    buttonCarouselController.animateToPage(
      index,
      duration: Duration(milliseconds: 800),
      curve: Curves.fastOutSlowIn,
    );

    notifyListeners();
  }

  void setIndexBySlider(int index) {
    _selectedIndex = index;

    notifyListeners();
  }

  // * -------------------------------------

  // * Check Account session is valid ??
  bool accountIsValid() {
    bool emailFlag = _email.value?.isNotEmpty ?? false;
    bool passwordFlag = _password.value?.isNotEmpty ?? false;
    bool passwordConfirmFlag = _passwordConfirm.value?.isNotEmpty ?? false;

    if (emailFlag && passwordFlag && passwordConfirmFlag) {
      return true;
    } else {
      return false;
    }
  }

  // * Check Profile session is valid ??
  bool profileIsValid() {
    bool firstNameFlag = _firstname.value?.isNotEmpty ?? false;
    bool lastNameFlag = _lastname.value?.isNotEmpty ?? false;
    bool dobFlag = _dob.value?.isNotEmpty ?? false;

    if (firstNameFlag && lastNameFlag && dobFlag) {
      return true;
    } else {
      return false;
    }
  }

  // * Check Contact session is valid ??
  bool contactIsValid() {
    bool phoneFlag = _phone.value?.isNotEmpty ?? false;
    bool addressFlag = _address.value.isNotEmpty ?? false;

    if (phoneFlag && addressFlag) {
      return true;
    } else {
      return false;
    }
  }

  /* 
   * Inint data in form edit 
   */
  void initFirstname(value) {
    _firstname.setValue(value);
    // _firstname.setError(null);
  }

  void initLastname(value) {
    _lastname.setValue(value);
    // _lastname.setError(null);
  }

  void initDOB(value) {
    _dob.setValue(value);
    // _dob.setError(null);
  }

  void initPhone(value) {
    _phone.setValue(value);
    // _phone.setError(null);
  }

  void initAddress(value) {
    _address.setValue(value);
    // _address.setError(null);
  }

  // * Validate email
  void validateEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    if (!regex.hasMatch(email) || email.isEmpty) {
      _email.setValueError(null, 'รูปแบบอีเมลไม่ถูกต้อง');
    } else {
      _email.setValueError(email, null);
    }
    notifyListeners();
  }

  // * For validate password structure
  void validatePasswordStructure(String password) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    if (!regExp.hasMatch(password) || password.isEmpty) {
      _password.setValueError(null, 'กำหนดรหัสผ่านอย่างน้อย 8 ตัวอักษร');
    } else {
      _password.setValueError(password, null);
      if (_passwordConfirm.value != null) {
        _passwordConfirm.setError("กรุณายืนยันรหัสผ่านใหม่อีกครั้ง");
      }
    }
    notifyListeners();
  }

  // * For validate password confirm
  void validateConfirmPassword(password, passwordConfirm) {
    if (password != passwordConfirm) {
      _passwordConfirm.setValueError(null, 'ยืนยันรหัสผ่านไม่ถูกต้อง');
    } else {
      _passwordConfirm.setValueError(passwordConfirm, null);
    }
    notifyListeners();
  }

  // * For validate not empty field
  void validateFirstName(String value) {
    if (value.isEmpty) {
      _firstname.setValueError(null, 'กรุณากรอกข้อมูล');
    } else {
      _firstname.setValueError(value, null);
    }
    notifyListeners();
  }

  // * For validate not empty field
  void validateLastName(String value) {
    if (value.isEmpty) {
      _lastname.setValueError(null, 'กรุณากรอกข้อมูล');
    } else {
      _lastname.setValueError(value, null);
    }
    notifyListeners();
  }

  // * For validate not empty field
  void validateDOB(String value) {
    if (value.isEmpty) {
      _dob.setValueError(null, 'กรุณากรอกข้อมูล');
    } else {
      _dob.setValueError(value, null);
    }
    notifyListeners();
  }

  // * For validate not empty field
  void validatePhone(String value) {
    if (value.isEmpty || value.length < 12) {
      _phone.setValueError(null, 'กรุณากรอกข้อมูล');
    } else {
      _phone.setValueError(value, null);
    }
    notifyListeners();
  }

  // * For validate not empty field
  void validateAddress(String value) {
    if (value.isEmpty) {
      _address.setValueError(null, 'กรุณากรอกข้อมูล');
    } else {
      _address.setValueError(value, null);
    }
    notifyListeners();
  }
}
