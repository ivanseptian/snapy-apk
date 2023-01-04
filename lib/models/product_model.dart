class product_model {
  String? productName;
  String? imageURLs;
  String? productURLs;
  String? productDescription;
  String? categoriesId;
  String? tagId;
  String? price;
  String? unitId;
  Null? discountPctg;
  String? discountRp;
  String? priceAfterDiscount;
  String? taxPctg;
  String? taxRp;
  String? priceWithTax;
  Null? invSKU;
  Null? invBrand;
  String? invQty;
  String? invWidth;
  String? invHeight;
  String? invDepth;
  String? invWeight;
  String? invShippingFee;
  String? rewardPoint;
  String? flgActive;
  String? createdBy;
  String? createdIn;
  String? createdDate;
  String? modifiedBy;
  String? modifiedIn;
  String? modifiedDate;
  int? productId;
  String? image;

  product_model(
      {this.productName,
      this.imageURLs,
      this.productURLs,
      this.productDescription,
      this.categoriesId,
      this.tagId,
      this.price,
      this.unitId,
      this.discountPctg,
      this.discountRp,
      this.priceAfterDiscount,
      this.taxPctg,
      this.taxRp,
      this.priceWithTax,
      this.invSKU,
      this.invBrand,
      this.invQty,
      this.invWidth,
      this.invHeight,
      this.invDepth,
      this.invWeight,
      this.invShippingFee,
      this.rewardPoint,
      this.flgActive,
      this.createdBy,
      this.createdIn,
      this.createdDate,
      this.modifiedBy,
      this.modifiedIn,
      this.modifiedDate,
      this.productId,
      this.image});

  product_model.fromJson(Map<String, dynamic> json) {
    productName = json['ProductName'];
    imageURLs = json['ImageURLs'];
    productURLs = json['ProductURLs'];
    productDescription = json['ProductDescription'];
    categoriesId = json['CategoriesId'];
    tagId = json['TagId'];
    price = json['Price'];
    unitId = json['UnitId'];
    discountPctg = json['DiscountPctg'];
    discountRp = json['DiscountRp'];
    priceAfterDiscount = json['PriceAfterDiscount'];
    taxPctg = json['TaxPctg'];
    taxRp = json['TaxRp'];
    priceWithTax = json['PriceWithTax'];
    invSKU = json['InvSKU'];
    invBrand = json['InvBrand'];
    invQty = json['InvQty'];
    invWidth = json['InvWidth'];
    invHeight = json['InvHeight'];
    invDepth = json['InvDepth'];
    invWeight = json['InvWeight'];
    invShippingFee = json['InvShippingFee'];
    rewardPoint = json['RewardPoint'];
    flgActive = json['FlgActive'];
    createdBy = json['CreatedBy'];
    createdIn = json['CreatedIn'];
    createdDate = json['CreatedDate'];
    modifiedBy = json['ModifiedBy'];
    modifiedIn = json['ModifiedIn'];
    modifiedDate = json['ModifiedDate'];
    productId = json['ProductId'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductName'] = this.productName;
    data['ImageURLs'] = this.imageURLs;
    data['ProductURLs'] = this.productURLs;
    data['ProductDescription'] = this.productDescription;
    data['CategoriesId'] = this.categoriesId;
    data['TagId'] = this.tagId;
    data['Price'] = this.price;
    data['UnitId'] = this.unitId;
    data['DiscountPctg'] = this.discountPctg;
    data['DiscountRp'] = this.discountRp;
    data['PriceAfterDiscount'] = this.priceAfterDiscount;
    data['TaxPctg'] = this.taxPctg;
    data['TaxRp'] = this.taxRp;
    data['PriceWithTax'] = this.priceWithTax;
    data['InvSKU'] = this.invSKU;
    data['InvBrand'] = this.invBrand;
    data['InvQty'] = this.invQty;
    data['InvWidth'] = this.invWidth;
    data['InvHeight'] = this.invHeight;
    data['InvDepth'] = this.invDepth;
    data['InvWeight'] = this.invWeight;
    data['InvShippingFee'] = this.invShippingFee;
    data['RewardPoint'] = this.rewardPoint;
    data['FlgActive'] = this.flgActive;
    data['CreatedBy'] = this.createdBy;
    data['CreatedIn'] = this.createdIn;
    data['CreatedDate'] = this.createdDate;
    data['ModifiedBy'] = this.modifiedBy;
    data['ModifiedIn'] = this.modifiedIn;
    data['ModifiedDate'] = this.modifiedDate;
    data['ProductId'] = this.productId;
    data['image'] = this.image;
    return data;
  }
}
