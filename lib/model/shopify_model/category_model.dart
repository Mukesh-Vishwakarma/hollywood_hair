class CategoryModel {
  List<CustomCollections>? customCollections;

  CategoryModel({this.customCollections});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['custom_collections'] != null) {
      customCollections = <CustomCollections>[];
      json['custom_collections'].forEach((v) {
        customCollections!.add(new CustomCollections.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customCollections != null) {
      data['custom_collections'] =
          this.customCollections!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomCollections {
  int? id;
  String? handle;
  String? title;
  String? updatedAt;
  String? bodyHtml;
  String? publishedAt;
  String? sortOrder;
  String? templateSuffix;
  String? publishedScope;
  String? adminGraphqlApiId;

  CustomCollections(
      {this.id,
        this.handle,
        this.title,
        this.updatedAt,
        this.bodyHtml,
        this.publishedAt,
        this.sortOrder,
        this.templateSuffix,
        this.publishedScope,
        this.adminGraphqlApiId});

  CustomCollections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    handle = json['handle'];
    title = json['title'];
    updatedAt = json['updated_at'];
    bodyHtml = json['body_html'];
    publishedAt = json['published_at'];
    sortOrder = json['sort_order'];
    templateSuffix = json['template_suffix'];
    publishedScope = json['published_scope'];
    adminGraphqlApiId = json['admin_graphql_api_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['handle'] = this.handle;
    data['title'] = this.title;
    data['updated_at'] = this.updatedAt;
    data['body_html'] = this.bodyHtml;
    data['published_at'] = this.publishedAt;
    data['sort_order'] = this.sortOrder;
    data['template_suffix'] = this.templateSuffix;
    data['published_scope'] = this.publishedScope;
    data['admin_graphql_api_id'] = this.adminGraphqlApiId;
    return data;
  }
}
