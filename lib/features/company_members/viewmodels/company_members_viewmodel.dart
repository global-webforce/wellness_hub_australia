import 'package:wellness_hub_australia/app/app.logger.dart';
import 'package:wellness_hub_australia/app/shared/ui/setup_dialog_ui.dart';
import 'package:wellness_hub_australia/features/company_members/services/company_members_service.dart';
import 'package:wellness_hub_australia/models/client.model.dart';
import 'package:stacked/stacked.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class CompanyMembersViewModel extends BaseViewModel {
  final log = getLogger('CompanyMembersViewModel');
  final _dialogService = locator<DialogService>();
  final _companyMembersService = locator<CompanyMembersService>();

  List<Client> get companyMembers => _companyMembersService.companyMembers;

  @override
  void onFutureError(error, Object? key) {
    log.e(error);
    _dialogService.showCustomDialog(
        variant: DialogType.error,
        barrierDismissible: true,
        description: error.toString());
    super.onFutureError(error, key);
  }

  Future getAll(int? id) async {
    runBusyFuture(_companyMembersService.getAll(id));
  }
}
