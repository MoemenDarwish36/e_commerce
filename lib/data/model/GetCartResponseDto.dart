import 'package:e_commerce_app/data/model/BrandResponseDto.dart';
import 'package:e_commerce_app/data/model/CategoryResponseDto.dart';
import 'package:e_commerce_app/data/model/ProductResponseDto.dart';
import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';

class GetCartResponseDto extends GetCartResponseEntity {
  String? statusMsg;
  String? message;

  GetCartResponseDto({
    this.statusMsg,
    this.message,
    super.status,
    super.numOfCartItems,
    super.cartId,
    super.data,
  });

  GetCartResponseDto.fromJson(dynamic json) {
    statusMsg = json['statusMsg'];
    message = json['message'];
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? GetDataCartDto.fromJson(json['data']) : null;
  }
}

class GetDataCartDto extends GetDataCartEntity {
  GetDataCartDto({
    super.id,
    super.cartOwner,
    super.products,
    this.createdAt,
    this.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  GetDataCartDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(GetCartProductsDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }

  String? createdAt;
  String? updatedAt;
}

class GetCartProductsDto extends GetCartProductsEntity {
  GetCartProductsDto({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  GetCartProductsDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] != null
        ? GetProductDto.fromJson(json['product'])
        : null;
    price = json['price'];
  }
}

class GetProductDto extends GetProductEntity {
  GetProductDto({
    super.subcategory,
    super.title,
    super.quantity,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    super.id,
  });

  GetProductDto.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(SubcategoryProductDto.fromJson(v));
      });
    }
    id = json['_id'];
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? CategoryResponseDto.fromJson(json['category'])
        : null;
    brand =
        json['brand'] != null ? BrandResponseDto.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    id = json['id'];
  }
}
