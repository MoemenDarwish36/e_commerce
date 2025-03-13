import 'package:e_commerce_app/domain/entities/AddToCartResponseEntity.dart';

class AddToCartResponseDto extends AddToCartResponseEntity {
  String? statusMsg;

  AddToCartResponseDto({
    this.statusMsg,
    super.status,
    super.message,
    super.numOfCartItems,
    super.cartId,
    super.data,
  });

  AddToCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    statusMsg = json['statusMsg'];

    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? AddDataCartDto.fromJson(json['data']) : null;
  }
}

class AddDataCartDto extends AddDataCartEntity {
  String? createdAt;
  String? updatedAt;

  AddDataCartDto({
    super.id,
    super.cartOwner,
    super.products,
    this.createdAt,
    this.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  AddDataCartDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddProductsDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class AddProductsDto extends AddProductsEntity {
  AddProductsDto({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  AddProductsDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    map['product'] = product;
    map['price'] = price;
    return map;
  }
}
