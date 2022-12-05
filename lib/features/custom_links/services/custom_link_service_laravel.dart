import 'dart:convert';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/features/custom_links/services/custom_link_service.dart';
import 'package:wellness_hub_australia/app/api/api_endpoints.dart';
import 'package:wellness_hub_australia/app/models/custom_link.model.dart';
import 'package:wellness_hub_australia/app/api/api_service.dart';

class CustomLinkServiceLaravel implements CustomLinkService {
  final _apiService = locator<ApiService>();

  List<CustomLink> _customLinks = [];

  @override
  Stream<int> get dataStream => throw UnimplementedError();

  @override
  Future getAll() async {
    return await _apiService.get(
      ApiEndpoints.customLinks,
      onSuccess: (res) {
        _customLinks = List<CustomLink>.from(
            jsonDecode(res.body).map((model) => CustomLink.fromJson(model)));
      },
      onError: (errorMessage) {},
    );
  }

  @override
  List<CustomLink> get customLinks => _customLinks;
}
