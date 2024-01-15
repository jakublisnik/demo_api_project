import 'package:json_annotation/json_annotation.dart';

part 'cat_fact.g.dart';

@JsonSerializable()
class CatFactResponse {
  final int currentPage;
  final List<CatFact> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final List<Link> links;
  final String nextPageUrl;
  final String path;
  final int perPage;
  final int? prevPageUrl;
  final int to;
  final int total;

  CatFactResponse(
      this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total);

  factory CatFactResponse.fromJson(Map<String, dynamic> json) =>
      _$CatFactResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CatFactResponseToJson(this);
}

@JsonSerializable()
class CatFact {
  final String fact;
  final int length;

  CatFact(this.fact, this.length);

  factory CatFact.fromJson(Map<String, dynamic> json) => _$CatFactFromJson(json);

  Map<String, dynamic> toJson() => _$CatFactToJson(this);
}

@JsonSerializable()
class Link {
  final String? url;
  final String label;
  final bool active;

  Link(this.url, this.label, this.active);

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

  Map<String, dynamic> toJson() => _$LinkToJson(this);
}
