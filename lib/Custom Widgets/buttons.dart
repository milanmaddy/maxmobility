import 'package:flutter/material.dart';

import '../Constraints/color_manager.dart';

class Buttons{
  static Widget actionButtons({required String title, required Function event,double height=45,double width=180}){
    return ElevatedButton(
      onPressed:()async{ await event();},
      style: ButtonStyle(
          // elevation: MaterialStateProperty.all(12.0 ),
          // shadowColor: MaterialStateProperty.all(ColorManager.shadow),
          textStyle: MaterialStateProperty.all(const TextStyle()),
          backgroundColor: MaterialStateProperty.all(ColorManager.primary),
          minimumSize: MaterialStateProperty.all(Size(width,height)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide.none
            ),
          ) ),
      child: Text(title,style: const TextStyle(color: Colors.white,fontSize: 17, fontFamily: 'Epilogue', fontWeight: FontWeight.w600),),
    );
  }

  static Widget actionButtons2({required String title, required Function event,double height=45,double width=180}){
    return ElevatedButton(
      onPressed:()async{ await event();},
      style: ButtonStyle(
        // elevation: MaterialStateProperty.all(12.0 ),
        // shadowColor: MaterialStateProperty.all(ColorManager.shadow),
          textStyle: MaterialStateProperty.all(const TextStyle()),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          minimumSize: MaterialStateProperty.all(Size(width,height)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                width: 2,
                color: ColorManager.primary,
              )
            ),
          ),
      ),
      child: Text(title,style: TextStyle(color: ColorManager.primary,fontSize: 17, fontFamily: 'Epilogue', fontWeight: FontWeight.w600),),
    );
  }
}