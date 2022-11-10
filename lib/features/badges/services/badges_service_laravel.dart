import 'dart:async';
import 'dart:convert';

import 'package:wellness_hub_australia/app/api/api_service.dart';
import 'package:wellness_hub_australia/features/badges/services/badges_service.dart';
import 'package:wellness_hub_australia/app/api/api_endpoints.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/models/badge.model.dart';
import 'package:stacked/stacked.dart';

class BadgesServiceLaravel with ReactiveServiceMixin implements BadgesService {
  final _apiService = locator<ApiService>();

  BadgesServiceLaravel() {
    listenToReactiveValues([
      _badges,
    ]);
  }

  final ReactiveValue<List<Badge>> _badges = ReactiveValue<List<Badge>>([]);

  @override
  Future getAll() async {
    await _apiService.get(
      ApiEndpoints.instance.badges(),
      onSuccess: (res) {
        _badges.value = List<Badge>.from(
            jsonDecode(res.body).map((model) => Badge.fromJson(model)));
      },
      onError: (_) {},
    );
  }

  @override
  List<Badge> get badges => _badges.value;
}
