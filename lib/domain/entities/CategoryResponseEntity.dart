class CategoryResponseEntity {
  int? results;
  MetadataCategoryEntity? metadata;
  List<CategoryEntity>? data;

  CategoryResponseEntity({
    this.results,
    this.metadata,
    this.data,
  });
}

class CategoryEntity {
  String? id;
  String? name;
  String? slug;
  String? image;

  CategoryEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
  });
}

class MetadataCategoryEntity {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  MetadataCategoryEntity({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });


}
