/// status : "success"
/// message : "Product added successfully to your wishlist"
/// data : ["6428ebc6dc1175abc65ca0b9"]

class AddToWishListResponse {
  AddToWishListResponse({
      String? status, 
      String? message, 
      List<String>? data,}){
    _status = status;
    _message = message;
    _data = data;
    statusMsg = statusMsg;
}

  AddToWishListResponse.fromJson(dynamic json) {
    _status = json['status'];
    statusMsg = json['statusMsg'];
    _message = json['message'];
    _data = json['data'] != null ? json['data'].cast<String>() : [];
  }
  String? _status;
  String? _message;
  List<String>? _data;
  String? statusMsg ;
AddToWishListResponse copyWith({  String? status,
  String? message,
  List<String>? data,
}) => AddToWishListResponse(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  String? get status => _status;
  String? get message => _message;
  List<String>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['data'] = _data;
    return map;
  }

}