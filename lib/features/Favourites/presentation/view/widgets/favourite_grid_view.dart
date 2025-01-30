import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants.dart';

class FavouriteGridView extends StatelessWidget {
  const FavouriteGridView({
    super.key,
    required this.collections,
  });

  final List<Map<String, String>> collections;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        itemCount: collections.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          return Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  collections[index]["image"]!,
                  fit: BoxFit.cover,
                  height: 150,
                  width: 150,
                ),
              ),
              const SizedBox(height: 5),
              Text(collections[index]["title"]!,
                  style: AppFonts.bodyTextRegularBlack),
            ],
          );
        },
      ),
    );
  }
}
