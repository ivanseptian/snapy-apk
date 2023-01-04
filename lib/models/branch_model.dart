class branch_model {
  int? branchId;
  String? branchName;
  String? branchCode;
  String? branchDescription;
  String? features;
  String? flg24Hours;
  String? flgHead;
  String? flgMarkaz;
  String? rating;
  String? locAddress;
  String? locCity;
  String? locProvince;
  String? locLatitude;
  String? locLongtitude;
  String? officeNumber;
  String? mobileNumber;
  String? whatsapp;
  String? fax;
  String? email;
  String? website;
  String? photoPath;
  String? flgActive;
  String? createdBy;
  String? createdIn;
  String? createdDate;
  String? modifiedBy;
  String? modifiedIn;
  String? modifiedDate;
  String? image;
  String? latlon;

  branch_model(
      {this.branchId,
      this.branchName,
      this.branchCode,
      this.branchDescription,
      this.features,
      this.flg24Hours,
      this.flgHead,
      this.flgMarkaz,
      this.rating,
      this.locAddress,
      this.locCity,
      this.locProvince,
      this.locLatitude,
      this.locLongtitude,
      this.officeNumber,
      this.mobileNumber,
      this.whatsapp,
      this.fax,
      this.email,
      this.website,
      this.photoPath,
      this.flgActive,
      this.createdBy,
      this.createdIn,
      this.createdDate,
      this.modifiedBy,
      this.modifiedIn,
      this.modifiedDate,
      this.image,
      this.latlon});

  branch_model.fromJson(Map<String, dynamic> json) {
    branchId = json['BranchId'];
    branchName = json['BranchName'];
    branchCode = json['BranchCode'];
    branchDescription = json['BranchDescription'];
    features = json['Features'];
    flg24Hours = json['Flg24Hours'];
    flgHead = json['FlgHead'];
    flgMarkaz = json['FlgMarkaz'];
    rating = json['Rating'];
    locAddress = json['LocAddress'];
    locCity = json['LocCity'];
    locProvince = json['LocProvince'];
    locLatitude = json['LocLatitude'];
    locLongtitude = json['LocLongtitude'];
    officeNumber = json['OfficeNumber'];
    mobileNumber = json['MobileNumber'];
    whatsapp = json['Whatsapp'];
    fax = json['Fax'];
    email = json['Email'];
    website = json['Website'];
    photoPath = json['PhotoPath'];
    flgActive = json['FlgActive'];
    createdBy = json['CreatedBy'];
    createdIn = json['CreatedIn'];
    createdDate = json['CreatedDate'];
    modifiedBy = json['ModifiedBy'];
    modifiedIn = json['ModifiedIn'];
    modifiedDate = json['ModifiedDate'];
    image = json['image'];
    latlon = json['latlon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BranchId'] = this.branchId;
    data['BranchName'] = this.branchName;
    data['BranchCode'] = this.branchCode;
    data['BranchDescription'] = this.branchDescription;
    data['Features'] = this.features;
    data['Flg24Hours'] = this.flg24Hours;
    data['FlgHead'] = this.flgHead;
    data['FlgMarkaz'] = this.flgMarkaz;
    data['Rating'] = this.rating;
    data['LocAddress'] = this.locAddress;
    data['LocCity'] = this.locCity;
    data['LocProvince'] = this.locProvince;
    data['LocLatitude'] = this.locLatitude;
    data['LocLongtitude'] = this.locLongtitude;
    data['OfficeNumber'] = this.officeNumber;
    data['MobileNumber'] = this.mobileNumber;
    data['Whatsapp'] = this.whatsapp;
    data['Fax'] = this.fax;
    data['Email'] = this.email;
    data['Website'] = this.website;
    data['PhotoPath'] = this.photoPath;
    data['FlgActive'] = this.flgActive;
    data['CreatedBy'] = this.createdBy;
    data['CreatedIn'] = this.createdIn;
    data['CreatedDate'] = this.createdDate;
    data['ModifiedBy'] = this.modifiedBy;
    data['ModifiedIn'] = this.modifiedIn;
    data['ModifiedDate'] = this.modifiedDate;
    data['image'] = this.image;
    data['latlon'] = this.latlon;
    return data;
  }
}
