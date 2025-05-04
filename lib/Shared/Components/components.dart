import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/Shared/Styles/Colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Modules/OnBoarding/onBoarding_screen.dart';

void navigatePushAndFinish(context,   widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) =>  widget),
    (route) => false,
  );
}

void navigatePush(context, widget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget), // Navigate to HomeScreen
  );
}

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String textLabel,
  required IconData prefix,
  IconData? suffixIcon,
  required String? Function(String?)? validate,
  Function()? onTap,
  bool isPassword = false,
  VoidCallback? suffixPressed,
}) => TextFormField(
  controller: controller,
  keyboardType: type,
  cursorColor: defColor,
  obscureText: isPassword,

  decoration: InputDecoration(
    labelText: textLabel,
    labelStyle: TextStyle(fontSize: 13, color: Colors.grey),
    floatingLabelStyle: TextStyle(color: defColor, fontSize: 13),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: defColor, width: 2),
      borderRadius: BorderRadius.circular(20),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: defColor, width: 2),
      borderRadius: BorderRadius.circular(20),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: defColor, width: 2),
      borderRadius: BorderRadius.circular(20),
    ),
    contentPadding: EdgeInsets.all(15),
    prefixIcon: Icon(prefix, color: defColor),
    suffixIcon: suffixIcon != null ? IconButton(onPressed : suffixPressed, icon : Icon(suffixIcon), color : defColor) : null,

  ),
  validator: validate,
  onTap: onTap,
);

Widget defaultButton({
  required double width,
  required double height,
  required String text,
  required Color textColor,
  required Color buttonColor,
  required double radius,
  required Function()? function,

}
    ) =>  Container(
  width: width,
  height: height,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: buttonColor,
  ),

  child: MaterialButton(
    onPressed: function,
    child: Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: 20,
      ),
    ),

  ),
);

Widget defaultTextButton ({
  required String text,
  required Color textColor,
  required double fontSize,
  required Function()? function,

}
    )=> TextButton(
    onPressed: function,
    child: Text(
      text.toUpperCase(),
    style: TextStyle(
      color: textColor,
      fontSize: fontSize,
      // fontWeight: FontWeight.bold,
    ),
    )
);

// OnBoarding screen.....
Widget buildOnBoardingItem(OnBoardingModel model) => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(child: Image(image: AssetImage(model.image))),
    SizedBox(height: 15),
    Text(
      model.title,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 15),
    Text(
      model.body,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    ),
  ],
);
Widget onBoardingIndicator(controller, count) => SmoothPageIndicator(
  controller: controller,
  count: count,
  effect: ExpandingDotsEffect(
    activeDotColor: defColor,
    dotHeight: 10,
    dotWidth: 10,
    expansionFactor: 3,
    spacing: 5,
  ),
);

Widget appBarActionButton(BuildContext context, Widget widget) => Padding(
  padding: const EdgeInsetsDirectional.symmetric(horizontal: 16.0),
  child: MaterialButton(
    onPressed: () {
      navigatePush(context, widget);
    },
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    height: 30,
    minWidth: 70,
    color: defColor,
    elevation: 4,
    child: Text("SKIP", style: TextStyle(color: Colors.white, fontSize: 13.8)),
  ),
);



