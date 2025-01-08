class DetailedCategoryModel {
  final String title;
  final List<String> radioOptions;
  final List<Map<String, dynamic>> details;

  DetailedCategoryModel({
    required this.title,
    required this.radioOptions,
    required this.details,
  });
}
