class AddToCartResponseEntity {
  String? status;
  String? message;
  num? numOfCartItems;
  String? cartId;
  AddDataCartEntity? data;

  AddToCartResponseEntity({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });
}

class AddDataCartEntity {
  String? id;
  String? cartOwner;
  List<AddProductsEntity>? products;
  num? v;
  num? totalCartPrice;

  AddDataCartEntity({
    this.id,
    this.cartOwner,
    this.products,
    this.v,
    this.totalCartPrice,
  });
}

class AddProductsEntity {
  num? count;
  String? id;
  String? product;
  num? price;

  AddProductsEntity({
    this.count,
    this.id,
    this.product,
    this.price,
  });
}
