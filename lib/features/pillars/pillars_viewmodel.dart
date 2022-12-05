import 'dart:async';

import 'package:wellness_hub_australia/features/pillars/pillars_service.dart';

import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/app/models/pillar.model.dart';
import 'package:wellness_hub_australia/app/models/pillar_progress.model.dart';
import 'package:stacked/stacked.dart';

class T {}

class PillarsViewModel extends ReactiveViewModel {
  //1. Utils

  final _pillarService = locator<PillarService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_pillarService];

  List<PillarProgress> get pillarsProgress => _pillarService.pillarsProgress;
  List<Pillar> get pillars => _pillarService.pillars;

  Future<void> getAll() async {
    setBusy(true);

    await Future.wait([
      _pillarService.getPillarsProgressOfUser(),
    ]).catchError((error) {});

    setBusy(false);
  }

  Future<void> getPillars() async {
    setBusy(true);

    await Future.wait([
      _pillarService.getPillars(),
    ]).catchError((error) {});

    setBusy(false);
  }
}
