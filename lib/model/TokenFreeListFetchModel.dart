class TokenFreeListFetchModel {
  TokenFreeListFetchModel({
    this.typename,
    this.getPackages,
  });

  final String typename;
  final GetPackages getPackages;

  factory TokenFreeListFetchModel.fromMap(Map<String, dynamic> json) => TokenFreeListFetchModel(
    typename: json["__typename"] == null ? null : json["__typename"],
    getPackages: json["getPackages"] == null ? null : GetPackages.fromMap(json["getPackages"]),
  );

  Map<String, dynamic> toMap() => {
    "__typename": typename == null ? null : typename,
    "getPackages": getPackages == null ? null : getPackages.toMap(),
  };
}

class GetPackages {
  GetPackages({
    this.typename,
    this.statusCode,
    this.message,
    this.result,
  });

  final String typename;
  final int statusCode;
  final String message;
  final Result result;

  factory GetPackages.fromMap(Map<String, dynamic> json) => GetPackages(
    typename: json["__typename"] == null ? null : json["__typename"],
    statusCode: json["statusCode"] == null ? null : json["statusCode"],
    message: json["message"] == null ? null : json["message"],
    result: json["result"] == null ? null : Result.fromMap(json["result"]),
  );

  Map<String, dynamic> toMap() => {
    "__typename": typename == null ? null : typename,
    "statusCode": statusCode == null ? null : statusCode,
    "message": message == null ? null : message,
    "result": result == null ? null : result.toMap(),
  };
}

class Result {
  Result({
    this.typename,
    this.count,
    this.packages,
  });

  final String typename;
  final int count;
  final List<Package> packages;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    typename: json["__typename"] == null ? null : json["__typename"],
    count: json["count"] == null ? null : json["count"],
    packages: json["packages"] == null ? null : List<Package>.from(json["packages"].map((x) => Package.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "__typename": typename == null ? null : typename,
    "count": count == null ? null : count,
    "packages": packages == null ? null : List<dynamic>.from(packages.map((x) => x.toMap())),
  };
}

class Package {
  Package({
    this.typename,
    this.uid,
    this.title,
    this.startingPrice,
    this.thumbnail,
    this.amenities,
    this.discount,
    this.durationText,
    this.loyaltyPointText,
    this.description,
  });

  final String typename;
  final String uid;
  final String title;
  final int startingPrice;
  final String thumbnail;
  final List<Amenity> amenities;
  final dynamic discount;
  final String durationText;
  final String loyaltyPointText;
  final String description;

  factory Package.fromMap(Map<String, dynamic> json) => Package(
    typename: json["__typename"] == null ? null : json["__typename"],
    uid: json["uid"] == null ? null : json["uid"],
    title: json["title"] == null ? null : json["title"],
    startingPrice: json["startingPrice"] == null ? null : json["startingPrice"],
    thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
    amenities: json["amenities"] == null ? null : List<Amenity>.from(json["amenities"].map((x) => Amenity.fromMap(x))),
    discount: json["discount"],
    durationText: json["durationText"] == null ? null : json["durationText"],
    loyaltyPointText: json["loyaltyPointText"] == null ? null : json["loyaltyPointText"],
    description: json["description"] == null ? null : json["description"],
  );

  Map<String, dynamic> toMap() => {
    "__typename": typename == null ? null : typename,
    "uid": uid == null ? null : uid,
    "title": title == null ? null : title,
    "startingPrice": startingPrice == null ? null : startingPrice,
    "thumbnail": thumbnail == null ? null : thumbnail,
    "amenities": amenities == null ? null : List<dynamic>.from(amenities.map((x) => x.toMap())),
    "discount": discount,
    "durationText": durationText == null ? null : durationText,
    "loyaltyPointText": loyaltyPointText == null ? null : loyaltyPointText,
    "description": description == null ? null : description,
  };
}

class Amenity {
  Amenity({
    this.typename,
    this.title,
    this.icon,
  });

  final Typename typename;
  final Title title;
  final String icon;

  factory Amenity.fromMap(Map<String, dynamic> json) => Amenity(
    typename: json["__typename"] == null ? null : typenameValues.map[json["__typename"]],
    title: json["title"] == null ? null : titleValues.map[json["title"]],
    icon: json["icon"] == null ? null : json["icon"],
  );

  Map<String, dynamic> toMap() => {
    "__typename": typename == null ? null : typenameValues.reverse[typename],
    "title": title == null ? null : titleValues.reverse[title],
    "icon": icon == null ? null : icon,
  };
}

enum Title { PLANE, BUS, CAR, TRAIN }

final titleValues = EnumValues({
  "bus": Title.BUS,
  "car": Title.CAR,
  "plane": Title.PLANE,
  "train": Title.TRAIN
});

enum Typename { AMENITY }

final typenameValues = EnumValues({
  "Amenity": Typename.AMENITY
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
