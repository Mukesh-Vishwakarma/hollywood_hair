class GetCartModel {
  dynamic token;
  dynamic note;
  dynamic attributes;
  dynamic originalTotalPrice;
  dynamic totalPrice;
  dynamic totalDiscount;
  dynamic totalWeight;
  dynamic itemCount;
  List<CartData>? items;
  dynamic requiresShipping;
  dynamic currency;
  dynamic itemsSubtotalPrice;
  dynamic cartLevelDiscountApplications;

  GetCartModel(
      {this.token,
        this.note,
        this.attributes,
        this.originalTotalPrice,
        this.totalPrice,
        this.totalDiscount,
        this.totalWeight,
        this.itemCount,
        this.items,
        this.requiresShipping,
        this.currency,
        this.itemsSubtotalPrice,
        this.cartLevelDiscountApplications});

  GetCartModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    note = json['note'];
    attributes = json['attributes'];
    originalTotalPrice = json['original_total_price'];
    totalPrice = json['total_price'];
    totalDiscount = json['total_discount'];
    totalWeight = json['total_weight'];
    itemCount = json['item_count'];
    if (json['items'] != null) {
      items = <CartData>[];
      json['items'].forEach((v) {
        items!.add(new CartData.fromJson(v));
      });
    }
    requiresShipping = json['requires_shipping'];
    currency = json['currency'];
    itemsSubtotalPrice = json['items_subtotal_price'];
    if (json['cart_level_discount_applications'] != null) {
      cartLevelDiscountApplications = <Null>[];
      json['cart_level_discount_applications'].forEach((v) {
        // cartLevelDiscountApplications!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['note'] = this.note;
    data['attributes'] = this.attributes;
    data['original_total_price'] = this.originalTotalPrice;
    data['total_price'] = this.totalPrice;
    data['total_discount'] = this.totalDiscount;
    data['total_weight'] = this.totalWeight;
    data['item_count'] = this.itemCount;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['requires_shipping'] = this.requiresShipping;
    data['currency'] = this.currency;
    data['items_subtotal_price'] = this.itemsSubtotalPrice;
    if (this.cartLevelDiscountApplications != null) {
      data['cart_level_discount_applications'] =
          this.cartLevelDiscountApplications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartData {
  dynamic id;
  dynamic properties;
  dynamic quantity;
  dynamic variantId;
  dynamic key;
  dynamic title;
  dynamic price;
  dynamic originalPrice;
  dynamic discountedPrice;
  dynamic linePrice;
  dynamic originalLinePrice;
  dynamic totalDiscount;
  dynamic discounts;
  dynamic sku;
  dynamic grams;
  dynamic vendor;
  dynamic taxable;
  dynamic productId;
  dynamic productHasOnlyDefaultVariant;
  dynamic giftCard;
  dynamic finalPrice;
  dynamic finalLinePrice;
  dynamic url;
  FeaturedImage? featuredImage;
  dynamic image;
  dynamic handle;
  dynamic requiresShipping;
  dynamic productType;
  dynamic productTitle;
  dynamic productDescription;
  dynamic variantTitle;
  dynamic variantOptions;
  List<OptionsWithValues>? optionsWithValues;
  dynamic lineLevelDiscountAllocations;
  dynamic lineLevelTotalDiscount;
  dynamic hasComponents;

  CartData(
      {this.id,
        this.properties,
        this.quantity,
        this.variantId,
        this.key,
        this.title,
        this.price,
        this.originalPrice,
        this.discountedPrice,
        this.linePrice,
        this.originalLinePrice,
        this.totalDiscount,
        this.discounts,
        this.sku,
        this.grams,
        this.vendor,
        this.taxable,
        this.productId,
        this.productHasOnlyDefaultVariant,
        this.giftCard,
        this.finalPrice,
        this.finalLinePrice,
        this.url,
        this.featuredImage,
        this.image,
        this.handle,
        this.requiresShipping,
        this.productType,
        this.productTitle,
        this.productDescription,
        this.variantTitle,
        this.variantOptions,
        this.optionsWithValues,
        this.lineLevelDiscountAllocations,
        this.lineLevelTotalDiscount,
        this.hasComponents});

  CartData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    properties = json['properties'];
    quantity = json['quantity'];
    variantId = json['variant_id'];
    key = json['key'];
    title = json['title'];
    price = json['price'];
    originalPrice = json['original_price'];
    discountedPrice = json['discounted_price'];
    linePrice = json['line_price'];
    originalLinePrice = json['original_line_price'];
    totalDiscount = json['total_discount'];
    if (json['discounts'] != null) {
      discounts = <Null>[];
      json['discounts'].forEach((v) {
        // discounts!.add(new Null.fromJson(v));
      });
    }
    sku = json['sku'];
    grams = json['grams'];
    vendor = json['vendor'];
    taxable = json['taxable'];
    productId = json['product_id'];
    productHasOnlyDefaultVariant = json['product_has_only_default_variant'];
    giftCard = json['gift_card'];
    finalPrice = json['final_price'];
    finalLinePrice = json['final_line_price'];
    url = json['url'];
    featuredImage = json['featured_image'] != null
        ? new FeaturedImage.fromJson(json['featured_image'])
        : null;
    image = json['image'];
    handle = json['handle'];
    requiresShipping = json['requires_shipping'];
    productType = json['product_type'];
    productTitle = json['product_title'];
    productDescription = json['product_description'];
    variantTitle = json['variant_title'];
    variantOptions = json['variant_options'].cast<String>();
    if (json['options_with_values'] != null) {
      optionsWithValues = <OptionsWithValues>[];
      json['options_with_values'].forEach((v) {
        optionsWithValues!.add(new OptionsWithValues.fromJson(v));
      });
    }
    if (json['line_level_discount_allocations'] != null) {
      lineLevelDiscountAllocations = <Null>[];
      json['line_level_discount_allocations'].forEach((v) {
        // lineLevelDiscountAllocations!.add(new Null.fromJson(v));
      });
    }
    lineLevelTotalDiscount = json['line_level_total_discount'];
    hasComponents = json['has_components'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['properties'] = this.properties;
    data['quantity'] = this.quantity;
    data['variant_id'] = this.variantId;
    data['key'] = this.key;
    data['title'] = this.title;
    data['price'] = this.price;
    data['original_price'] = this.originalPrice;
    data['discounted_price'] = this.discountedPrice;
    data['line_price'] = this.linePrice;
    data['original_line_price'] = this.originalLinePrice;
    data['total_discount'] = this.totalDiscount;
    if (this.discounts != null) {
      data['discounts'] = this.discounts!.map((v) => v.toJson()).toList();
    }
    data['sku'] = this.sku;
    data['grams'] = this.grams;
    data['vendor'] = this.vendor;
    data['taxable'] = this.taxable;
    data['product_id'] = this.productId;
    data['product_has_only_default_variant'] =
        this.productHasOnlyDefaultVariant;
    data['gift_card'] = this.giftCard;
    data['final_price'] = this.finalPrice;
    data['final_line_price'] = this.finalLinePrice;
    data['url'] = this.url;
    if (this.featuredImage != null) {
      data['featured_image'] = this.featuredImage!.toJson();
    }
    data['image'] = this.image;
    data['handle'] = this.handle;
    data['requires_shipping'] = this.requiresShipping;
    data['product_type'] = this.productType;
    data['product_title'] = this.productTitle;
    data['product_description'] = this.productDescription;
    data['variant_title'] = this.variantTitle;
    data['variant_options'] = this.variantOptions;
    if (this.optionsWithValues != null) {
      data['options_with_values'] =
          this.optionsWithValues!.map((v) => v.toJson()).toList();
    }
    if (this.lineLevelDiscountAllocations != null) {
      data['line_level_discount_allocations'] =
          this.lineLevelDiscountAllocations!.map((v) => v.toJson()).toList();
    }
    data['line_level_total_discount'] = this.lineLevelTotalDiscount;
    data['has_components'] = this.hasComponents;
    return data;
  }
}

class FeaturedImage {
 dynamic aspectRatio;
 dynamic alt;
 dynamic height;
 dynamic url;
 dynamic width;

  FeaturedImage(
      {this.aspectRatio, this.alt, this.height, this.url, this.width});

  FeaturedImage.fromJson(Map<String, dynamic> json) {
    aspectRatio = json['aspect_ratio'];
    alt = json['alt'];
    height = json['height'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aspect_ratio'] = this.aspectRatio;
    data['alt'] = this.alt;
    data['height'] = this.height;
    data['url'] = this.url;
    data['width'] = this.width;
    return data;
  }
}

class OptionsWithValues {
  dynamic name;
  dynamic value;

  OptionsWithValues({this.name, this.value});

  OptionsWithValues.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}
