class BrandResponseEntity {
  BrandResponseEntity({
    this.results,
    this.metadata,
    this.data,
  });


  int? results;
  MetadataBrandEntity? metadata;
  List<BrandEntity>? data;

}

class BrandEntity {
  BrandEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
  });


  String? id;
  String? name;
  String? slug;
  String? image;
}

class MetadataBrandEntity {
  MetadataBrandEntity({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
  });


  int? currentPage;
  int? numberOfPages;
  int? limit;
  int? nextPage;

}
