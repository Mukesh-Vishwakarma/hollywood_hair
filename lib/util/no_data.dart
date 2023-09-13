import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollywood_hair/util/app_style.dart';
import 'package:hollywood_hair/util/assets.dart';

import 'res_dimens.dart';

class NoDataScreen extends StatelessWidget {
  String? title;
  String? image;

  NoDataScreen({this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(Assets.appLogo,
                height: 100, width: 200
            ),
          ),
          Center(
            child: Text(
              title ?? 'data_not_available'.tr,
              textAlign: TextAlign.center,
                style: AppStyles.textStyle(
                  fontSize: dimen14,
                  // color: textThemeColor(),
                  weight: FontWeight.w400,
                )
            ),
          ),
        ],
      ),
    );
  }
}
