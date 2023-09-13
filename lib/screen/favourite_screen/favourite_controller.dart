import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollywood_hair/util/assets.dart';

class FavouriteController extends GetxController with GetTickerProviderStateMixin {
  var searchController = TextEditingController();

  RxList<ProductModel> productList = <ProductModel>[
    ProductModel(
      selected: false,
      price: "zł 119.00",
      image: Assets.p1,
      oldPrice: "119.00",
      title: 'Scalp Peeling - Cleansing peeling for the scalp 500 ml',
    ), ProductModel(
      selected: false,
      price: "zł 119.00",
      image: Assets.p1,
      oldPrice: "119.00",
      title: 'Scalp Peeling - Cleansing peeling for the scalp 500 ml',
    ), ProductModel(
      selected: false,
      price: "zł 119.00",
      image: Assets.p1,
      oldPrice: "119.00",
      title: 'Scalp Peeling - Cleansing peeling for the scalp 500 ml',
    ), ProductModel(
      selected: false,
      price: "zł 119.00",
      image: Assets.p1,
      oldPrice: "119.00",
      title: 'Scalp Peeling - Cleansing peeling for the scalp 500 ml',
    ),
    ProductModel(
      selected: false,
      price: "zł 119.00",
      image: Assets.p1,
      oldPrice: "119.00",
      title: 'Scalp Peeling - Cleansing peeling for the scalp 500 ml',
    ),
    ProductModel(
      selected: false,
      price: "zł 119.00",
      image: Assets.p1,
      oldPrice: "119.00",
      title: 'Scalp Peeling - Cleansing peeling for the scalp 500 ml',
    ),
    ProductModel(
      selected: false,
      price: "zł 119.00",
      image: Assets.p2,
      oldPrice: "119.00",
      title: 'Scalp Peeling - Cleansing peeling for the scalp 500 ml',
    ),
    ProductModel(
      selected: false,
      price: "zł 119.00",
      image: Assets.p3,
      oldPrice: "119.00",
      title: 'Scalp Peeling - Cleansing peeling for the scalp 500 ml',
    ),
    ProductModel(
      selected: false,
      price: "zł 119.00",
      image: Assets.p4,
      oldPrice: "119.00",
      title: 'Scalp Peeling - Cleansing peeling for the scalp 500 ml',
    ),
    ProductModel(
      selected: false,
      price: "zł 119.00",
      image: Assets.p5,
      oldPrice: "119.00",
      title: 'Scalp Peeling - Cleansing peeling for the scalp 500 ml',
    ),
    ProductModel(
      selected: false,
      price: "zł 119.00",
      image: Assets.p6,
      oldPrice: "119.00",
      title: 'Scalp Peeling - Cleansing peeling for the scalp 500 ml',
    ),
  ].obs;
  RxList<CategoriesModel> categoriesList = <CategoriesModel>[
    CategoriesModel(value: "All", selected: true),
    CategoriesModel(value: "Conditioner", selected: false),
    CategoriesModel(value: "Accessories", selected: false),
    CategoriesModel(value: "Accessories", selected: false),
    CategoriesModel(value: "Oils", selected: false),
    CategoriesModel(value: "Perfume", selected: false),
    CategoriesModel(value: "Supplements", selected: false),
    CategoriesModel(value: "Trichology", selected: false),
  ].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}

class CategoriesModel {
  final String value;

  bool selected = false;

  CategoriesModel({required this.value, required this.selected});
}

class ProductModel {
  String title = "";
  bool selected = false;
  String price = "";
  String oldPrice = "";
  String image = "";

  ProductModel(
      {required this.title,
      required this.selected,
      required this.price,
      required this.oldPrice,
      required this.image});
}
