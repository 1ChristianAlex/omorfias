import 'package:flutter/material.dart';
import 'package:omorfias/widget/CircleButton.dart';

class ViewImage extends StatefulWidget {
  final String imageSource;
  final int enterpriseId;
  final bool isFavorite;

  const ViewImage(
      {Key key, this.imageSource, this.enterpriseId, this.isFavorite})
      : super(key: key);

  @override
  _ViewImageState createState() => _ViewImageState();
}

class _ViewImageState extends State<ViewImage> {
  bool isFavorite;

  @override
  void initState() {
    isFavorite = widget.isFavorite ?? false;
    super.initState();
  }

  void goBack() {
    Navigator.pop(context);
  }

  void setFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            child: Image(
              image: NetworkImage(
                widget.imageSource,
              ),
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.35,
            ),
          ),
          Positioned(
            child: CircleButton(
              padding: 0,
              onPressed: goBack,
              iconChild: Icon(
                Icons.close,
                size: 22,
              ),
            ),
            top: 32,
          ),
          Positioned(
            child: CircleButton(
              padding: 0,
              onPressed: setFavorite,
              iconChild: Icon(
                isFavorite ? Icons.favorite_border : Icons.favorite,
                size: 22,
              ),
            ),
            top: 32,
            right: 0,
          ),
          Positioned(
            child: CircleButton(
              padding: 0,
              onPressed: () {},
              iconChild: Icon(
                Icons.share,
                size: 22,
              ),
            ),
            top: 32,
            right: 50,
          )
        ],
      ),
    );
  }
}
