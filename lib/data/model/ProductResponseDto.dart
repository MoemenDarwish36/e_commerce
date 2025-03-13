import 'package:e_commerce_app/data/model/BrandResponseDto.dart';
import 'package:e_commerce_app/data/model/CategoryResponseDto.dart';
import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';

class ProductResponseDto extends ProductResponseEntity {
  String? statusMsg;
  String? message;

  ProductResponseDto({
    this.statusMsg,
    this.message,
    super.results,
    super.metadata,
    super.data,
  });

  ProductResponseDto.fromJson(dynamic json) {
    results = json['results'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    metadata = json['metadata'] != null
        ? MetadataProductDto.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    if (metadata != null) {
      if (metadata is MetadataProductDto) {
        map['metadata'] = metadata;
      } else {
        map['metadata'] = {};
      }
    }

    if (data != null) {
      map['data'] =
          data?.map((v) => v is ProductDto ? v.toJson() : {}).toList();
    }
    return map;
  }
}

class ProductDto extends ProductEntity {
  String? createdAt;
  String? updatedAt;

  ProductDto({
    super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  });

  ProductDto.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(SubcategoryProductDto.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? CategoryDto.fromJson(json['category'])
        : null;
    brand = json['brand'] != null ? BrandDto.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sold'] = sold;
    map['images'] = images;

    if (subcategory != null) {
      map['subcategory'] = subcategory
          ?.map((v) => v is SubcategoryProductDto ? v.toJson() : {})
          .toList();
    }
    map['ratingsQuantity'] = ratingsQuantity;
    map['_id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['description'] = description;
    map['quantity'] = quantity;
    map['price'] = price;
    map['imageCover'] = imageCover;
    if (category != null) {
      // map['category'] = category?.toJson();
    }
    if (brand != null) {
      // map['brand'] = brand?.toJson();
    }
    map['ratingsAverage'] = ratingsAverage;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}

class SubcategoryProductDto extends SubcategoryProductEntity {
  SubcategoryProductDto({
    super.id,
    super.name,
    super.slug,
    super.category,
  });

  SubcategoryProductDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['category'] = category;
    return map;
  }
}

class MetadataProductDto extends MetadataProductEntity {
  MetadataProductDto({
    super.currentPage,
    super.numberOfPages,
    super.limit,
    super.nextPage,
  });

  MetadataProductDto.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    map['nextPage'] = nextPage;
    return map;
  }
}
