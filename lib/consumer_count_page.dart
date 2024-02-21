import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_provider/count_model.dart';

class CountPage extends StatelessWidget {
  const CountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CountModel>(
      create: (_) => CountModel(),
      child: Scaffold(
        appBar: AppBar(title: const Text('provider')),
        body: Center(
          child: Consumer<CountModel>(
            builder: (context, model, child) {
              return Text(
                '${model.count}',
                style: TextStyle(
                  fontSize: 80,
                  // 色をモデルから取得
                  color: model.color, 
                ),
              );
            },
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // カウンターを増やすボタン
            Consumer<CountModel>(
              builder: (context, model, child) {
                return FloatingActionButton(
                  onPressed: model.incrementCounter,
                  child: const Icon(Icons.add),
                );
              },
            ),
            // ボタン間のスペース
            const SizedBox(height: 10), 
            // 色を変更するボタン
            Consumer<CountModel>(
              builder: (context, model, child) {
                return FloatingActionButton(
                  onPressed: model.changeColor,
                  child: const Icon(Icons.palette),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
