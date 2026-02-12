class UserQuery {
  // Fields to represent the query parameters
  final String? searchText;
  final String? filterCategory;
  final int? minPrice;
  final bool? includeDeleted;

  // Constructor
  UserQuery({
    this.searchText,
    this.filterCategory,
    this.minPrice,
    this.includeDeleted,
  });

  // Method to convert the model to a Map for API/database query parameters
  Map<String, dynamic> toQueryParams() {
    final Map<String, dynamic> params = {};

    if (searchText != null && searchText!.isNotEmpty) {
      params['search'] = searchText;
    }
    if (filterCategory != null && filterCategory!.isNotEmpty) {
      params['category'] = filterCategory;
    }
    if (minPrice != null) {
      // You might need to convert int to String for certain API query formats
      params['min_price'] = minPrice.toString();
    }
    if (includeDeleted == true) {
      // API might expect '1' or 'true' for boolean flags
      params['include_deleted'] = '1';
    }

    return params;
  }
}