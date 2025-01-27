import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/features/Favourites/presentation/view/widgets/favourite_grid_view.dart';
import 'package:graduation_project/features/Favourites/presentation/view/widgets/neumorphic_add_button.dart';
import 'package:graduation_project/features/Favourites/presentation/view/widgets/neumorphic_text_field.dart';

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
              color: NeumorphicTheme.baseColor(context),
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

    return FavouriteGridView(collections: collections);
  }

  //Neumorphic Bottom Sheet for Adding a New Collection
  void _showAddCollectionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the full height adjustment
      backgroundColor: NeumorphicTheme.baseColor(context),
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(60)),
      builder: (context) {
        return GestureDetector(
          onTap: () => FocusScope.of(context)
              .unfocus(), // Dismiss keyboard when tapping outside
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context)
                  .viewInsets
                  .bottom, // Adjust for keyboard
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: NeumorphicTheme.baseColor(context),
                borderRadius: BorderRadius.vertical(top: Radius.circular(60)),
              ),
              child: SingleChildScrollView(
                // Makes the bottom sheet scrollable
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Create New Collection",
                        style: AppFonts.primarySemibold),
                    const SizedBox(height: 60),

                    // Neumorphic TextField
                    NeumorphicTextField(),
                    const SizedBox(height: 15),

                    // Neumorphic Add Button
                    NeumorphicAddButton(),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
