import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:wellness_hub_australia/app/app_view_model.dart';
import 'package:wellness_hub_australia/features/appointments/book_appointment/book_appointment_viewmodel.dart';
import 'package:wellness_hub_australia/models/service_provider.model.dart';
import 'package:flutter/material.dart';
import 'package:wellness_hub_australia/features/authentication/address_extension.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class ServiceProviderCard extends StatelessWidget {
  final ServiceProvider serviceProvider;
  final Function onTap;
  final bool selected;
  const ServiceProviderCard({
    Key? key,
    required this.serviceProvider,
    required this.onTap,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel =
        Provider.of<BookAppointmentViewModel>(context, listen: false);

    Widget _avatar(double width) {
      return EzAvatar(
          badge: serviceProvider.verified == 1
              ? Image.asset(
                  "images/verified.png",
                  fit: BoxFit.contain,
                )
              : null,
          radius: (width * 0.2).roundToDouble() / 2,
          firstName:
              "${serviceProvider.firstName} ${serviceProvider.lastName} ",
          imgUrl: "${serviceProvider.profilePic}");
    }

    Widget _name() {
      return Text(
        "${serviceProvider.firstName} ${serviceProvider.lastName[0]}.",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      );
    }

    Widget _serviceSelected() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: HexColor("${viewModel.selectedPillar?.colorTheme}"),
        ),
        child: Text(
          "${viewModel.selectedField?.title}",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      );
    }

    Widget _serviceSelectedAmount() {
      return Text(
        "${serviceProvider.offeredServices.firstWhere((e) => e.fieldId == viewModel.selectedFieldId).ratePerHour?.moneyFormat()} / hr",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      );
    }

    Widget _services() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
        ),
        child: Text(
          serviceProvider.offeredServices.map((e) => e.title).join(", "),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      );
    }

    Widget _shortBio() {
      return Text(
        "${serviceProvider.shortBio}",
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 13, height: 1.3),
      );
    }

    Widget _rating() {
      return serviceProvider.rating >= 1
          ? Wrap(
              alignment: WrapAlignment.end,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  serviceProvider.rating.toStringAsFixed(1),
                  style: const TextStyle(fontSize: 16),
                ),
                Icon(Icons.star, color: Colors.yellow.shade700)
              ],
            )
          : const SizedBox.shrink();
    }

    Widget _location() {
      return Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Icon(Icons.location_pin, color: Colors.red.shade400),
          Text(
            " ${serviceProvider.address?.distanceFrom(
              lat: Provider.of<AppViewModel>(context, listen: false)
                  .user
                  ?.address
                  ?.latitude,
              long: Provider.of<AppViewModel>(context, listen: false)
                  .user
                  ?.address
                  ?.longitude,
            )} kms away",
            style: const TextStyle(fontSize: 14),
          ),
        ],
      );
    }

    Widget _saveAsFavoriteButton() {
      return IconButton(
          onPressed: () {},
          icon: const Icon(
            EvaIcons.heart,
            color: Colors.purple,
          ));
    }

    return SizedBox(
        width: 360,
        child: Card(
          shape: selected
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.primary, width: 2))
              : null,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => onTap(),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: LayoutBuilder(builder: (context, constraints) {
                return IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Column(
                              children: [
                                _avatar(constraints.maxWidth),
                              ],
                            ),
                            hSpaceRegular,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      _name(),
                                      vSpaceSmall,
                                      _rating(),
                                    ],
                                  ),
                                  const SizedBox(height: 3),
                                  if (serviceProvider
                                      .offeredServices.isNotEmpty)
                                    _serviceSelected(),
                                  vSpaceSmall,
                                  _shortBio(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      vSpaceSmall,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: _location()),
                          vSpaceRegular,
                          _serviceSelectedAmount(),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ));
  }
}