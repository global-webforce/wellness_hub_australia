import 'package:dotted_border/dotted_border.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_dashboard/screen_size_helper.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:stacked/stacked.dart';
import 'package:wellness_hub_australia/features/appointments/book_appointment/book_appointment_viewmodel.dart';
import 'package:wellness_hub_australia/app/core/authentication/address_extension.dart';
import 'package:wellness_hub_australia/app/shared/ui/scaffold_body_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:latlong2/latlong.dart';

class ServiceProviderDetailPage extends StatefulWidget {
  const ServiceProviderDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ServiceProviderDetailPage> createState() =>
      _ServiceProviderDetailPageState();
}

class _ServiceProviderDetailPageState extends State<ServiceProviderDetailPage> {
  @override
  Widget build(BuildContext context) {
    final viewModel =
        getParentViewModel<BookAppointmentViewModel>(context, listen: false);
    final serviceProvider = viewModel.selectedServiceProvider;

    Widget avatar() {
      return EzAvatar(
        name: "${serviceProvider?.firstName} ${serviceProvider?.lastName}",
        imgUrl: serviceProvider?.profilePic,
      );
    }

    Widget name() {
      return Text(
        "${serviceProvider?.firstName} ${serviceProvider?.lastName}",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      );
    }

/*     Widget services() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
        ),
        child: Text(
          serviceProvider!.offeredServices.map((e) => e.title).join(", "),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      );
    }

    Widget shortBio() {
      return Text(
        serviceProvider?.shortBio != null
            ? "${serviceProvider?.shortBio}"
            : "No Short Biography",
        style: const TextStyle(fontSize: 14, height: 1.3),
      );
    }

    Widget rating() {
      return serviceProvider!.rating > 0
          ? Wrap(
              alignment: WrapAlignment.end,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                EzText.cardTitle2(serviceProvider.rating.toStringAsFixed(1)),
                Icon(Icons.star, color: Colors.yellow.shade700)
              ],
            )
          : const SizedBox.shrink();
    } */

    Widget location() {
      var latL = serviceProvider?.address?.latitude ?? 0;
      var lonL = serviceProvider?.address?.longitude ?? 0;
      return serviceProvider?.address != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  serviceProvider?.address?.displayFull() ?? "Location Unknown",
                  style: const TextStyle(fontSize: 16),
                ),
                vSpaceSmall,
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: FlutterMap(
                      options: MapOptions(
                        center: LatLng(latL, lonL),
                        //zoom: 14.0,
                        enableScrollWheel: false,
                        allowPanningOnScrollingParent: false,

                        allowPanning: true,
                      ),
                      layers: [
                        TileLayerOptions(
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: ['a', 'b', 'c'],
                        ),
                        MarkerLayerOptions(
                          markers: [
                            Marker(
                                width: 50.0,
                                height: 50.0,
                                point: LatLng(latL, lonL),
                                builder: (ctx) => Wrap(
                                      children: const [
                                        Icon(
                                          Icons.location_pin,
                                          color: Colors.red,
                                          size: 36,
                                        ),
                                        vSpaceMedium,
                                      ],
                                    ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(12),
              padding: const EdgeInsets.all(6),
              child: const ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("No Location",
                      style: TextStyle(
                        fontSize: 16,
                      )),
                )),
              ),
            );
    }

/*     Widget _total_earnings() {
      return Text(
        1239.70.moneyFormat(),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
        ),
      );
    } */

    Widget availability() {
      return serviceProvider!.schedules.isNotEmpty
          ? ListView.separated(
              primary: false,
              shrinkWrap: true,
              itemCount: serviceProvider.schedules.length,
              separatorBuilder: (context, i) {
                return const Divider(height: 1);
              },
              itemBuilder: (context, index) {
                final schedule = serviceProvider.schedules[index];
                return ListTile(
                    onTap: null,
                    title: Wrap(spacing: 15, children: [
                      Text(
                        "${schedule.day}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                          "${schedule.startDate?.civilianTime()} to ${schedule.endDate?.civilianTime()}")
                    ]),
                    leading: const Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
              })
          : DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(12),
              padding: const EdgeInsets.all(6),
              child: const ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text("No Availabilty",
                      style: TextStyle(
                        fontSize: 16,
                      )),
                )),
              ),
            );
    }

