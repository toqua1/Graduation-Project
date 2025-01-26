import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/constants.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildGridView(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text('Favourites', style: AppFonts.headline1),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: NeumorphicButton(
            style: NeumorphicStyle(
              depth: -4,
              intensity: 0.8,
              shape: NeumorphicShape.flat,
              color: Colors.white,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
            ),
            padding: const EdgeInsets.all(6),
            child: const Icon(Icons.add_rounded, color: Colors.teal, size: 25),
            onPressed: () {
              _showAddCollectionBottomSheet(context);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildGridView(BuildContext context) {
    final List<Map<String, String>> collections = [
      {"image": "lib/assets/armFav.jpg", "title": "Arm"},
      {"image": "lib/assets/legFav.jpg", "title": "Leg"},
      {"image": "lib/assets/cardioFav.jpg", "title": "Cardio"},
      {"image": "lib/assets/routineFav.jpg", "title": "Routine"},
      {"image": "lib/assets/nutritionFav.jpg", "title": "Healthy"},
    ];

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

  /// 🔹 Neumorphic Bottom Sheet for Adding a New Collection
  void _showAddCollectionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows full height
      backgroundColor:
          Colors.transparent, // Transparent to allow Neumorphic look
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Create New Collection",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal)),
              const SizedBox(height: 15),

              // Neumorphic TextField
              Neumorphic(
                style: NeumorphicStyle(
                  depth: -4,
                  intensity: 0.8,
                  color: Colors.white,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Enter Collection Name",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Neumorphic Add Button
              NeumorphicButton(
                style: NeumorphicStyle(
                  depth: 4,
                  intensity: 0.8,
                  color: Colors.white,
                  boxShape: NeumorphicBoxShape.circle(),
                ),
                padding: const EdgeInsets.all(15),
                child: const Icon(Icons.check, color: Colors.teal, size: 28),
                onPressed: () {
                  Navigator.pop(context); // Close Bottom Sheet
                },
              ),
              const SizedBox(height: 15),
            ],
          ),
        );
      },
    );
  }
}
