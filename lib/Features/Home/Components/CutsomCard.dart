import 'package:flutter/material.dart';
import 'package:linked_gates_task/Features/Home/Data/Model/product_model.dart';

class CustomCard extends StatefulWidget {
  final ProductModel product;

  const CustomCard({
    required this.product,
    super.key,
  });

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isFav = false;

  void _toggleFavorite() {
    setState(() {
      isFav = !isFav;
    });
  }

  @override
  Widget build(BuildContext context) {
    String title = widget.product.title;
    int titleLength = title.length;
    String displayTitle =
        title.substring(0, titleLength >= 8 ? 8 : titleLength);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Card(
          shadowColor: Colors.grey,
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  displayTitle,
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      r"$" "${widget.product.price}",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: _toggleFavorite, // Handle the favorite toggle
                      child: isFav
                          ? Icon(
                              Icons.favorite,
                              size: 18,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.favorite_outline,
                              size: 18,
                              color: Colors.red,
                            ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: 20,
          top: 15,
          child: Image.network(
            widget.product.image,
            height: 90,
            width: 90,
          ),
        )
      ],
    );
  }
}
