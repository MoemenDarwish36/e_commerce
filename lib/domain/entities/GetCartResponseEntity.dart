import 'package:e_commerce_app/domain/entities/BrandResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/CategoryResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';

class GetCartResponseEntity {
  String? status;
  num? numOfCartItems;
  String? cartId;
  GetDataCartEntity? data;

  GetCartResponseEntity({
    this.status,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });
}

class GetDataCartEntity {
  String? id;
  String? cartOwner;
  List<GetCartProductsEntity>? products;
  num? v;
  num? totalCartPrice;

  GetDataCartEntity({
    this.id,
    this.cartOwner,
    this.products,
    this.v,
    this.totalCartPrice,
  });
}

class GetCartProductsEntity {
  num? count;
  String? id;
  GetProductEntity? product;
  num? price;

  GetCartProductsEntity({
    this.count,
    this.id,
    this.product,
    this.price,
  });
}

class GetProductEntity {
  GetProductEntity({
    this.subcategory,
    this.id,
    this.title,
    this.quantity,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });

  List<SubcategoryProductEntity>? subcategory;
  String? id;
  String? title;
  num? quantity;
  String? imageCover;
  CategoryResponseEntity? category;
  BrandResponseEntity? brand;
  num? ratingsAverage;
}
