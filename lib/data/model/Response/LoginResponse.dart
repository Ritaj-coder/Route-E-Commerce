/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutti@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2YmQ1MDU2ZWQwZGMwMDE2YzY0ZGNmYiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzI1MTE3ODcxLCJleHAiOjE3MzI4OTM4NzF9.T38K7p6qPiupFTqCVa7jTImBILAjqAqISS8e0SAsMN4"

class LoginResponse {
  LoginResponse({
      String? message, 
      User? user, 
      String? token,
      String? statusMsg
  }){
    _message = message;
    _user = user;
    _token = token;
    statusMsg = statusMsg ;
}

  LoginResponse.fromJson(dynamic json) {
    _message = json['message'];
    statusMsg = json['statusMsg'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _token = json['token'];
  }
  String? _message;
  User? _user;
  String? _token;
  String? statusMsg ;
LoginResponse copyWith({  String? message,
  User? user,
  String? token,
}) => LoginResponse(  message: message ?? _message,
  user: user ?? _user,
  token: token ?? _token,
);
  String? get message => _message;
  User? get user => _user;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['token'] = _token;
    return map;
  }

}

/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmutti@gmail.com"
/// role : "user"

class User {
  User({
      String? name, 
      String? email, 
      String? role,}){
    _name = name;
    _email = email;
    _role = role;
}

  User.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _role = json['role'];
  }
  String? _name;
  String? _email;
  String? _role;
User copyWith({  String? name,
  String? email,
  String? role,
}) => User(  name: name ?? _name,
  email: email ?? _email,
  role: role ?? _role,
);
  String? get name => _name;
  String? get email => _email;
  String? get role => _role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['role'] = _role;
    return map;
  }

}