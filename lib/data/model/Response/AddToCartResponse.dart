/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 1
/// cartId : "66db6298b4b0251d8d9a53d6"
/// data : {"_id":"66db6298b4b0251d8d9a53d6","cartOwner":"66d2f876de9c40e617ba04a6","products":[{"count":1,"_id":"66db6298b4b0251d8d9a53d7","product":"6428eb43dc1175abc65ca0b3","price":149}],"createdAt":"2024-09-06T20:14:16.713Z","updatedAt":"2024-09-06T20:14:16.930Z","__v":0,"totalCartPrice":149}

class AddToCartResponse {
  AddToCartResponse({
      String? status, 
      String? message, 
      num? numOfCartItems, 
      String? cartId, 
      CartData? data,}){
    _status = status;
    _message = message;
    _numOfCartItems = numOfCartItems;
    _cartId = cartId;
    _data = data;
    statusMsg = statusMsg ;
}

  AddToCartResponse.fromJson(dynamic json) {
    _status = json['status'];
    statusMsg = json['statusMsg'];
    _message = json['message'];
    _numOfCartItems = json['numOfCartItems'];
    _cartId = json['cartId'];
    _data = json['data'] != null ? CartData.fromJson(json['data']) : null;
  }
  String? _status;
  String? _message;
  num? _numOfCartItems;
  String? _cartId;
  CartData? _data;
  String? statusMsg ;
AddToCartResponse copyWith({  String? status,
  String? message,
  num? numOfCartItems,
  String? cartId,
  CartData? data,
}) => AddToCartResponse(  status: status ?? _status,
  message: message ?? _message,
  numOfCartItems: numOfCartItems ?? _numOfCartItems,
  cartId: cartId ?? _cartId,
  data: data ?? _data,
);
  String? get status => _status;
  String? get message => _message;
  num? get numOfCartItems => _numOfCartItems;
  String? get cartId => _cartId;
  CartData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['numOfCartItems'] = _numOfCartItems;
    map['cartId'] = _cartId;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// _id : "66db6298b4b0251d8d9a53d6"
/// cartOwner : "66d2f876de9c40e617ba04a6"
/// products : [{"count":1,"_id":"66db6298b4b0251d8d9a53d7","product":"6428eb43dc1175abc65ca0b3","price":149}]
/// createdAt : "2024-09-06T20:14:16.713Z"
/// updatedAt : "2024-09-06T20:14:16.930Z"
/// __v : 0
/// totalCartPrice : 149

class CartData {
  CartData({
      String? id, 
      String? cartOwner, 
      List<AddProducts>? products,
      String? createdAt, 
      String? updatedAt, 
      num? v, 
      num? totalCartPrice,}){
    _id = id;
    _cartOwner = cartOwner;
    _products = products;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
    _totalCartPrice = totalCartPrice;
}

  CartData.fromJson(dynamic json) {
    _id = json['_id'];
    _cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(AddProducts.fromJson(v));
      });
    }
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    _totalCartPrice = json['totalCartPrice'];
  }
  String? _id;
  String? _cartOwner;
  List<AddProducts>? _products;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  num? _totalCartPrice;
CartData copyWith({  String? id,
  String? cartOwner,
  List<AddProducts>? products,
  String? createdAt,
  String? updatedAt,
  num? v,
  num? totalCartPrice,
}) => CartData(  id: id ?? _id,
  cartOwner: cartOwner ?? _cartOwner,
  products: products ?? _products,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  v: v ?? _v,
  totalCartPrice: totalCartPrice ?? _totalCartPrice,
);
  String? get id => _id;
  String? get cartOwner => _cartOwner;
  List<AddProducts>? get products => _products;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;
  num? get totalCartPrice => _totalCartPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['cartOwner'] = _cartOwner;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    map['totalCartPrice'] = _totalCartPrice;
    return map;
  }

}

/// count : 1
/// _id : "66db6298b4b0251d8d9a53d7"
/// product : "6428eb43dc1175abc65ca0b3"
/// price : 149

class AddProducts {
  AddProducts({
      num? count, 
      String? id, 
      String? product, 
      num? price,}){
    _count = count;
    _id = id;
    _product = product;
    _price = price;
}

  AddProducts.fromJson(dynamic json) {
    _count = json['count'];
    _id = json['_id'];
    _product = json['product'];
    _price = json['price'];
  }
  num? _count;
  String? _id;
  String? _product;
  num? _price;
AddProducts copyWith({  num? count,
  String? id,
  String? product,
  num? price,
}) => AddProducts(  count: count ?? _count,
  id: id ?? _id,
  product: product ?? _product,
  price: price ?? _price,
);
  num? get count => _count;
  String? get id => _id;
  String? get product => _product;
  num? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    map['_id'] = _id;
    map['product'] = _product;
    map['price'] = _price;
    return map;
  }

}