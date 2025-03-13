import 'package:e_commerce_app/domain/entities/BrandResponseEntity.dart';

class BrandResponseDto extends BrandResponseEntity {
  String? statusMsg;

  String? message;

  BrandResponseDto({
    this.message,
    this.statusMsg,
    super.results,
    super.metadata,
    super.data,
  });

  BrandResponseDto.fromJson(dynamic json) {
    statusMsg = json['statusMsg'];
    message = json['message'];
    results = json['results'];
    metadata = json['metadata'] != null
        ? MetadataBrandDto.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(BrandDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    if (metadata != null) {
      map['metadata'] = (metadata as MetadataBrandDto).toJson();
    }
    if (data != null) {
      map['data'] = data?.map((v) => (v as BrandDto).toJson()).toList();
    }

    return map;
  }
}

class BrandDto extends BrandEntity {
  String? createdAt;
  String? updatedAt;

  BrandDto({
    super.id,
    super.name,
    super.slug,
    super.image,
    this.createdAt,
    this.updatedAt,
  });

  BrandDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}

class MetadataBrandDto extends MetadataBrandEntity {
  MetadataBrandDto({
    super.currentPage,
    super.numberOfPages,
    super.limit,
    super.nextPage,
  });

  MetadataBrandDto.fromJson(dynamic json) {
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
