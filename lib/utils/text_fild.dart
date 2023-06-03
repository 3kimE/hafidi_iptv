import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/colors.dart';
import '../utils/text_style.dart';

Widget textFild({
  String hintTxt,
  String image,



  TextEditingController controller,
  bool isObs = false,
  TextInputType keyBordType,
}) {
  return Container(
    height: 70.0,
    padding: EdgeInsets.symmetric(horizontal: 30.0),
    margin: EdgeInsets.symmetric(
      horizontal: 20.0,
      vertical: 10.0,
    ),
    decoration: BoxDecoration(
      color: blackTextFild,
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 270.0,
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            obscureText: isObs,
            keyboardType: keyBordType,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintTxt,
              hintStyle: hintStyle,
            ),
            style: headline2,
          ),
        ),
        SvgPicture.asset(
          'assets/icon/$image',
          height: 20.0,
          color: grayText,
        )
      ],
    ),
  );
}
