class Role {
  final String name;
  final String description;
  final type;
  int heart;
  int? code;
  int order;
  bool isBlocked = false;
  bool handCuffed = false;
  bool isReversible;
  bool isSaved = false;
  bool isShot = false;
  bool disclosured = false;

  Role({
    required this.name,
    required this.type,
    required this.description,
    required this.heart,
    required this.isBlocked,
    required this.isReversible,
    required this.isSaved,
    required this.order,
  });
}
