class category_product_model {
  int? id;
  String? categoryName;
  String? categoryFor;
  String? createdBy;
  String? createdIn;
  String? createdDate;
  String? modifiedBy;
  String? modifiedIn;
  String? modifiedDate;
  String? imageUrl;
  String? flgActive;
  String? image;

  category_product_model(
      {this.id,
      this.categoryName,
      this.categoryFor,
      this.createdBy,
      this.createdIn,
      this.createdDate,
      this.modifiedBy,
      this.modifiedIn,
      this.modifiedDate,
      this.imageUrl,
      this.flgActive,
      this.image});

  category_product_model.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    categoryName = json['CategoryName'];
    categoryFor = json['CategoryFor'];
    createdBy = json['CreatedBy'];
    createdIn = json['CreatedIn'];
    createdDate = json['CreatedDate'];
    modifiedBy = json['ModifiedBy'];
    modifiedIn = json['ModifiedIn'];
    modifiedDate = json['ModifiedDate'];
    imageUrl = json['ImageUrl'];
    flgActive = json['FlgActive'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['CategoryName'] = this.categoryName;
    data['CategoryFor'] = this.categoryFor;
    data['CreatedBy'] = this.createdBy;
    data['CreatedIn'] = this.createdIn;
    data['CreatedDate'] = this.createdDate;
    data['ModifiedBy'] = this.modifiedBy;
    data['ModifiedIn'] = this.modifiedIn;
    data['ModifiedDate'] = this.modifiedDate;
    data['ImageUrl'] = this.imageUrl;
    data['FlgActive'] = this.flgActive;
    data['Image'] = this.image;
    return data;
  }
}
