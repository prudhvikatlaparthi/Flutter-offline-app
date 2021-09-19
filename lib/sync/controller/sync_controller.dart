import 'package:get/get.dart';
import 'package:offline_app/db/db_operations.dart';
import 'package:offline_app/repository/api_repository.dart';
import 'package:offline_app/sync/controller/sync_upload.dart';
import 'package:offline_app/utils/view_utils.dart';

import 'sync_download.dart';

class SyncController extends GetxController {
  final _apiRepository = Get.find<ApiRepository>();
  final _db = DBOperations();

  startSync({bool isSilent = true, Function? finishCallback}) async {
    if (!isSilent) {
      showProgress(message: "Uploading the data");
    }
    await startUploadSync();
    if (!isSilent) {
      showProgress(message: "Downloading the data");
    }
    await startDownloadSync();
    hideProgress();
    finishCallback?.call();
  }

  startUploadSync() async {
    await uploadSync(_db, _apiRepository);
  }

  startDownloadSync() async {
    await downloadSync(_db, _apiRepository);
  }
}
