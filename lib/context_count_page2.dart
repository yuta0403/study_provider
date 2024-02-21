import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_provider/count_model.dart';

class CountPage extends StatelessWidget {
  const CountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final readModel = context.read<CountModel>();
    final watchModel = context.watch<CountModel>();
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: Text(
          // context.watchを使用して再描画
          '${watchModel.count}',
          style: TextStyle(
            fontSize: 80,
            color: watchModel.color,
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          // context.readを使用してメソッドを呼び出し
          FloatingActionButton(
            onPressed: () => readModel.incrementCounter(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => readModel.changeColor(),
            child: const Icon(Icons.palette),
          ),
        ],
      ),
    );
  }
}
