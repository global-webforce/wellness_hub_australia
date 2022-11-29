import 'dart:async';
import 'dart:convert';
import 'package:wellness_hub_australia/app/api/api_endpoints.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/models/pillar_progress.model.dart';
import 'package:wellness_hub_australia/models/pillar.model.dart';
import 'package:wellness_hub_australia/app/api/api_service.dart';
import 'package:stacked/stacked.dart';
import 'pillars_service.dart';

class PillarServiceLaravel with ReactiveServiceMixin implements PillarService {
  final _apiService = locator<ApiService>();

  PillarServiceLaravel() {
    listenToReactiveValues([
      _pillars,
      _pillarsProgress,
    ]);
  }

  final ReactiveValue<List<PillarProgress>> _pillarsProgress =
      ReactiveValue<List<PillarProgress>>([]);

  final ReactiveValue<List<Pillar>> _pillars = ReactiveValue<List<Pillar>>([]);

  @override
  PillarProgress? findOne(int? id) {
    return _pillarsProgress.value.firstWhere((element) => element.id == id);
  }

  @override
  Future getPillarsProgressOfUser() async {
    await _apiService.get(
      ApiEndpoints.instance.pillarsProgressEndpoint(),
      onSuccess: (res) {
        List<dynamic> list = jsonDecode(res.body);
        _pillarsProgress.value =
            list.map((e) => PillarProgress.fromJson(e)).toList();
      },
      onError: (_) {},
    );
  }

  @override
  Future getPillars() async {
    await _apiService.get(
      ApiEndpoints.pillars,
      onSuccess: (res) {
        List<dynamic> list = jsonDecode(res.body);
        _pillars.value = list.map((e) => Pillar.fromJson(e)).toList();
      },
      onError: (_) {},
    );
  }

  @override
  List<PillarProgress> get pillarsProgress => _pillarsProgress.value;

  @override
  List<Pillar> get pillars => _pillars.value;
}
