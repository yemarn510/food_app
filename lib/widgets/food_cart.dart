import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import './detailscreen.dart';

class FoodCard extends StatelessWidget {
  final String title;
  final String ingredients;
  final String image;
  final int price;
  final String calories;
  final String description;

  const FoodCard({
    Key? key,
    this.title = '',
    this.ingredients = '',
    this.image = '',
    this.price = 0,
    this.calories = '',
    this.description = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context){
              return const DetailScreen();
            }
          )
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        height: 400,
        width: 270,
        child: Stack(
          children: <Widget>[
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: 380,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(34),
                  color: kPrimaryColor.withOpacity(0.05),
                ),
              ),
            ),

            Positioned(
              left: 10,
              top: 10,
              child: Container(
                height: 181,
                width: 181,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kPrimaryColor.withOpacity(0.15),
                ),
              ),
            ),

            Positioned(
              top: 0,
              left: -50,
              child: Container(
                height: 184,
                width: 276,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(image)
                    )
                ),
              ),
            ),

            Positioned(
              right: 20,
              top: 80,
              child: Text(
                '\$$price',
                style: Theme.of(context).textTheme.headline6?.copyWith(color: kPrimaryColor),
              ),
            ),

            Positioned(
                top: 201,
                left: 40,
                child: Container(
                  width: 210,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          'With $ingredients',
                          style: TextStyle(color: kTextColor.withOpacity(0.4)),
                        ),
                        Text(
                          description,
                          maxLines: 4,
                          style: TextStyle(color: kTextColor.withOpacity(0.65)),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          calories,
                        )
                      ]
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}