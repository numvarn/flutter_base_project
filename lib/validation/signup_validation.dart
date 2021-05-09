import 'package:base_project/validation/validation_item.dart';
import 'package:flutter/material.dart';

class SignupValidation with ChangeNotifier {
  ValidationItem _email = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);
  ValidationItem _passwordConfirm = ValidationItem(null, null);

  ValidationItem _firstname = ValidationItem(null, null);
  ValidationItem _lastname = ValidationItem(null, null);
  ValidationItem _dob = ValidationItem(null, null);

  ValidationItem _phone = ValidationItem(null, null);
  ValidationItem _address = ValidationItem(null, null);

  // * Getters
  ValidationItem get email => _email;
  ValidationItem get password => _password;
  ValidationItem get passwordConfirm => _passwordConfirm;

  ValidationItem get firstname => _firstname;
  ValidationItem get lastname => _lastname;
  ValidationItem get dob => _dob;

  ValidationItem get phone => _phone;
  ValidationItem get address => _address;

  // * Check Account session is valid ??
  bool accountIsValid() {
    if (_email.value != null && _password.value != null && _passwordConfirm != null && _passwordConfirm.error == null) {
      return true;
    } else {
      return false;
    }
  }

  // * Check Profile session is valid ??
  bool profileIsValid() {
    if (_firstname.value != null && _lastname.value != null && _dob.value != null) {
      return true;
    } else {
      return false;
    }
  }

  // * Check Contact session is valid ??
  bool contactIsValid() {
    if (_phone.value != null && _address.value != null) {
      return true;
    } else {
      return false;
    }
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
