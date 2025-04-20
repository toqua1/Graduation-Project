// import 'dart:developer';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// import '../../View/Auth/widgets/dialog_content.dart';
//
// class CustomDialog {
//   static void show({
//     required BuildContext context,
//     required String title,
//     required String content,
//     required VoidCallback onConfirm,
//     required String goal,
//     String confirmText = 'OK',
//     bool dismissible = true,
//     Future<dynamic>? method
//   }) async{
//     Future.delayed(const Duration(seconds: 3), () {
//       if (Navigator.of(context).canPop()) {
//         Navigator.of(context).pop();
//       }
//     });
//     await showGeneralDialog (
//       context: context,
//       barrierDismissible: false,
//       barrierLabel: '',
//       barrierColor: Colors.black.withOpacity(0.5),
//       transitionDuration: const Duration(milliseconds: 500),
//       pageBuilder: (context, animation1, animation2) {
//         return Dialog(
//           backgroundColor: NeumorphicTheme.baseColor(context),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(70),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16),
//             child: DialogContent(
//               goal: goal, content: content, title: title, onConfirm: onConfirm,
//             ),
//           ),
//         );
//         // // Auto-close the dialog after 3 seconds
//         // Future.delayed(const Duration(seconds: 3), () {
//         //   if (Navigator.canPop(context)) {
//         //     Navigator.of(context).pop();
//         //   }
//         // });
//       },
//       transitionBuilder: (context, animation1, animation2, child) {
//         final curvedAnimation = CurvedAnimation(
//           parent: animation1,
//           curve: Curves.easeInOut,
//         );
//         return ScaleTransition(
//           scale: curvedAnimation,
//           child: child,
//         );
//       },
//     );
//         // Delay for 2 seconds, then navigate to login screen
//     // (goal == 'newPass' || goal=='success')?
//     //     Future.delayed(const Duration(seconds: 3), () async{
//     //       if (context.mounted && Navigator.canPop(context)) {
//     //         Navigator.of(context).pop();
//     //       }
//     //      await method;
//     //       }):null;
//     // if (goal == 'newPass' || goal == 'success') {
//     //   Future.delayed(const Duration(seconds: 1), () async {
//     //     log('$context.mounted');
//     //     // if (context.mounted && Navigator.canPop(context)) {
//     //     //   log('not context');
//     //     //   Navigator.pop(context);
//     //     // }
//     //     // Ensure method is not null before calling it
//     //     if (method != null) {
//     //       await method;
//     //     }
//     //   });
//     // }
//
//   }
// }
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../../View/Auth/widgets/dialog_content.dart';

class CustomDialog {

  static Future<void> show({
    required BuildContext context,
    required String title,
    required String content,
    required VoidCallback onConfirm,
    required String goal,
    String confirmText = 'OK',
    bool dismissible = true,
    Future<dynamic>? method,
  }) async {
    await showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: '',
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation1, animation2) {
        return Dialog(
          backgroundColor: NeumorphicTheme.baseColor(context),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(70),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: DialogContent(
              goal: goal,
              content: content,
              title: title,
                onConfirm: () async {
                  // NavigationService().goBack();
                  // await Future.delayed(const Duration(seconds: 3));
                  onConfirm(); // Call the onConfirm function after the delay
                }

            ),
          ),
        );
      },
      transitionBuilder: (context, animation1, animation2, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation1,
          curve: Curves.easeInOut,
        );
        return ScaleTransition(
          scale: curvedAnimation,
          child: child,
        );
      },
    );
  }

}
