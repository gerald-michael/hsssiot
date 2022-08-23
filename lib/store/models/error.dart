class ErrorJson {
  final Map<String, List<String>> errors;
  ErrorJson({
    required this.errors,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ErrorJson && other.errors == errors;
  }

  @override
  int get hashCode => errors.hashCode;
  ErrorJson.fromJson(Map<String, List<String>> parsedJson)
      : errors = parsedJson;
}
