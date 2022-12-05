import 'package:auto_route/auto_route.dart';
import 'package:ez_core/ez_core.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wellness_hub_australia/app/app.viewmodels_busy_keys.dart';
import 'package:wellness_hub_australia/features/appointments/book_appointment/book_appointment_viewmodel.dart';
import 'package:wellness_hub_australia/features/appointments/book_appointment/pages/choose_field_page.dart';
import 'package:wellness_hub_australia/features/appointments/book_appointment/pages/choose_pillar_page.dart';
import 'package:wellness_hub_australia/features/appointments/book_appointment/pages/choose_service_provider_page.dart';
import 'package:wellness_hub_australia/features/appointments/book_appointment/pages/service_provider_detail_page.dart';
import 'package:wellness_hub_australia/features/appointments/book_appointment/pages/choose_date_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stacked/stacked.dart';

class BookAppointmentPage extends StatefulWidget {
  const BookAppointmentPage({Key? key}) : super(key: key);

  @override
  State<BookAppointmentPage> createState() => _BookAppointmentPageState();
}

class _BookAppointmentPageState extends State<BookAppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BookAppointmentViewModel>.reactive(
        viewModelBuilder: () => BookAppointmentViewModel(),
        onModelReady: (viewModel) => viewModel.init(),
        builder: (context, viewModel, child) {
          final List<Widget> bookAppointmentPages = [
            const ChoosePillarPage(),
            const ChooseFieldPage(),
            const ChooseServiceProviderPage(),
            const ServiceProviderDetailPage(),
            const ChooseAppointmentPage()
          ];

          Widget nextBackButton() {
            return !viewModel.isReadyForBooking()
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                            onPressed: viewModel.page > 0
                                ? () {
                                    viewModel.back();
                                  }
                                : null,
                            icon: const Icon(Icons.chevron_left_rounded)),
                        SmoothPageIndicator(
                            controller: viewModel.controller, // PageController
                            count: 5,
                            effect: WormEffect(
                              dotColor: Colors.grey,
                              activeDotColor: HexColor("#8959B0"),
                              dotHeight: 10,
                              dotWidth: 10,
                            ),
                            onDotClicked: (index) {}),
                        IconButton(
                            onPressed: viewModel.canProceed()
                                ? () {
                                    viewModel.next();
                                  }
                                : null,
                            icon: const Icon(Icons.chevron_right_rounded)),
                      ],
                    ),
                  )
                : InkWell(
                    onTap: () {
                      viewModel.create();
                    },
                    child: Container(
                      height: 60,
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            viewModel.busy(ViewModelBusyKeys.appointmentBooking)
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Tooltip(
                                        message:
                                            "${viewModel.selectedDate.civilianTime()}",
                                        child: Wrap(
                                          spacing: 10,
                                          children: [
                                            const Icon(
                                              Icons.calendar_month_rounded,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              "${DateFormat("MMM d hh:mm a").format(viewModel.selectedDate ?? DateTime.now())} ",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      hSpaceSmall,
                                      const SizedBox(
                                          height: 30, child: VerticalDivider()),
                                      hSpaceSmall,
                                      const Text(
                                        "BOOK NOW",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ),
                  );
          }

          return WillPopScope(
            onWillPop: () => Future.sync(viewModel.onWillPop),
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                leading: viewModel.page == 0
                    ? IconButton(
                        onPressed: () => context.popRoute(),
                        icon: const Icon(Icons.close_rounded))
                    : BackButton(onPressed: () => viewModel.back()),
                title: const Text('BOOK NOW'),
              ),
              bottomNavigationBar: nextBackButton(),
              body: viewModel.isBusy
                  ? const Center(child: CircularProgressIndicator())
                  : PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: viewModel.controller,
                      itemCount: bookAppointmentPages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return bookAppointmentPages[
                            index % bookAppointmentPages.length];
                      },
                      onPageChanged: (int page) {
                        viewModel.page = page;
                      },
                    ),
            ),
          );
        });
  }
}
