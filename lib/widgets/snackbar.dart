import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:flutter/material.dart';


// void customSnackbar({
//   required String text,
//   required BuildContext context,
//   Duration? duration,
//   bool isError = false,
// }) {
//   final overlay = Overlay.of(context);
//   if (overlay == null) return;
//
//   // Create a Snackbar widget
//   final snackbar = Material(color: isError ? Colors.red : AppColors.anotherGreen,borderRadius: BorderRadius.circular(10),
//     elevation: 6.0,
//     child: Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
//       decoration: BoxDecoration(
//         color: isError ? Colors.red : AppColors.anotherGreen,
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: Text(
//         text,
//         style: TextStyle(
//           color: Colors.white,
//           fontWeight: FontWeight.w600,
//         ),
//         textAlign: TextAlign.center,
//       ),
//     ),
//   );
//
//   // Create an overlay entry
//   final overlayEntry = OverlayEntry(
//     builder: (context) => Positioned(
//       top: MediaQuery.of(context).padding.top + 16.0, // Adjust the top position
//       left: 16.0,
//       right: 16.0,
//       child: snackbar,
//     ),
//   );
//
//   // Insert the overlay entry
//   overlay.insert(overlayEntry);
//
//   // Remove the snackbar after the specified duration
//   Future.delayed(duration ?? const Duration(milliseconds: 2000), () {
//     overlayEntry.remove();
//   });
// }
void customSnackbar({
  required String text,
  String? subtitle,
  BuildContext? context,
  Duration? duration,
  bool isError = false,
  Map<String, dynamic>? payload,
  TypeAlert typeAlert = TypeAlert.success,
}) {
  AlertController.show(
    text,
    subtitle ?? '',
    isError ? TypeAlert.error : TypeAlert.success,
    payload,

  );
}
