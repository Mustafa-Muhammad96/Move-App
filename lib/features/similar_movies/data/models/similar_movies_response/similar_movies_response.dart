import 'data.dart';
import 'meta.dart';

class SimilarMoviesResponse {
  String? status;
  String? statusMessage;
  Data? data;
  Meta? meta;

  SimilarMoviesResponse({
    this.status,
    this.statusMessage,
    this.data,
    this.meta,
  });

  factory SimilarMoviesResponse.fromJson(Map<String, dynamic> json) {
    return SimilarMoviesResponse(
      status: json['status'] as String?,
      statusMessage: json['status_message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      meta: json['@meta'] == null
          ? null
          : Meta.fromJson(json['@meta'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'status_message': statusMessage,
    'data': data?.toJson(),
    '@meta': meta?.toJson(),
  };
}