    Widget servicesOffered() {
      final theme =
          Theme.of(context).copyWith(dividerColor: Colors.transparent);
      return serviceProvider!.offeredServices.isNotEmpty
          ? ListView.separated(
              primary: false,
              shrinkWrap: true,
              itemCount: serviceProvider.offeredServices.length,
              separatorBuilder: (context, i) {
                return const Divider(height: 1);
              },
              itemBuilder: (context, index) {
                final offeredService = serviceProvider.offeredServices[index];
                return Theme(
                  data: theme,
                  child: ExpansionTile(
                    title: Wrap(
                      children: [
                        Text(
                            "${offeredService.title} - ${offeredService.ratePerHour?.moneyFormat()} p/hour"),
                      ],
                    ),
                    children: <Widget>[
                      ListTile(
                          title: Text(
                        "${offeredService.description}",
                        style: const TextStyle(fontSize: 14),
                      )),
                    ],
                  ),
                );
              })
          : DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(12),
              padding: const EdgeInsets.all(6),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: const Center(
                      child: Text("No offered service(s)",
                          style: TextStyle(
                            fontSize: 16,
                          ))),
                ),
              ),
            );
    }

    Widget credentials() {
      final theme =
          Theme.of(context).copyWith(dividerColor: Colors.transparent);
      return serviceProvider!.credentials.isNotEmpty
          ? ListView.separated(
              primary: false,
              shrinkWrap: true,
              itemCount: serviceProvider.credentials.length,
              separatorBuilder: (context, i) {
                return const Divider(height: 1);
              },
              itemBuilder: (context, index) {
                final credential = serviceProvider.credentials[index];
                return Theme(
                  data: theme,
                  child: ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                      leading: const Icon(Icons.file_present_rounded),
                      title: Text(
                        "${credential.title}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "${credential.description}",
                        style: const TextStyle(fontSize: 14),
                      )),
                );
              })
          : DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(12),
              padding: const EdgeInsets.all(6),
              child: const ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("No Credentials(s)",
                      style: TextStyle(
                        fontSize: 16,
                      )),
                )),
              ),
            );
    }

    return Scaffold(
        body: ScaffoldBodyWrapper(
            isEmpty: viewModel.selectedServiceProvider == null,
            isBusy: viewModel.isBusy,
            onRefresh: () async {
              await viewModel.findOneAsync();
            },
            builder: (context, constraints) {
              return Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            const SizedBox(height: 60),
                            name(),
                            const Divider(height: 30),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "About Me",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      vSpaceSmall,
                                      !isNullEmptyOrFalse(
                                              serviceProvider?.shortBio)
                                          ? Text("${serviceProvider?.shortBio}")
                                          : DottedBorder(
                                              borderType: BorderType.RRect,
                                              radius: const Radius.circular(12),
                                              padding: const EdgeInsets.all(6),
                                              child: const ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12)),
                                                child: Center(
                                                    child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text("No Short Bio",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                      )),
                                                )),
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            vSpaceRegular,
                            StaggeredGrid.count(
                                crossAxisCount: isMobile(context) ? 1 : 2,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 15,
                                children: [
                                  StaggeredGridTile.fit(
                                    crossAxisCellCount: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Credentials",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        vSpaceRegular,
                                        credentials(),
                                        vSpaceRegular,
                                        const Text(
                                          "My Availability",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        vSpaceRegular,
                                        availability(),
                                      ],
                                    ),
                                  ),
                                  StaggeredGridTile.fit(
                                    crossAxisCellCount: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Services Offered",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        vSpaceRegular,
                                        servicesOffered(),
                                        vSpaceRegular,
                                        const Text(
                                          "Work Location",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        vSpaceSmall,
                                        location(),
                                      ],
                                    ),
                                  ),
                                ]),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(alignment: Alignment.topCenter, child: avatar()),
              ]);
            }));
  }
}
