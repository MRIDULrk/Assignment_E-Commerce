import 'package:crafty_bay/presentation/ui/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class itemCountButton extends StatefulWidget {
  const itemCountButton({super.key});

  @override
  State<itemCountButton> createState() => _itemCountButtonState();
}

class _itemCountButtonState extends State<itemCountButton> {

  int item =1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [

          Container(
            height: 30,

            decoration: const BoxDecoration(
                color: AppColors.themeColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                )
            ),
            child: IconButton(

                onPressed: (){

                  if(item>1){
                    item--;
                    setState(() {
                    });
                  }

                }, icon: const Icon(CupertinoIcons.minus),iconSize: 16,color: Colors.black),



          ),
          Container(
            height: 30,
            width: 25,

            color: AppColors.themeColor,
            child: Center(
              child: Text('$item',
                style: const TextStyle(
                    fontWeight: FontWeight.w600,fontSize: 18),
              ),
            ),

          ),
          Container(
            height: 30,
            decoration: const BoxDecoration(
                color: AppColors.themeColor,
            borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
            )
      ),
                child: IconButton(

                    onPressed: (){

                      if(item<20){
                        item++;
                        setState(() {
                        });
                      }

                    }, icon: const Icon(CupertinoIcons.add),iconSize: 16,color: Colors.black,),



          ),

        ],

      ),
    );



  }
}
