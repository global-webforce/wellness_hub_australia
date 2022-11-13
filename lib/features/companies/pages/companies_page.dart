import 'package:wellness_hub_australia/features/companies/viewmodels/companies_viewmodel.dart';
import 'package:wellness_hub_australia/features/companies/widgets/company_datagrid.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CompaniesPage extends StatelessWidget {
  const CompaniesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CompaniesViewModel>.reactive(
        viewModelBuilder: () => CompaniesViewModel(),
        onModelReady: (viewModel) async {
          await viewModel.getAll();
        },
        builder: (context, viewModel, child) {
          return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: const Text("Companies"),
              ),
              body: Padding(
                padding: const EdgeInsets.all(15),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: const [
                              Text(
                                "Companies",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        height: 0,
                      ),
                      Expanded(
                        child: CompanyDataGridWidget(
                          source: CompanyDataGridSource(
                              companyData: viewModel.companies),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}
