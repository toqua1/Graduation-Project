import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:graduation_project/core/Services/is_tablet.dart';
import 'package:graduation_project/core/constants.dart';

class SetUpAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  const SetUpAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: NeumorphicTheme.baseColor(context),
      title: InkWell(
        onTap: () => Navigator.pop(context),
        child: Row(
          children: [
            Icon(
              Icons.arrow_left_rounded,
              size: isTablet(context) ? 100 : 50,
              color: AppColors.secondaryColor,
            ),
            Text(
              'Back',
              style: AppFonts.setupAppBar
                  .copyWith(fontSize: isTablet(context) ? 30 : null),
            )
          ],
        ),
      ),
    );
  }
}
