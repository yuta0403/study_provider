import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_provider/count_model.dart';

import 'consumer_count_page.dart' as consumer;
import 'context_count_page.dart' as context1;
import 'context_count_page2.dart' as context2;
import 'select_count_page.dart' as select;

//Consumer,Context2パターン,Context.selectを別Appとする
//Context1と2は書き方を変えたもの
void main() {
  runApp(const ConsumerApp());
  // runApp(const Context1App());
  // runApp(const Context2App());
  // runApp(const SelectApp());
}

//Consumer
class ConsumerApp extends StatelessWidget {
  const ConsumerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: consumer.CountPage(),
    );
  }
}

//Context1
class Context1App extends StatelessWidget {
  const Context1App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: context1.CountPage(),
    );
  }
}

//context2
class Context2App extends StatelessWidget {
  const Context2App({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CountModel>(
      create: (_) => CountModel(),
      child: const MaterialApp(home: context2.CountPage()),
    );
  }
}

//context.select
class SelectApp extends StatelessWidget {
  const SelectApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CountModel>(
      create: (_) => CountModel(),
      child: const MaterialApp(home: select.CountPage()),
    );
  }
}
