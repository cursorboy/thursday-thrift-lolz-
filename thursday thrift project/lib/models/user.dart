class User {
  final String name;
  final String email;
  final List<String> selectedStyles;

  User({
    required this.name,
    required this.email,
    this.selectedStyles = const [],
  });

  User copyWith({
    String? name,
    String? email,
    List<String>? selectedStyles,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      selectedStyles: selectedStyles ?? this.selectedStyles,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'selectedStyles': selectedStyles,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      selectedStyles: List<String>.from(json['selectedStyles'] ?? []),
    );
  }
} 