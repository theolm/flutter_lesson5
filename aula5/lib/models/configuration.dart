// To parse this JSON data, do
//
//     final configuration = configurationFromJson(jsonString);

import 'dart:convert';

Configuration configurationFromJson(String str) => Configuration.fromJson(json.decode(str));

String configurationToJson(Configuration data) => json.encode(data.toJson());

class Configuration {
  final Images images;
  final List<String> changeKeys;

  Configuration({
    this.images,
    this.changeKeys,
  });

  factory Configuration.fromJson(Map<String, dynamic> json) => Configuration(
    images: Images.fromJson(json["images"]),
    changeKeys: List<String>.from(json["change_keys"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "images": images.toJson(),
    "change_keys": List<dynamic>.from(changeKeys.map((x) => x)),
  };
}

class Images {
  final String baseUrl;
  final String secureBaseUrl;
  final List<String> backdropSizes;
  final List<String> logoSizes;
  final List<String> posterSizes;
  final List<String> profileSizes;
  final List<String> stillSizes;

  Images({
    this.baseUrl,
    this.secureBaseUrl,
    this.backdropSizes,
    this.logoSizes,
    this.posterSizes,
    this.profileSizes,
    this.stillSizes,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    baseUrl: json["base_url"],
    secureBaseUrl: json["secure_base_url"],
    backdropSizes: List<String>.from(json["backdrop_sizes"].map((x) => x)),
    logoSizes: List<String>.from(json["logo_sizes"].map((x) => x)),
    posterSizes: List<String>.from(json["poster_sizes"].map((x) => x)),
    profileSizes: List<String>.from(json["profile_sizes"].map((x) => x)),
    stillSizes: List<String>.from(json["still_sizes"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "base_url": baseUrl,
    "secure_base_url": secureBaseUrl,
    "backdrop_sizes": List<dynamic>.from(backdropSizes.map((x) => x)),
    "logo_sizes": List<dynamic>.from(logoSizes.map((x) => x)),
    "poster_sizes": List<dynamic>.from(posterSizes.map((x) => x)),
    "profile_sizes": List<dynamic>.from(profileSizes.map((x) => x)),
    "still_sizes": List<dynamic>.from(stillSizes.map((x) => x)),
  };
}
