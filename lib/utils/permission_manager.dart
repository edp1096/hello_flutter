import 'package:permission_handler/permission_handler.dart';

class PermissionManager {
  Future<bool> checkRequestNotificationPermission() async {
    var status = await Permission.notification.status;
    if (status.isDenied) {
      status = await Permission.notification.request();
    }

    return status.isGranted;
  }
}
