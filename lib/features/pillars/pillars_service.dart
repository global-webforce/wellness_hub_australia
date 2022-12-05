import 'package:wellness_hub_australia/app/models/pillar.model.dart';
import 'package:wellness_hub_australia/app/models/pillar_progress.model.dart';
import 'package:stacked/stacked.dart';

abstract class PillarService with ReactiveServiceMixin {
  List<PillarProgress> get pillarsProgress;
  List<Pillar> get pillars;
  PillarProgress? findOne(int? id);
  Future<void> getPillarsProgressOfUser();
  Future<void> getPillars();
}
