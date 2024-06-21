import 'package:flutter/material.dart';

//dp({msg, arg}) => debugPrint("\n\x1B[32m $msg =$arg \n ");

pe({msg, arg}) => debugPrint(
      "\n\x1B[32m $msg =$arg \n",
    );

dp({msg, arg}) {
  debugPrint("\u001b[1;32m ====   $msg                  $arg  ====");
}
