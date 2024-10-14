import '../User.dart';

/// message : "success"
/// user : {"name":"Ritaj","email":"ritaj@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2ZDJmODc2ZGU5YzQwZTYxN2JhMDRhNiIsIm5hbWUiOiJSaXRhaiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzI1MTAyMTk4LCJleHAiOjE3MzI4NzgxOTh9.NVIzWqodZ35CGIGWwO9h7PfnnUI9vWa7K8_5F8IQNyE"

class RegisterResponse {
  RegisterResponse({
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

  RegisterResponse.fromJson(dynamic json) {
    _message = json['message'];
    statusMsg = json['statusMsg'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _token = json['token'];
  }
  String? _message;
  User? _user;
  String? _token;
  String? statusMsg ;
RegisterResponse copyWith({  String? message,
  User? user,
  String? token,
}) => RegisterResponse(  message: message ?? _message,
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