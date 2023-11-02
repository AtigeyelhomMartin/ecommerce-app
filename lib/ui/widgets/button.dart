import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final bool loading;
  const Button({Key? key, required this.child, this.onPressed, this.loading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Theme.of(context).colorScheme.primary
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          alignment: Alignment.center,
        ),
        onPressed: onPressed,
        child: loading ? (
        Platform.isIOS ? const CupertinoActivityIndicator(color: Colors.white, radius: 10, animating: true,) :
        const SizedBox(
          height: 20,
          width: 20,
          child:  CircularProgressIndicator(color: Colors.white,),
        )
        ) : DefaultTextStyle.merge(
          child: child,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
  }
}
