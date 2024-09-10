import 'package:flutter/material.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          
          onTap: (){
             Navigator.pop(context);
          },
          child: Icon(
              Icons.close,
              size: 24,
            
          ),
        ),
      ),
    );
  }
}