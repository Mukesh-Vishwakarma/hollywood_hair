class GetAllProductApi {
  int? result;
  String? msg;
  Data? data;

  GetAllProductApi({this.result, this.msg, this.data});

  GetAllProductApi.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? currentPage;
  List<GetAllProductModel>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Data(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <GetAllProductModel>[];
      // json['data'].forEach((v) {
      //   data!.add(new Data.fromJson(v));
      // });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class GetAllProductModel {
  int? id;
  String? title;
  String? bodyHtml;
  String? vendor;
  String? productType;
  String? handle;
  String? publishedScope;
  String? publishedAt;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<Variants>? variants;
  dynamic options;
  List<Images>? images;

  GetAllProductModel(
      {this.id,
        this.title,
        this.bodyHtml,
        this.vendor,
        this.productType,
        this.handle,
        this.publishedScope,
        this.publishedAt,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.variants,
        this.options,
        this.images});

  GetAllProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    bodyHtml = json['body_html'];
    vendor = json['vendor'];
    productType = json['product_type'];
    handle = json['handle'];
    publishedScope = json['published_scope'];
    publishedAt = json['published_at'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(new Variants.fromJson(v));
      });
    }
    if (json['options'] != null) {
      options = <Null>[];
      // json['options'].forEach((v) {
      //   options!.add(new Null.fromJson(v));
      // });
    }
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body_html'] = this.bodyHtml;
    data['vendor'] = this.vendor;
    data['product_type'] = this.productType;
    data['handle'] = this.handle;
    data['published_scope'] = this.publishedScope;
    data['published_at'] = this.publishedAt;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.variants != null) {
      data['variants'] = this.variants!.map((v) => v.toJson()).toList();
    }
    if (this.options != null) {
      // data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Variants {
  int? id;
  int? productId;
  String? title;
  String? price;
  dynamic compareAtPrice;
  String? sku;
  String? option1;
  dynamic option2;
  dynamic option3;

  Variants(
      {this.id,
        this.productId,
        this.title,
        this.price,
        this.compareAtPrice,
        this.sku,
        this.option1,
        this.option2,
        this.option3});

  Variants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    title = json['title'];
    price = json['price'];
    compareAtPrice = json['compare_at_price'];
    sku = json['sku'];
    option1 = json['option1'];
    option2 = json['option2'];
    option3 = json['option3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['title'] = this.title;
    data['price'] = this.price;
    data['compare_at_price'] = this.compareAtPrice;
    data['sku'] = this.sku;
    data['option1'] = this.option1;
    data['option2'] = this.option2;
    data['option3'] = this.option3;
    return data;
  }
}

class Images {
  int? id;
  int? productId;
  dynamic alt;
  int? width;
  int? height;
  String? src;

  Images(
      {this.id, this.productId, this.alt, this.width, this.height, this.src});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    alt = json['alt'];
    width = json['width'];
    height = json['height'];
    src = json['src'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['alt'] = this.alt;
    data['width'] = this.width;
    data['height'] = this.height;
    data['src'] = this.src;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
