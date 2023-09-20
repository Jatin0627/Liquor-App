import 'package:flutter/material.dart';

class FavoriteIcon extends StatefulWidget {

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  Color _favIconColor = Colors.black;
  IconData  _icon = Icons.favorite_outline;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        setState(() {
          if(_favIconColor == Colors.black){
            _favIconColor = Colors.red;
            _icon = Icons.favorite;
          }else{
            _favIconColor = Colors.black;
            _icon = Icons.favorite_outline;
          }
        });
      },
      icon: Icon(
       _icon,
        color: _favIconColor,
        size: 30,
      ),
    );
  }
}
