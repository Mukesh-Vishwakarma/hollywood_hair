import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';


enum ProgressDialogType { Normal, Download }

bool _isShowing = false;
bool _barrierDismissible = true, _showLogs = false;

double _borderRadius = 8.0;
Color _backgroundColor = Colors.transparent;
Curve _insetAnimCurve = Curves.easeInOut;

class ProgressDialog {
  late _Body _dialog;

  ProgressDialog({bool isDismissible = false, bool showLogs = false}) {
    _barrierDismissible = true;
    _showLogs = showLogs;
  }

  bool isShowing() {
    return _isShowing;
  }

  Future<bool> dismiss() {
    if (_isShowing) {
      try {
        _isShowing = false;
        // Get.back();
        Get.back();
        // Navigator.pop(context);
        if (_showLogs) debugPrint('ProgressDialog dismissed');
        return Future.value(true);
      } catch (_) {
        return Future.value(false);
      }
    } else {
      if (_showLogs) debugPrint('ProgressDialog already dismissed');
      return Future.value(false);
    }
  }

  void show() {
    if (!_isShowing) {
      _dialog = _Body();
      _isShowing = true;
      if (_showLogs) debugPrint('ProgressDialog shown');
      Get.dialog(
        Material(
          type: MaterialType.transparency,
          child: WillPopScope(
            onWillPop: () {
              return Future.value(_barrierDismissible);
            },
            child: Dialog(
                backgroundColor: _backgroundColor,
                insetAnimationCurve: _insetAnimCurve,
                insetAnimationDuration: Duration(milliseconds: 100),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(_borderRadius))),
                child: _dialog),
          ),
        ),
        barrierDismissible: false,
      );
    } else {
      if (_showLogs) debugPrint("ProgressDialog already shown/showing");
    }
  }
}

// ignore: must_be_immutable
class _Body extends StatefulWidget {
  _BodyState _dialog = _BodyState();

  @override
  State<StatefulWidget> createState() {
    return _dialog;
  }
}

class _BodyState extends State<_Body> {
  @override
  void dispose() {
    _isShowing = false;
    if (_showLogs) debugPrint('ProgressDialog dismissed by back button');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = 100.w;

    var paddingContainer = width / 3.5;
    var paddingLottie = width / 5.3;
    return Stack(
      children: [
        Center(
          child: Container(

            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),

            // margin: EdgeInsets.all(paddingContainer),
          ),
        ),


        //***** soon *********

        Align(
          alignment: Alignment.center,

          child: Image.asset('assets/images/progress.gif',height:50,width:50),)


      ],
    );

  }
}
