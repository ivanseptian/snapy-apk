class service_model {
  String? serviceName;
  String? serviceDescription;
  String? categoriesId;
  String? tagsId;
  String? price;
  String? unitId;
  String? discountPctg;
  String? discountRp;
  String? priceAfterDiscount;
  String? taxPctg;
  String? taxRp;
  String? priceWithTax;
  String? invSKU;
  String? flgIsResource;
  String? flgIsVoucher;
  String? resourceID;
  String? validUntil;
  String? rewardPoint;
  String? photoPath;
  String? flgActive;
  String? createdBy;
  String? createdIn;
  String? createdDate;
  String? modifiedBy;
  String? modifiedIn;
  String? modifiedDate;
  int? serviceId;
  String? image;

  service_model(
      {this.serviceName,
      this.serviceDescription,
      this.categoriesId,
      this.tagsId,
      this.price,
      this.unitId,
      this.discountPctg,
      this.discountRp,
      this.priceAfterDiscount,
      this.taxPctg,
      this.taxRp,
      this.priceWithTax,
      this.invSKU,
      this.flgIsResource,
      this.flgIsVoucher,
      this.resourceID,
      this.validUntil,
      this.rewardPoint,
      this.photoPath,
      this.flgActive,
      this.createdBy,
      this.createdIn,
      this.createdDate,
      this.modifiedBy,
      this.modifiedIn,
      this.modifiedDate,
      this.serviceId,
      this.image});

  service_model.fromJson(Map<String, dynamic> json) {
    serviceName = json['ServiceName'];
    serviceDescription = json['ServiceDescription'];
    categoriesId = json['CategoriesId'];
    tagsId = json['TagsId'];
    price = json['Price'];
    unitId = json['UnitId'];
    discountPctg = json['DiscountPctg'];
    discountRp = json['DiscountRp'];
    priceAfterDiscount = json['PriceAfterDiscount'];
    taxPctg = json['TaxPctg'];
    taxRp = json['TaxRp'];
    priceWithTax = json['PriceWithTax'];
    invSKU = json['InvSKU'];
    flgIsResource = json['FlgIsResource'];
    flgIsVoucher = json['FlgIsVoucher'];
    resourceID = json['ResourceID'];
    validUntil = json['ValidUntil'];
    rewardPoint = json['RewardPoint'];
    photoPath = json['PhotoPath'];
    flgActive = json['FlgActive'];
    createdBy = json['CreatedBy'];
    createdIn = json['CreatedIn'];
    createdDate = json['CreatedDate'];
    modifiedBy = json['ModifiedBy'];
    modifiedIn = json['ModifiedIn'];
    modifiedDate = json['ModifiedDate'];
    serviceId = json['ServiceId'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ServiceName'] = this.serviceName;
    data['ServiceDescription'] = this.serviceDescription;
    data['CategoriesId'] = this.categoriesId;
    data['TagsId'] = this.tagsId;
    data['Price'] = this.price;
    data['UnitId'] = this.unitId;
    data['DiscountPctg'] = this.discountPctg;
    data['DiscountRp'] = this.discountRp;
    data['PriceAfterDiscount'] = this.priceAfterDiscount;
    data['TaxPctg'] = this.taxPctg;
    data['TaxRp'] = this.taxRp;
    data['PriceWithTax'] = this.priceWithTax;
    data['InvSKU'] = this.invSKU;
    data['FlgIsResource'] = this.flgIsResource;
    data['FlgIsVoucher'] = this.flgIsVoucher;
    data['ResourceID'] = this.resourceID;
    data['ValidUntil'] = this.validUntil;
    data['RewardPoint'] = this.rewardPoint;
    data['PhotoPath'] = this.photoPath;
    data['FlgActive'] = this.flgActive;
    data['CreatedBy'] = this.createdBy;
    data['CreatedIn'] = this.createdIn;
    data['CreatedDate'] = this.createdDate;
    data['ModifiedBy'] = this.modifiedBy;
    data['ModifiedIn'] = this.modifiedIn;
    data['ModifiedDate'] = this.modifiedDate;
    data['ServiceId'] = this.serviceId;
    data['Image'] = this.image;
    return data;
  }
}
