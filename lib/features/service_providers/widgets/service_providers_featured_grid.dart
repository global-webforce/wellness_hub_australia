import 'package:ez_dashboard/screen_size_helper.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:wellness_hub_australia/features/service_providers/viewmodels/service_providers_viewmodel.dart';
import 'package:wellness_hub_australia/features/appointments/book_appointment/widgets/service_provider_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:stacked/stacked.dart';

class ServiceProvidersFeaturedGrid extends StatelessWidget {
  const ServiceProvidersFeaturedGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ServiceProvidersViewModel>.reactive(
        viewModelBuilder: () => ServiceProvidersViewModel(),
        builder: (context, viewModel, child) {
          return viewModel.isBusy || viewModel.serviceProviders.isEmpty
              ? const SizedBox()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: EzText.title2("Featured Service Providers "),
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: isMobile(context) ? null : 230,
                        child: AlignedGridView.count(
                            shrinkWrap: true,
                            primary: false,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: isMobile(context)
                                ? Axis.vertical
                                : Axis.horizontal,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            crossAxisCount: 1,
                            itemCount: viewModel.serviceProviders.length,
                            itemBuilder: (ctx, i) {
                              return ServiceProviderCard(
                                serviceProvider: viewModel.serviceProviders[i],
                                onTap: () {},
                              );
                            })),
                  ],
                );
        });
  }
}
