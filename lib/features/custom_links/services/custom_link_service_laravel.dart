import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/features/custom_links/services/custom_link_service.dart';
import 'package:wellness_hub_australia/app/api/api_endpoints.dart';
import 'package:wellness_hub_australia/app/models/custom_link.model.dart';
import 'package:wellness_hub_australia/app/api/api_service.dart';
import 'package:faker/faker.dart' as fkr;

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
        _customLinks = List.generate(10, (i) {
          return CustomLink(
              id: i,
              title: fkr.faker.lorem.sentences(2).join(" "),
              linkIcon: fkr.faker.image.image(random: true),
              description: fkr.faker.lorem.sentences(5).join(" "));
        });

/* 
        List<CustomLink>.from(
            jsonDecode(res.body).map((model) => CustomLink.fromJson(model))); */
      },
      onError: (errorMessage) {},
    );
  }

  @override
  List<CustomLink> get customLinks => _customLinks;
}
