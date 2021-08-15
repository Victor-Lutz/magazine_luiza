class Product {
  final String name;
  final String subname;
  final String photo;
  final String value;
  final String installment;
  final String specification;
  bool isFavorite;
  Product({
    required this.photo,
    required this.name,
    required this.subname,
    required this.value,
    required this.installment,
    required this.specification,
    this.isFavorite = false,
  });
}
