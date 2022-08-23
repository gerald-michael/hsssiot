class Success {
  final String message;
  Success({
    required this.message,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Success && other.message == message;
  }
}
