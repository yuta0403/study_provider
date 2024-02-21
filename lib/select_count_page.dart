import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_provider/count_model.dart';

class CountPage extends StatelessWidget {
  const CountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final readModel = context.read<CountModel>();

    // ラムダ式 + 無名関数の書き方(要復習)
    final count = context.select<CountModel, int>(
      (CountModel model) => model.count,
    );

    // ラムダ式 も 無名関数も使用しない書き方(要復習)
    Color selectColor(CountModel model) {
      return model.color;
    }

    final Color color = context.select<CountModel, Color>(selectColor);

    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: Text(
          // context.watchを使用して再描画
          '$count', 
          style: TextStyle(
            fontSize: 80,
            color: color, 
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
          const SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () => readModel.changeColor(),
            child: const Icon(Icons.palette),
          ),
          // const SizedBox(height: 20),
          // FloatingActionButton(
          //   onPressed: () => readModel.resetCounter(),
          //   child: const Icon(Icons.refresh),
          // ),
        ],
      ),
    );
  }
}
