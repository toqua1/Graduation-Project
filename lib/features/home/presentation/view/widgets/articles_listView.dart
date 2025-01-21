import 'package:flutter/material.dart';
import 'package:graduation_project/features/home/presentation/view/widgets/article_card.dart';

class ArticlesListView extends StatelessWidget {
  const ArticlesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, bottom: 10.0), // Added padding
            child: SizedBox(
              width: 200,
              child: ArticleCard(),
            ),
          );
        },
      ),
    );
    ;
  }
}
