import 'package:ez_core/ez_core.dart';
import 'package:wellness_hub_australia/app/app.logger.dart';
import 'package:wellness_hub_australia/app/shared/ui/setup_dialog_ui.dart';
import 'package:wellness_hub_australia/features/companies/services/company_service.dart';
import 'package:stacked/stacked.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/models/company.model.dart';
import 'package:stacked_services/stacked_services.dart';

class CompaniesViewModel extends BaseViewModel {
  final log = getLogger('CompaniesViewModel');
  final _dialogService = locator<DialogService>();
  final _companyService = locator<CompanyService>();

  List<Company> get companies => _companyService.companies;

  int? companyId;
  Company? get company =>
      _companyService.companies.safeFirstWhere((e) => e.id == companyId);

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
    await runBusyFuture(_companyService.getAll());
  }
}
