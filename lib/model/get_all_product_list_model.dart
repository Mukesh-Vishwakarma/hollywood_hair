class GetAllProductModel {
  List<GetAllProductData>? products;

  GetAllProductModel({this.products});

  GetAllProductModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <GetAllProductData>[];
      json['products'].forEach((v) {
        products!.add(new GetAllProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetAllProductData {
  int? id;
  String? title;
  String? bodyHtml;
  String? vendor;
  String? productType;
  String? createdAt;
  String? handle;
  String? updatedAt;
  String? publishedAt;
  dynamic templateSuffix;
  String? status;
  String? publishedScope;
  String? tags;
  String? adminGraphqlApiId;
  List<Options>? options;
  List<Images>? images;
  Images? image;

  GetAllProductData(
      {this.id,
        this.title,
        this.bodyHtml,
        this.vendor,
        this.productType,
        this.createdAt,
        this.handle,
        this.updatedAt,
        this.publishedAt,
        this.templateSuffix,
        this.status,
        this.publishedScope,
        this.tags,
        this.adminGraphqlApiId,
        this.options,
        this.images,
        this.image});

  GetAllProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    bodyHtml = json['body_html'];
    vendor = json['vendor'];
    productType = json['product_type'];
    createdAt = json['created_at'];
    handle = json['handle'];
    updatedAt = json['updated_at'];
    publishedAt = json['published_at'];
    templateSuffix = json['template_suffix'];
    status = json['status'];
    publishedScope = json['published_scope'];
    tags = json['tags'];
    adminGraphqlApiId = json['admin_graphql_api_id'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    image = json['image'] != null ? new Images.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body_html'] = this.bodyHtml;
    data['vendor'] = this.vendor;
    data['product_type'] = this.productType;
    data['created_at'] = this.createdAt;
    data['handle'] = this.handle;
    data['updated_at'] = this.updatedAt;
    data['published_at'] = this.publishedAt;
    data['template_suffix'] = this.templateSuffix;
    data['status'] = this.status;
    data['published_scope'] = this.publishedScope;
    data['tags'] = this.tags;
    data['admin_graphql_api_id'] = this.adminGraphqlApiId;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}

class Options {
  int? id;
  int? productId;
  String? name;
  int? position;

  Options({this.id, this.productId, this.name, this.position});

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    name = json['name'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['position'] = this.position;
    return data;
  }
}

class Images {
  int? id;
  int? productId;
  int? position;
  String? createdAt;
  String? updatedAt;
  dynamic alt;
  int? width;
  int? height;
  String? src;
  dynamic variantIds;
  String? adminGraphqlApiId;

  Images(
      {this.id,
        this.productId,
        this.position,
        this.createdAt,
        this.updatedAt,
        this.alt,
        this.width,
        this.height,
        this.src,
        this.variantIds,
        this.adminGraphqlApiId});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    position = json['position'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    alt = json['alt'];
    width = json['width'];
    height = json['height'];
    src = json['src'];
    if (json['variant_ids'] != null) {
      variantIds = <Null>[];
      // json['variant_ids'].forEach((v) {
      //   variantIds!.add(new Null.fromJson(v));
      // });
    }
    adminGraphqlApiId = json['admin_graphql_api_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['position'] = this.position;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['alt'] = this.alt;
    data['width'] = this.width;
    data['height'] = this.height;
    data['src'] = this.src;
    if (this.variantIds != null) {
      data['variant_ids'] = this.variantIds!.map((v) => v.toJson()).toList();
    }
    data['admin_graphql_api_id'] = this.adminGraphqlApiId;
    return data;
  }
}
