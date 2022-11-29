import 'package:ez_dashboard/screen_size_helper.dart';
import 'package:stacked/stacked.dart';
import 'package:wellness_hub_australia/features/appointments/book_appointment/book_appointment_viewmodel.dart';
import 'package:wellness_hub_australia/features/pillars/widgets/pillar_card.dart';
import 'package:wellness_hub_australia/app/shared/constants/dimensions.dart';
import 'package:wellness_hub_australia/app/shared/ui/sliver_grid_delegate.dart';
import 'package:flutter/material.dart';

class ChoosePillarPage extends StatefulWidget {
  const ChoosePillarPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ChoosePillarPage> createState() => ChoosePillarPageState();
}

class ChoosePillarPageState extends State<ChoosePillarPage> {
  @override
  Widget build(BuildContext context) {
    final viewModel =
        getParentViewModel<BookAppointmentViewModel>(context, listen: false);
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            controller: ScrollController(),
            child: Column(
              children: [
                const Text(
                  "Choose Pillar",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                GridView.builder(
                  padding: Dimens.sliverPadding800(constraints),
                  controller: ScrollController(),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: viewModel.pillars.length,
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                          crossAxisCount: isMobile(context) ? 1 : 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          height: 70),
                  itemBuilder: (context, index) {
                    return PillarCard(
                      pillar: viewModel.pillars[index],
                      selected: viewModel.pillars[index].id ==
                          viewModel.selectedPillarId,
                      onTap: () {
                        viewModel.selectedPillarId =
                            viewModel.pillars[index].id;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }));
  }
}
