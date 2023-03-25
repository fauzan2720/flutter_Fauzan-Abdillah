extension FormValidatorExt on String {
  bool isEmailRegExp() {
    return !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  }
}
