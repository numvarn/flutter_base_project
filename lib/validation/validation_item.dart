class ValidationItem {
  String value;
  String error;

  ValidationItem(this.value, this.error);

  void setValueError(value, errorMsg) {
    this.value = value;
    this.error = errorMsg;
  }

  void setValue(String value) {
    this.value = value;
  }

  void setError(String errorMsg) {
    this.error = errorMsg;
  }
}
