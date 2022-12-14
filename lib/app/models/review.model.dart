import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.model.freezed.dart';
part 'review.model.g.dart';

@freezed
class Review with _$Review {
  factory Review({
    int? id,
    double? rating,
    @JsonKey(name: 'service_provider_id') int? serviceProviderId,
    String? comment,
    String? author,
    @JsonKey(name: 'author_pic') String? authorPic,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}
