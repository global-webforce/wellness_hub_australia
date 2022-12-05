import 'package:wellness_hub_australia/app/app.logger.dart';
import 'package:wellness_hub_australia/app/shared/ui/setup_dialog_ui.dart';
import 'package:wellness_hub_australia/features/fields/services/fields_service.dart';
import 'package:stacked/stacked.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/app/models/field.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:stacked_services/stacked_services.dart';

class FieldsViewModel extends BaseViewModel {
  final log = getLogger('FieldsViewModel');
  final _dialogService = locator<DialogService>();
  final _fieldsService = locator<FieldsService>();

  final _fieldFormKey = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> get fieldFormKey => _fieldFormKey;

  int? filterPillarId;
  List<Field> get fields {
    List<Field> temp = _fieldsService.fields;

    if (filterPillarId != null) {
      temp = _fieldsService.fields
          .where((item) => item.pillarId == filterPillarId)
          .toList();
    }

    return temp;
  }

  @override
  void onFutureError(error, Object? key) {
    log.e(error);
    {
      _dialogService.showCustomDialog(
          variant: DialogType.error,
          barrierDismissible: true,
          description: error.toString());
    }
    super.onFutureError(error, key);
  }

  Future getAll() async {
    await runBusyFuture(_fieldsService.getAll(), throwException: true);
  }
}
