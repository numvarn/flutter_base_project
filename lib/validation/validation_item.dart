class ValidationItem {
  // ignore: unused_field
  String _value;
  // ignore: unused_field
  String _error;

  ValidationItem(this._value, this._error);

  void setValueError(value, errorMsg) {
    this._value = value;
    this._error = errorMsg;
  }

  void setValue(String value) {
    this._value = value;
  }

  void setError(String errorMsg) {
    this._error = errorMsg;
  }

  get value => _value;
  get error => _error;
}
