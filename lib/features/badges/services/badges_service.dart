import 'package:wellness_hub_australia/app/models/badge.model.dart';
import 'package:stacked/stacked.dart';

abstract class BadgesService with ReactiveServiceMixin {
  List<Badge> get badges;
  Future getAll();
}
