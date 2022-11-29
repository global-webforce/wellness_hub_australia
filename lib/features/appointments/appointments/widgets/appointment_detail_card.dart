import 'package:ez_core/ez_core.dart';
import 'package:ez_dashboard/screen_size_helper.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:stacked/stacked.dart';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wellness_hub_australia/app/app_view_model.dart';
import 'package:wellness_hub_australia/features/appointments/appointments/viewmodels/appointments_viewmodel.dart';
import 'package:wellness_hub_australia/features/authentication/address_extension.dart';
import 'package:wellness_hub_australia/features/chat/pages/chats_detail_page.dart';

class AppointmentDetailCard extends StatelessWidget {
  const AppointmentDetailCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<AppointmentViewModel>(context);
    final appointment = viewModel.getSelectedAppointment;

    Widget spAvatar() {
      return EzAvatar(
          badge: appointment!.serviceProvider?.verified == 1
              ? Image.asset(
                  "images/verified.png",
                  fit: BoxFit.contain,
                )
              : null,
          radius: 30,
          firstName:
              "${appointment.serviceProvider?.firstName} ${appointment.serviceProvider?.lastName} ",
          imgUrl:
              "https://gwf-cors-anywhere.herokuapp.com/${appointment.serviceProvider?.profilePic}");
    }

    Widget clientAvatar() {
      return EzAvatar(
          radius: 30,
          firstName:
              "${appointment?.member?.firstName} ${appointment?.member?.lastName} ",
          imgUrl:
              "https://gwf-cors-anywhere.herokuapp.com/${appointment?.member?.profilePic}");
    }

    Widget clientName() {
      return Text(
        "${appointment!.member?.firstName} ${appointment.member?.lastName} ",
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      );
    }

    Widget clientNumber() {
      return Text(
        "${appointment!.member?.mobileNumber} ",
        style: const TextStyle(fontSize: 14),
      );
    }

    Widget spName() {
      return Text(
        "${appointment!.serviceProvider?.firstName} ${appointment.serviceProvider?.lastName} ",
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      );
    }

    Widget spService() {
      return EzPill(
        "${appointment!.fieldDetails?.title}",
        backgroundColor: HexColor("#8A58B2"),
        foregroundColor: Colors.white,
      );
    }

    Widget date() {
      return Text(
        "${appointment!.startDate.toDate()} ${appointment.startDate.civilianTime()} - ${appointment.endDate.civilianTime()} ",
        style: const TextStyle(
          fontSize: 14,
        ),
      );
    }

    Widget location() {
      return Wrap(
        spacing: 5,
        children: [
          Icon(Icons.location_pin, color: Colors.red.shade400),
          Text("${appointment!.serviceProvider?.address?.displaySafe()}",
              style: const TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis),
        ],
      );
    }

    Widget amount() {
      return Text(
        "${appointment!.total?.moneyFormat()}",
      );
    }

    Widget paymentStatus() {
      return Text(
        "${appointment!.paymentType} - ${appointment.paid == 1 ? "Paid" : "Unpaid"}",
        style: const TextStyle(
          fontSize: 14,
        ),
      );
    }

    Widget status() {
      return EzPill(
        "${appointment!.status}",
        backgroundColor: appointment.status == "Confirmed"
            ? Colors.blue
            : appointment.status == "Completed"
                ? Colors.green
                : appointment.status == "Missed"
                    ? Colors.orange
                    : appointment.status == "Cancelled"
                        ? Colors.red
                        : Colors.grey,
        foregroundColor: Colors.white,
      );
    }

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              StaggeredGrid.count(
                crossAxisCount: isMobile(context) ? 1 : 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  StaggeredGridTile.fit(
                    crossAxisCellCount: 2,
                    child: Text(
                      "APPOINTMENT #${appointment!.id}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  StaggeredGridTile.fit(
                    crossAxisCellCount: 1,
                    child: Wrap(
                      spacing: 5,
                      children: [
                        const Text("Date :"),
                        date(),
                      ],
                    ),
                  ),
                  StaggeredGridTile.fit(
                    crossAxisCellCount: 1,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 5,
                      children: [
                        const Text("Status :"),
                        status(),
                      ],
                    ),
                  ),
                  StaggeredGridTile.fit(
                    crossAxisCellCount: 1,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 5,
                      children: [
                        const Text("Location :"),
                        location(),
                      ],
                    ),
                  ),
                  StaggeredGridTile.fit(
                    crossAxisCellCount: 1,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 5,
                      children: [
                        const Text("Amount : "),
                        amount(),
                        paymentStatus(),
                      ],
                    ),
                  ),
                  if (getParentViewModel<AppViewModel>(context, listen: false)
                      .isMember())
                    StaggeredGridTile.fit(
                      crossAxisCellCount: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "SERVICE PROVIDER :",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          vSpaceSmall,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              spAvatar(),
                              hSpaceRegular,
                              Expanded(
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        spName(),
                                        vSpaceTiny,
                                        spService(),
                                      ],
                                    ),
                                    hSpaceSmall,
                                    IconButton(
                                        onPressed: () {
                                          viewModel.navigationService
                                              .navigateToView(ChatsDetailPage(
                                                  recipientId: getParentViewModel<
                                                                  AppViewModel>(
                                                              context,
                                                              listen: false)
                                                          .isServiceProvider()
                                                      ? appointment.member?.id
                                                      : appointment
                                                          .serviceProvider
                                                          ?.id));
                                        },
                                        icon: const Icon(Icons.email_rounded)),
                                    hSpaceSmall,
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.phone))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  if (getParentViewModel<AppViewModel>(context, listen: false)
                      .isServiceProvider())
                    StaggeredGridTile.fit(
                      crossAxisCellCount: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "CLIENT :",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          vSpaceSmall,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              clientAvatar(),
                              hSpaceRegular,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    clientName(),
                                    vSpaceTiny,
                                    clientNumber(),
                                  ],
                                ),
                              ),
                              hSpaceSmall,
                              IconButton(
                                  onPressed: () {
                                    viewModel.navigationService.navigateToView(
                                        ChatsDetailPage(
                                            recipientId: getParentViewModel<
                                                            AppViewModel>(
                                                        context,
                                                        listen: false)
                                                    .isServiceProvider()
                                                ? appointment.member?.id
                                                : appointment
                                                    .serviceProvider?.id));
                                  },
                                  icon: const Icon(Icons.email_rounded)),
                              hSpaceSmall,
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.phone))
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          )),
    );
  }
}
