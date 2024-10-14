
import 'package:flutter/material.dart';

class DialogCode{

  static void showLoading({required BuildContext context , required
  String loading, bool barrierDismissible = true})
  {
    showDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        builder: (context){
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 6,),
                Text(loading)
              ],
            ),
          );
        }
    );
  }

  static void hideloading(BuildContext context){
    Navigator.pop(context);
  }

  static void showMessage({required BuildContext context, required
  String content, String title = "Title", String? posActName,
    Function? posAction , String? negActName,Function? negAction}){
    List<Widget> actions = [];
    if(posActName != null){
      actions.add(ElevatedButton(
          onPressed: (){
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(posActName)));
    }
    if(negActName != null){
      actions.add(ElevatedButton(
          onPressed: (){
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(negActName)));
    }
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            content: Text(content,style: Theme.of(context).textTheme.bodyMedium,),
            title: Text(title),
            actions: actions ,
          );
        }
    );
  }


}