import 'package:e_commerce_app/domain/entities/BrandResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/CategoryResponseEntity.dart';

class ProductResponseEntity {
  num? results;
  MetadataProductEntity? metadata;
  List<ProductEntity>? data;

  ProductResponseEntity({
    this.results,
    this.metadata,
    this.data,
  });
}

class ProductEntity {
  num? sold;
  List<String>? images;
  List<SubcategoryProductEntity>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  CategoryEntity? category;
  BrandEntity? brand;
  num? ratingsAverage;

  ProductEntity({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });
}

class SubcategoryProductEntity {
  String? id;
  String? name;
  String? slug;
  String? category;

  SubcategoryProductEntity({
    this.id,
    this.name,
    this.slug,
    this.category,
  });
}

class MetadataProductEntity {
  num? currentPage;
  num? numberOfPages;
  num? limit;
  num? nextPage;

  MetadataProductEntity({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
  });
}
