/// status : "success"
/// message : "Product removed successfully to your wishlist"
/// data : ["6428ebc6dc1175abc65ca0b9","6428ead5dc1175abc65ca0ad","6428e997dc1175abc65ca0a1","6428eb43dc1175abc65ca0b3","6428e479dc1175abc65ca078","6428e509dc1175abc65ca07e","6428def9dc1175abc65ca061","6428ca68dc1175abc65ca02b"]

class DeleteWishlistResponse {
  DeleteWishlistResponse({
      String? status, 
      String? message, 
      List<String>? data,}){
    _status = status;
    _message = message;
    _data = data;
    statusMsg = statusMsg;
}

  DeleteWishlistResponse.fromJson(dynamic json) {
    _status = json['status'];
    statusMsg = json['statusMsg'];
    _message = json['message'];
    _data = json['data'] != null ? json['data'].cast<String>() : [];
  }
  String? _status;
  String? _message;
  List<String>? _data;
  String? statusMsg ;
DeleteWishlistResponse copyWith({  String? status,
  String? message,
  List<String>? data,
}) => DeleteWishlistResponse(  status: status ?? _status,
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