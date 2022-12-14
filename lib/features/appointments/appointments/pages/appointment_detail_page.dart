import 'package:awesome_select/awesome_select.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wellness_hub_australia/app/app.viewmodels_busy_keys.dart';
import 'package:wellness_hub_australia/app/core/authentication/address_extension.dart';

import 'package:wellness_hub_australia/app/shared/ui/scaffold_body_wrapper.dart';
import 'package:wellness_hub_australia/features/appointments/appointments/viewmodels/appointments_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wellness_hub_australia/features/appointments/shared/appointment_extension.dart';
import 'package:wellness_hub_australia/features/chat/pages/chats_detail_page.dart';

class AppointmentDetailPage extends StatelessWidget {
  final int appointmentId;
  const AppointmentDetailPage({Key? key, required this.appointmentId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppointmentViewModel>.reactive(
        viewModelBuilder: () => AppointmentViewModel(),
        onModelReady: (viewModel) {
          viewModel.appointmentID = appointmentId;
        },
        builder: (context, viewModel, child) {
          final appointment = viewModel.appointment;
          final member = viewModel.appointment?.member;
          final sp = viewModel.appointment?.serviceProvider;

          Widget avatar() {
            return Align(
              alignment: Alignment.topCenter,
              child: EzAvatar(
                  name: viewModel.appService.isMember()
                      ? "${sp?.firstName} ${sp?.lastName}"
                      : "${member?.firstName} ${member?.lastName}",
                  imgUrl: viewModel.appService.isMember()
                      ? "${sp?.profilePic}"
                      : "${member?.profilePic}"),
            );
          }

          Widget name() {
            return Text(
              viewModel.appService.isMember()
                  ? "${sp?.firstName} ${sp?.lastName}"
                  : "${member?.firstName} ${member?.lastName}",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            );
          }

          Widget address() {
            return Text(
              viewModel.appService.isMember()
                  ? "${sp?.address?.displaySafe()}"
                  : "${member?.address?.displaySafe()}",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
              ),
            );
          }

          Widget actionButtons() {
            return SizedBox(
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        viewModel.navigationService.navigateToView(
                            ChatsDetailPage(
                                recipientId: viewModel.appService.isMember()
                                    ? sp?.id
                                    : member?.id));
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 5,
                          children: const [
                            Icon(Icons.message),
                            Text(
                              "Chat",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const VerticalDivider(),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        launchUrl(
                          Uri.parse(viewModel.appService.isMember()
                              ? "tel://${sp?.mobileNumber}"
                              : "tel://${member?.mobileNumber}"),
                          mode: LaunchMode.platformDefault,
                        );
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 5,
                          children: const [
                            Icon(Icons.phone),
                            Text(
                              "Call",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }

          return Scaffold(
              appBar: AppBar(
                title: const Text("Booking Detail"),
              ),
              bottomNavigationBar: viewModel.appService.isServiceProvider()
                  ? const FinishTaskButton()
                  : const SizedBox.shrink(),
              body: ScaffoldBodyWrapper(onRefresh: () async {
                await viewModel.getAll();
              }, builder: (context, constraints) {
                return Column(
                  children: [
                    Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: SizedBox(
                          width: double.infinity,
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            child: SizedBox(
                              child: Column(
                                children: [
                                  const SizedBox(height: 60),
                                  name(),
                                  vSpaceTiny,
                                  address(),
                                  vSpaceRegular,
                                  const Divider(),
                                  actionButtons(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      avatar(),
                    ]),
                    vSpaceRegular,
                    FormBuilder(
                      key: viewModel.appointmentFormKey,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: SizedBox(
                          child: Column(
                            children: [
                              ListView(
                                  shrinkWrap: true,
                                  primary: false,
                                  children: ListTile.divideTiles(
                                    context: context,
                                    tiles: [
                                      const ListTile(
                                        title: Text(
                                          "Appointment",
                                          style: TextStyle(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      ListTile(
                                        title: Text(
                                          "${appointment?.fieldDetails?.title}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        subtitle: const Text("Service"),
                                      ),
                                      ListTile(
                                        title: Text(
                                          "${appointment?.startDate.toDate()} ${appointment?.startDate.civilianTime()} - ${appointment?.endDate.civilianTime()} ",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        subtitle: const Text("Date"),
                                      ),
                                      ListTile(
                                        title: Text(
                                          ("${appointment?.serviceProvider?.address?.displaySafe()}"),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        subtitle: const Text("Location"),
                                      ),

                                      FormBuilderField(
                                        name: "payment_type",
                                        initialValue: appointment?.paymentType,
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),
                                        ]),
                                        builder:
                                            (FormFieldState<dynamic> field) {
                                          return SmartSelect<String?>.single(
                                            title: 'Mode of Payment',
                                            tileBuilder: (context, value) {
                                              return ListTile(
                                                contentPadding:
                                                    const EdgeInsets.fromLTRB(
                                                        16, 0, 8, 0),
                                                onTap: viewModel.appService
                                                        .isServiceProvider()
                                                    ? () => value.showModal()
                                                    : null,
                                                leading: const Icon(
                                                    Icons.payment_rounded),
                                                title: Text(
                                                  "${field.value}",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                subtitle: const Text(
                                                    "Mode of Payment"),
                                                trailing: const Icon(
                                                  Icons.chevron_right_outlined,
                                                  size: 30,
                                                ),
                                              );
                                            },
                                            selectedValue: field.value,
                                            onChange: (state) {
                                              field.didChange(state.title);
                                            },
                                            modalType: S2ModalType.popupDialog,
                                            modalConfig: S2ModalConfig(
                                                barrierColor: Colors.black
                                                    .withOpacity(0.5)),
                                            choiceItems: <S2Choice<String?>>[
                                              S2Choice<String>(
                                                value: 'Cash',
                                                title: 'Cash',
                                              ),
                                              S2Choice<String>(
                                                  value: 'Cheque',
                                                  title: 'Cheque'),
                                              S2Choice<String>(
                                                value: 'Card',
                                                title: 'Card',
                                              ),
                                            ],
                                          );
                                        },
                                      ),

                                      FormBuilderField(
                                          name: "status",
                                          initialValue: appointment?.status,
                                          validator:
                                              FormBuilderValidators.compose([
                                            FormBuilderValidators.required(),
                                          ]),
                                          builder:
                                              (FormFieldState<dynamic> field) {
                                            return SmartSelect<String?>.single(
                                              title: 'Status',
                                              tileBuilder: (context, value) {
                                                return ListTile(
                                                  contentPadding:
                                                      const EdgeInsets.fromLTRB(
                                                          16, 0, 8, 0),
                                                  leading: Icon(
                                                    Icons.circle,
                                                    color: appointment
                                                        ?.statusColor(),
                                                  ),
                                                  onTap: viewModel.appService
                                                          .isServiceProvider()
                                                      ? () => value.showModal()
                                                      : null,
                                                  title: Text(
                                                    "${field.value}",
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  subtitle:
                                                      const Text("Status"),
                                                  trailing: const Icon(
                                                    Icons
                                                        .chevron_right_outlined,
                                                    size: 30,
                                                  ),
                                                );
                                              },
                                              selectedValue: field.value,
                                              onChange: (state) {
                                                field.didChange(state.title);
                                              },
                                              modalType:
                                                  S2ModalType.popupDialog,
                                              modalConfig: S2ModalConfig(
                                                  barrierColor: Colors.black
                                                      .withOpacity(0.5)),
                                              choiceItems: <S2Choice<String?>>[
                                                S2Choice<String>(
                                                  value: 'Pending',
                                                  title: 'Pending',
                                                ),
                                                S2Choice<String>(
                                                  value: 'Confirmed',
                                                  title: 'Confirmed',
                                                ),
                                                S2Choice<String>(
                                                    value: 'Completed',
                                                    title: 'Completed'),
                                                S2Choice<String>(
                                                  value: 'Missed',
                                                  title: 'Missed',
                                                ),
                                                S2Choice<String>(
                                                  value: 'Cancelled',
                                                  title: 'Cancelled',
                                                ),
                                              ],
                                            );
                                          }),
                                      const Divider(), //
                                    ],
                                  ).toList()),
                            ],
                          ),
                        ),
                      ),
                    ),
                    vSpaceRegular,
                    Card(
                      clipBehavior: Clip.antiAlias,
                      child: SizedBox(
                        child: Column(
                          children: [
                            ListView(
                                shrinkWrap: true,
                                primary: false,
                                children: ListTile.divideTiles(
                                  context: context,
                                  tiles: [
                                    ListTile(
                                      title: Text(
                                        (appointment?.paid == 1
                                            ? "Paid"
                                            : "Unpaid"),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      trailing: Text(
                                        ("${appointment!.total?.moneyFormat()}"),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    )
                                  ],
                                ).toList()),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }));
        });
  }
}

class FinishTaskButton extends ViewModelWidget<AppointmentViewModel> {
  const FinishTaskButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AppointmentViewModel viewModel) {
    return BottomAppBar(
      elevation: 15,
      child: Container(
        padding: const EdgeInsets.all(15),
        color: Theme.of(context).backgroundColor,
        child: SizedBox(
          height: 40,
          child: EzButton.elevated(
            busy: viewModel.busy(ViewModelBusyKeys.appointmentUpdate),
            title: "Save Changes",
            onTap: () async => await viewModel.update(),
            rounded: true,
          ),
        ),
      ),
    );
  }
}
