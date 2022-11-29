import 'package:wellness_hub_australia/app/app.logger.dart';
import 'package:wellness_hub_australia/app/shared/ui/setup_dialog_ui.dart';
import 'package:wellness_hub_australia/features/badges/services/badges_service.dart';
import 'package:stacked/stacked.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/models/badge.model.dart';
import 'package:stacked_services/stacked_services.dart';

class BadgesViewModel extends ReactiveViewModel {
  final log = getLogger('BadgesViewModel');
  final _dialogService = locator<DialogService>();
  final _badgesService = locator<BadgesService>();

  List<Badge> get badges => _badgesService.badges;

  @override
  void onFutureError(error, Object? key) {
    log.e(error);

    _dialogService.showCustomDialog(
        variant: DialogType.error,
        barrierDismissible: true,
        description: error.toString());
    super.onFutureError(error, key);
  }

  Future getAll() async {
    await runBusyFuture(_badgesService.getAll(), throwException: true);
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_badgesService];
}
