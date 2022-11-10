import 'package:ez_core/ez_core.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ClientFeedbackPage extends StatefulWidget {
  const ClientFeedbackPage({Key? key}) : super(key: key);

  @override
  State<ClientFeedbackPage> createState() => _ClientFeedbackPageState();
}

class _ClientFeedbackPageState extends State<ClientFeedbackPage> {
  Widget likeField() {
    return FormBuilderTextField(
      name: "like_feedback",
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: const InputDecoration(
        labelText: "What did you like?",
        icon: Icon(Icons.thumb_up),
      ),
    );
  }

  Widget dislikeField() {
    return FormBuilderTextField(
      name: "dislike_feedback",
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: const InputDecoration(
        labelText: "What you didn't like?",
        icon: Icon(Icons.thumb_down),
      ),
    );
  }

  Widget missingField() {
    return FormBuilderTextField(
      name: "missing_feedback",
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: const InputDecoration(
        labelText: "What is still missing?",
        icon: Icon(Icons.search),
      ),
    );
  }

  Widget referralField() {
    return FormBuilderTextField(
      name: "missing_feedback",
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: const InputDecoration(
        labelText: "Where did you hear about us?",
        icon: Icon(Icons.hearing),
      ),
    );
  }

  Widget anonymousField() {
    return FormBuilderSwitch(
        name: "anonymous_send",
        title: const Text(
          "I would like to send my feedback anonymously",
          style: TextStyle(fontSize: 16),
        ),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          icon: Icon(Icons.hide_source_rounded),
        ),
        initialValue: true,
        onChanged: (value) {
          setState(() {});
        });
  }

  Widget messageField() {
    return FormBuilderTextField(
      name: "message",
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: const InputDecoration(
        labelText: "Message",
        icon: Icon(Icons.message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Feedback"),
      ),
      body: EzScaffoldBody(builder: (context, constraints) {
        return SingleChildScrollView(
          padding: xSpaceSmall,
          child: Center(
            child: SizedBox(
              width: 1000,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            EzText.cardTitle1(
                              "Why we need your feedback?",
                            ),
                            vSpaceTiny,
                            EzText.caption(
                              "We want to develop the best app for a healthier life, In order for us to do this, we need you! Simply fill out the form and send it off.",
                            ),
                            vSpaceTiny,
                            EzText.caption(
                              "All questions are of course voluntary.",
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  vSpaceRegular,
                  Card(
                    elevation: 1,
                    clipBehavior: Clip.antiAlias,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: Column(
                        children: [
                          likeField(),
                          vSpaceRegular,
                          dislikeField(),
                          vSpaceRegular,
                          missingField(),
                          vSpaceRegular,
                          referralField(),
                          messageField(),
                          vSpaceRegular,
                          anonymousField(),
                        ],
                      ),
                    ),
                  ),
                  vSpaceRegular,
                  const EzButton.elevated(leading: Icons.send, title: "Submit"),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
