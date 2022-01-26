import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watamuki/src/providers/onboarding_provider.dart';
import 'package:watamuki/src/widgets/molecules/page_header.dart';

class DemoScreenArguments {
  final String phone;

  DemoScreenArguments(this.phone);
}

class Demo extends StatefulWidget {
  const Demo({Key? key, required this.title, this.args}) : super(key: key);

  final String title;
  final DemoScreenArguments? args;

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PageHeader(),
      body: Center(
        child: Column(
          children: [
            Text(widget.title),
            Text("args :: " + (widget.args?.phone).toString()),
            Text("onboarding :: " +
                (context.read<OnboardingProvider>().shouldShowOnboardingPage)
                    .toString()),
          ],
        ),
      ),
    );
  }
}
