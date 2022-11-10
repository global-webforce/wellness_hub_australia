// ignore: implementation_imports

import 'package:ez_core/ez_core.dart';
import 'package:wellness_hub_australia/app/shared/ui/empty_display.dart';
import 'package:wellness_hub_australia/features/appointments/book_appointment/book_appointment_viewmodel.dart';
import 'package:wellness_hub_australia/features/appointments/book_appointment/widgets/service_provider_card.dart';
import 'package:wellness_hub_australia/app/shared/constants/dimensions.dart';
import 'package:wellness_hub_australia/app/shared/ui/sliver_grid_delegate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChooseServiceProviderPage extends StatefulWidget {
  final Function(int)? onChanged;
  const ChooseServiceProviderPage({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  @override
  State<ChooseServiceProviderPage> createState() =>
      _ChooseServiceProviderPageState();
}

class _ChooseServiceProviderPageState extends State<ChooseServiceProviderPage> {
  @override
  Widget build(BuildContext context) {
    final viewModel =
        Provider.of<BookAppointmentViewModel>(context, listen: false);
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        return NestedScrollView(
            controller: ScrollController(),
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverPadding(
                  padding: Dimens.sliverHeaderPadding(constraints),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      children: [
                        const Icon(Icons.search_rounded),
                        hSpaceSmall,
                        Expanded(
                          child: Text(
                            "We found ${viewModel.serviceProviders.length} ${viewModel.selectedField?.title}(s) near your area",
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: CustomScrollView(
              controller: ScrollController(),
              slivers: <Widget>[
                SliverPadding(
                  padding: Dimens.sliverPadding(constraints),
                  sliver: viewModel.serviceProviders.isEmpty
                      ? const SliverFillRemaining(
                          child: EmptyDisplay(
                            icon: Icons.search_off_rounded,
                            iconColor: Colors.red,
                            title: "WE FOUND NOTHING",
                            subtitle: "Sorry for inconvinience.",
                          ),
                        )
                      : SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                            crossAxisCount: isMobile(context) ? 1 : 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            height: 230,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return ServiceProviderCard(
                                  onTap: () {
                                    viewModel.selectedServiceProviderId =
                                        viewModel.serviceProviders[index].id;
                                  },
                                  serviceProvider:
                                      viewModel.serviceProviders[index]);
                            },
                            childCount: viewModel.serviceProviders.length,
                          ),
                        ),
                ),
              ],
            ));
      },
    ));
  }
}
