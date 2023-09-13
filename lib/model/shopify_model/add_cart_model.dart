class AddCartModel {
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

  AddCartModel(
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
      this.giftCard});

  AddCartModel.fromJson(Map<String, dynamic> json) {
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
      // json['discounts'].forEach((v) {
      //   discounts!.add(new Null.fromJson(v));
      // });
    }
    sku = json['sku'];
    grams = json['grams'];
    vendor = json['vendor'];
    taxable = json['taxable'];
    productId = json['product_id'];
    productHasOnlyDefaultVariant = json['product_has_only_default_variant'];
    giftCard = json['gift_card'];
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
    data['product_has_only_default_variant'] = this.productHasOnlyDefaultVariant;
    data['gift_card'] = this.giftCard;
    return data;
  }
}
