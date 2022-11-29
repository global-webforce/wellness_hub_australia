import 'package:ez_dashboard/screen_size_helper.dart';
import 'package:stacked/stacked.dart';
import 'package:wellness_hub_australia/features/appointments/book_appointment/book_appointment_viewmodel.dart';
import 'package:wellness_hub_australia/features/fields/widgets/choose_field_card.dart';
import 'package:wellness_hub_australia/app/shared/constants/dimensions.dart';
import 'package:wellness_hub_australia/app/shared/ui/sliver_grid_delegate.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ChooseFieldPage extends StatefulWidget {
  const ChooseFieldPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ChooseFieldPage> createState() => _ChooseFieldPageState();
}

class _ChooseFieldPageState extends State<ChooseFieldPage> {
  @override
  Widget build(BuildContext context) {
    final viewModel =
        getParentViewModel<BookAppointmentViewModel>(context, listen: false);

    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          controller: ScrollController(),
          child: Column(
            children: [
              Text(
                "Choose ${viewModel.selectedPillar?.title} Service",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              GridView.builder(
                controller: ScrollController(),
                padding: Dimens.sliverPadding800(constraints),
                primary: false,
                shrinkWrap: true,
                itemCount: viewModel.fields.length,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                        crossAxisCount: isMobile(context)
                            ? 1
                            : viewModel.fields.length > 1
                                ? 2
                                : 1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        height: 70),
                itemBuilder: (context, index) {
                  return ChooseFieldCard(
                    color: HexColor("${viewModel.selectedPillar?.colorTheme}"),
                    field: viewModel.fields[index],
                    selected:
                        viewModel.fields[index].id == viewModel.selectedFieldId,
                    onTap: () {
                      viewModel.selectedFieldId = viewModel.fields[index].id;
                    },
                  );
                },
              ),
            ],
          ),
        ),
      );
    }));
  }
}
