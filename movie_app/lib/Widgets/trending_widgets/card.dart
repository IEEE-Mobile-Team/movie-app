import 'package:flutter/cupertino.dart';

import '../../Constants/app_consts.dart';
var baseURL = 'https://image.tmdb.org/t/p/w500';

class CardView{
  static Column getCard(var imgPath,var title){
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            height: 300,
            width: 200,
            child: Image.network(baseURL + imgPath , fit: BoxFit.cover,),
          ),
        ),
        const SizedBox(height: 10,),
        SizedBox(
          width: 200,
            child: Text(title, style: TextStyle(fontSize: 18, color: txt_color),maxLines: 3,overflow: TextOverflow.ellipsis,)
        )
      ],
    );
  }
}