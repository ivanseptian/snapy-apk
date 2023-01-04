class banners_model {
  String? adsName;
  String? adsInfo;
  String? category;
  String? imageUrl;
  String? flgPromotion;
  String? flgAllBranch;
  String? flgActive;
  String? createdBy;
  String? createdIn;
  String? createdDate;
  String? modifiedBy;
  String? modifiedIn;
  String? modifiedDate;
  int? adsId;
  String? adsUrl;
  String? dateStart;
  String? dateEnd;
  String? image;

  banners_model(
      {this.adsName,
        this.adsInfo,
        this.category,
        this.imageUrl,
        this.flgPromotion,
        this.flgAllBranch,
        this.flgActive,
        this.createdBy,
        this.createdIn,
        this.createdDate,
        this.modifiedBy,
        this.modifiedIn,
        this.modifiedDate,
        this.adsId,
        this.adsUrl,
        this.dateStart,
        this.dateEnd,
        this.image});

  banners_model.fromJson(Map<String, dynamic> json) {
    adsName = json['AdsName'];
    adsInfo = json['AdsInfo'];
    category = json['Category'];
    imageUrl = json['ImageUrl'];
    flgPromotion = json['FlgPromotion'];
    flgAllBranch = json['FlgAllBranch'];
    flgActive = json['FlgActive'];
    createdBy = json['CreatedBy'];
    createdIn = json['CreatedIn'];
    createdDate = json['CreatedDate'];
    modifiedBy = json['ModifiedBy'];
    modifiedIn = json['ModifiedIn'];
    modifiedDate = json['ModifiedDate'];
    adsId = json['AdsId'];
    adsUrl = json['AdsUrl'];
    dateStart = json['DateStart'];
    dateEnd = json['DateEnd'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AdsName'] = this.adsName;
    data['AdsInfo'] = this.adsInfo;
    data['Category'] = this.category;
    data['ImageUrl'] = this.imageUrl;
    data['FlgPromotion'] = this.flgPromotion;
    data['FlgAllBranch'] = this.flgAllBranch;
    data['FlgActive'] = this.flgActive;
    data['CreatedBy'] = this.createdBy;
    data['CreatedIn'] = this.createdIn;
    data['CreatedDate'] = this.createdDate;
    data['ModifiedBy'] = this.modifiedBy;
    data['ModifiedIn'] = this.modifiedIn;
    data['ModifiedDate'] = this.modifiedDate;
    data['AdsId'] = this.adsId;
    data['AdsUrl'] = this.adsUrl;
    data['DateStart'] = this.dateStart;
    data['DateEnd'] = this.dateEnd;
    data['image'] = this.image;
    return data;
  }
}
