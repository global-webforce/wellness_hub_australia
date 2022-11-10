import 'dart:async';
import 'package:wellness_hub_australia/app/app.logger.dart';
import 'package:wellness_hub_australia/app/shared/ui/setup_dialog_ui.dart';
import 'package:wellness_hub_australia/features/custom_links/services/custom_link_service.dart';
import 'package:wellness_hub_australia/features/pillars/pillars_service.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/features/tasks/services/task_service.dart';
import 'package:wellness_hub_australia/models/custom_link.model.dart';
import 'package:wellness_hub_australia/models/pillar_progress.model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ClientHomePageViewModel extends ReactiveViewModel {
  final log = getLogger('ClientHomePageViewModel');
  final _dialogService = locator<DialogService>();

  final _pillarService = locator<PillarService>();
  final _taskService = locator<TaskService>();
  final _customLinkService = locator<CustomLinkService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [
        _pillarService,
        _taskService,
      ];

  List<PillarProgress> get pillarsProgress => _pillarService.pillarsProgress;
  List<CustomLink> get customLinks => _customLinkService.customLinks;

  @override
  void onFutureError(error, Object? key) {
    log.e(error);
    _dialogService.showCustomDialog(
        variant: DialogType.error,
        barrierDismissible: true,
        description: error.toString());
    super.onFutureError(error, key);
  }

  Future init() async {
    runBusyFuture(Future.wait([
      _pillarService.getPillarsProgressOfUser(),
      _customLinkService.getAll()
    ], eagerError: true));
  }
}
