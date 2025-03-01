// app_constants/app_permissions.dart
// import 'package:permission_handler/permission_handler.dart';

// /// Request Camera Access.
// Future<void> cameraRequest() async {
//   final status = await Permission.camera.status;
//   if (status == PermissionStatus.denied) {
//     await Permission.camera.request();
//   } else if (status == PermissionStatus.permanentlyDenied) {
//     await openAppSettings();
//   }
// }

// Future<void> getPermissionStatus() async {
//   await locationRequest();
//   await cameraRequest();
//   await storageRequest();
//   await phoneRequest();
// }

// /// Request location Access.
// Future<void> locationRequest() async {
//   final status = await Permission.location.status;
//   if (status == PermissionStatus.denied) {
//     await Permission.location.request();
//   } else if (status == PermissionStatus.permanentlyDenied) {
//     await openAppSettings();
//   }
// }

// Future<void> phoneRequest() async {
//   final status = await Permission.phone.status;
//   if (status == PermissionStatus.denied) {
//     await Permission.phone.request();
//   } else if (status == PermissionStatus.permanentlyDenied) {
//     await openAppSettings();
//   }
// }

// ///Request storage Access.
// Future<void> storageRequest() async {
//   final status = await Permission.storage.status;
//   if (status == PermissionStatus.denied) {
//     await Permission.storage.request();
//   } else if (status == PermissionStatus.permanentlyDenied) {
//     await openAppSettings();
//   }
// }
