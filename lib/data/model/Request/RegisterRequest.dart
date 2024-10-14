/// name : "Ritaj"
/// email : "ritaj@gmail.com"
/// password : "Ritaj@123"
/// rePassword : "Ritaj@123"
/// phone : "01010700701"

class RegisterRequest {
  RegisterRequest({
      String? name, 
      String? email, 
      String? password, 
      String? rePassword, 
      String? phone,}){
    _name = name;
    _email = email;
    _password = password;
    _rePassword = rePassword;
    _phone = phone;
}

  RegisterRequest.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
    _rePassword = json['rePassword'];
    _phone = json['phone'];
  }
  String? _name;
  String? _email;
  String? _password;
  String? _rePassword;
  String? _phone;
RegisterRequest copyWith({  String? name,
  String? email,
  String? password,
  String? rePassword,
  String? phone,
}) => RegisterRequest(  name: name ?? _name,
  email: email ?? _email,
  password: password ?? _password,
  rePassword: rePassword ?? _rePassword,
  phone: phone ?? _phone,
);
  String? get name => _name;
  String? get email => _email;
  String? get password => _password;
  String? get rePassword => _rePassword;
  String? get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['password'] = _password;
    map['rePassword'] = _rePassword;
    map['phone'] = _phone;
    return map;
  }

}