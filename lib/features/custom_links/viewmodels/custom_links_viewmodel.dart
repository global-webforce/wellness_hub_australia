import 'package:wellness_hub_australia/app/app.logger.dart';
import 'package:wellness_hub_australia/app/shared/ui/setup_dialog_ui.dart';
import 'package:wellness_hub_australia/features/custom_links/services/custom_link_service.dart';
import 'package:stacked/stacked.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/models/custom_link.model.dart';
import 'package:stacked_services/stacked_services.dart';

class CustomLinksViewModel extends BaseViewModel {
  final log = getLogger('CustomLinksViewModel');
  final _dialogService = locator<DialogService>();
  final _customLinkService = locator<CustomLinkService>();
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

  Future getAll() async {
    await runBusyFuture(_customLinkService.getAll(), throwException: true);
  }
}
