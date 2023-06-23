import 'package:permission_handler/permission_handler.dart';

class PermissionManager {
  Future<bool> checkRequestCameraStoragePermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.storage,
    ].request();

    return statuses[Permission.camera]!.isGranted &&
        statuses[Permission.storage]!.isGranted;
  }
}
