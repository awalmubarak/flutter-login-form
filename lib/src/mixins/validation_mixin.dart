


class ValidationMixin {

  String validateEmail(String value) {
    if (!value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String validatePassword(String value){
    if (value.trim().length<6){
      return 'Password must me at least 6 characters';
    }

    return null;
  }

}