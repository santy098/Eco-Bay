import 'detail.dart';

class LongDesc {
  LongDesc(
      {this.discountDetails,
      this.combinedRating,
      this.recycleScore,
      this.ecoRating,
      this.exchangeDtls,
      this.sizeDetails,
      this.seller,
      this.details,
      this.productLink});

  String? discountDetails;
  double? combinedRating;
  double? recycleScore;
  bool? ecoRating;
  String? exchangeDtls;
  List<Map<String, String>>? sizeDetails;
  String? seller;
  List<Detail>? details;
  String? productLink;

  factory LongDesc.fromJson(Map<String, dynamic> json) => LongDesc(
      discountDetails: json["discountDetails"],
      combinedRating: json["combinedRating"],
      recycleScore: json["recycleScore"],
      ecoRating: json["ecoRating"],
      exchangeDtls: json["exchangeDtls"],
      sizeDetails: List<Map<String, String>>.from(json["sizeDetails"].map(
          (x) => Map.from(x).map((k, v) => MapEntry<String, String>(k, v)))),
      seller: json["seller"],
      details:
          List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
      productLink: json["productLink"]);

  Map<String, dynamic> toJson() => {
        "discountDetails": discountDetails,
        "combinedRating": combinedRating,
        "recycleScore": recycleScore,
        "ecoRating": ecoRating,
        "exchangeDtls": exchangeDtls,
        "sizeDetails": List<dynamic>.from(sizeDetails!.map(
            (x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
        "seller": seller,
        "details": List<dynamic>.from(details!.map((x) => x.toJson())),
        "productLink": productLink
      };
}
