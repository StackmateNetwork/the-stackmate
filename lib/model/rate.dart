import 'package:freezed_annotation/freezed_annotation.dart';

part 'rate.g.dart';
part 'rate.freezed.dart';

@freezed
class Rate with _$Rate {
  const factory Rate({
    required String symbol,
    required String name,
    required double rate,
  }) = _Rate;

  factory Rate.fromJson(Map<String, dynamic> json) => _$RateFromJson(json);
}

const List<Rate> mockRates = [
  Rate(name: 'Indian Ruppee', symbol: 'INR', rate: 1544230.03),
  Rate(name: 'Euro', symbol: 'EUR', rate: 15931.3),
  Rate(name: 'Australian Dollar', symbol: 'AUD', rate: 25686.33),
  Rate(name: 'U.S. Dollar', symbol: 'USD', rate: 19302.88),
];
