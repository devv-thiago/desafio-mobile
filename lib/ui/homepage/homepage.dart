import 'package:flutter/material.dart';
import 'package:movie_app/ui/homepage/widgets/catalog.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    Size deviceInfo = MediaQuery.of(context).size;
    return Column(
      spacing: deviceInfo.height * 0.05,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 1,
              child: SearchBar(
                backgroundColor: WidgetStateProperty.all(Colors.white),
                hintText: 'Pesquisar por títulos',
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                size: 30,
                color: Colors.red,
              ),
            ),
          ],
        ),
        Catalog(
          height: deviceInfo.height * 0.8,
        ),
      ],
    );
  }
}
