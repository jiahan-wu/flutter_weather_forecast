import 'package:json_annotation/json_annotation.dart';

part 'forecast_parameter.g.dart';

@JsonSerializable()
class ForecastParameter {
  ForecastParameter({
    required this.name,
    required this.value,
    required this.unit,
  });

  @JsonKey(name: "parameterName", defaultValue: "")
  final String name;

  @JsonKey(name: "parameterValue", defaultValue: "")
  final String value;

  @JsonKey(name: "parameterUnit", defaultValue: "")
  final String unit;

  factory ForecastParameter.fromJson(Map<String, dynamic> json) =>
      _$ForecastParameterFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastParameterToJson(this);
}
