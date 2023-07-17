class Person {
  final int productId;
  final String productName;
  final String productSlug;
  final String productWeight;
  final String productLength;
  final String productWidth;
  final String productHeight;
  final int productStock;
  final String productUrl;
  final String productDescription;
  final String productMetaTitle;
  final String productMetaDescription;
  final int productConditionId;
  final String productConditionName;
  final int isInsurance;
  final int isPreorder;
  final int uomId;
  final String uomName;
  final String uomAbbreviation;
  final int storeId;
  final String storeName;
  final String storeLocationName;
  final String storeSlug;
  final String storeProductSlug;
  final int categoryId;
  final String categoryCode;
  final String categoryName;
  final String categorySlug;
  final String categoryUrl;
  final List<dynamic> categories;
  final List<dynamic> variants;
  final List<dynamic> productImages;
  final List<dynamic> productVariants;
  final List<dynamic> productSkus;
  final int productSold;
  final int preorderDay;
  final int reviewRating;
  final String reviewMessage;
  final String totalRating;
  final String uploadDate;
  final List<dynamic> tags;
  final String productImageUrl;
  final List<dynamic> video;
  final bool isWishlisted;

  Person(
      {required this.productId,
      required this.productName,
      required this.productSlug,
      required this.productWeight,
      required this.productLength,
      required this.productWidth,
      required this.productHeight,
      required this.productStock,
      required this.productUrl,
      required this.productDescription,
      required this.productMetaTitle,
      required this.productMetaDescription,
      required this.productConditionId,
      required this.productConditionName,
      required this.isInsurance,
      required this.isPreorder,
      required this.uomId,
      required this.uomName,
      required this.uomAbbreviation,
      required this.storeId,
      required this.storeName,
      required this.storeLocationName,
      required this.storeSlug,
      required this.storeProductSlug,
      required this.categoryId,
      required this.categoryCode,
      required this.categoryName,
      required this.categorySlug,
      required this.categoryUrl,
      required this.categories,
      required this.variants,
      required this.productImages,
      required this.productVariants,
      required this.productSkus,
      required this.productSold,
      required this.preorderDay,
      required this.reviewRating,
      required this.reviewMessage,
      required this.totalRating,
      required this.uploadDate,
      required this.tags,
      required this.productImageUrl,
      required this.video,
      required this.isWishlisted});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      productId: json['product_id'],
      productName: json['product_name'],
      productSlug: json['product_slug'],
      productWeight: json['product_weight'],
      productLength: json['product_length'],
      productWidth: json['product_width'],
      productHeight: json['product_height'],
      productStock: json['product_stock'],
      productUrl: json['product_url'],
      productDescription: json['product_description'],
      productMetaTitle: json['product_meta_title'],
      productMetaDescription: json['product_meta_description'],
      productConditionId: json['product_condition_id'],
      productConditionName: json['product_condition_name'],
      isInsurance: json['is_insurance'],
      isPreorder: json['is_preorder'],
      uomId: json['uom_id'],
      uomName: json['uom_name'],
      uomAbbreviation: json['uom_abbreviation'],
      storeId: json['store_id'],
      storeName: json['store_name'],
      storeLocationName: json['store_location_name'],
      storeSlug: json['store_slug'],
      storeProductSlug: json['store_product_slug'],
      categoryId: json['category_id'],
      categoryCode: json['category_code'],
      categoryName: json['category_name'],
      categorySlug: json['category_slug'],
      categoryUrl: json['category_url'],
      categories: json['categories'],
      variants: json['variants'],
      productImages: json['product_images'],
      productVariants: json['product_variants'],
      productSkus: json['product_skus'],
      productSold: json['product_sold'],
      preorderDay: json['preorder_day'],
      reviewRating: json['review_rating'],
      reviewMessage: json['review_message'],
      totalRating: json['total_rating'],
      uploadDate: json['upload_date'],
      tags: json['tags'],
      productImageUrl: json['product_image_url'],
      video: json['video'],
      isWishlisted: json['is_wishlisted'],
    );
  }

  Map<String, dynamic> toJson() => {
        'product_id': productId,
        'product_name': productName,
        'product_slug': productSlug,
        'product_weight': productWeight,
        'product_length': productLength,
        'product_width': productWidth,
        'product_height': productHeight,
        'product_stock': productStock,
        'product_url': productUrl,
        'product_description': productDescription,
        'product_meta_title': productMetaTitle,
        'product_meta_description': productMetaDescription,
        'product_condition_id': productConditionId,
        'product_condition_name': productConditionName,
        'is_insurance': isInsurance,
        'is_preorder': isPreorder,
        'uom_id': uomId,
        'uom_name': uomName,
        'uom_abbreviation': uomAbbreviation,
        'store_id': storeId,
        'store_name': storeName,
        'store_location_name': storeLocationName,
        'store_slug': storeSlug,
        'store_product_slug': storeProductSlug,
        'category_id': categoryId,
        'category_code': categoryCode,
        'category_name': categoryName,
        'category_slug': categorySlug,
        'category_url': categoryUrl,
        'categories': categories,
        'variants': variants,
        'product_images': productImages,
        'product_variants': productVariants,
        'product_skus': productSkus,
        'product_sold': productSold,
        'preorder_day': preorderDay,
        'review_rating': reviewRating,
        'review_message': reviewMessage,
        'total_rating': totalRating,
        'upload_date': uploadDate,
        'tags': tags,
        'product_image_url': productImageUrl,
        'video': video,
        'is_wishlisted': isWishlisted,
      };
}
