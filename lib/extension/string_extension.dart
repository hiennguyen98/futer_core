
extension StringExtension on String {
  static const needleRegex = r'{#}';
  static const needle = '{#}';
  static final RegExp exp = new RegExp(needleRegex);

  /// check integer value
  bool isInt() {
    bool result = false;
    try{
      int temp = int.tryParse(this);
      result = temp != null;
    }catch(_){}
    return result;
  }

  static bool isNullOrEmpty(String string) {
    return string == null || string.isEmpty;
  }

  bool isValidEmail() {
    if (this.trim().isEmpty) return false;
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
  }

  bool isValidPhoneNumber() {
    if (this.trim().isEmpty) return false;
    Pattern pattern =
        r'^[1-9]{9,11}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(this);
  }

  bool isValidPassword() {
    if (this.trim().isEmpty) return false;
    RegExp regex =
    RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@%^&*-]).{8,}");
    return regex.hasMatch(this);
  }
}