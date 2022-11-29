import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

//1. Create name/alias of custom dialog
enum DialogType { error, confirmDelete }

Future<void> setupDialogUI() async {
  final dialogService = locator<DialogService>();

//2. Add it on builders
  final builders = {
    DialogType.error: (context, sheetRequest, completer) =>
        _ErrorDialog(request: sheetRequest, completer: completer),
    DialogType.confirmDelete: (context, sheetRequest, completer) =>
        _ConfirmDeleteDialog(request: sheetRequest, completer: completer),
  };
  dialogService.registerCustomDialogBuilders(builders);
}

//3. Create the widget that represents the custom dialog
class _ErrorDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _ErrorDialog({Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                "Error Occured!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.red),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${request.description}",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () =>
                          completer(DialogResponse(confirmed: false)),
                      child: const Text("Close")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ConfirmDeleteDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _ConfirmDeleteDialog(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                "Confirm Delete!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.red),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${request.description}",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () =>
                          completer(DialogResponse(confirmed: false)),
                      child: const Text("Cancel")),
                  const SizedBox(width: 5),
                  TextButton(
                      onPressed: () =>
                          completer(DialogResponse(confirmed: true)),
                      child: const Text(
                        "Delete",
                        style: TextStyle(color: Colors.red),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/***

SHOW GENERAL ERROR

    _dialogService.showCustomDialog(
          variant: DialogType.error,
          barrierDismissible: true,
          description: e.toString()); 


CONFIRM DELETE

         _dialogService.showCustomDialog(
          variant: DialogType.confirmDelete,
          barrierDismissible: true,
          description: "Are you sure you want to delete item #1?"); 
  
  
  
  
 
 * ***/
