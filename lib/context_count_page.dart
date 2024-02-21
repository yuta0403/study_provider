import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_provider/count_model.dart';

//  ChangeNotifierProvider 内に builder を作成して context.watch 等を呼び出す。
class CountPage extends StatelessWidget {
  const CountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CountModel>(
      create: (_) => CountModel(),
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Builder(builder: (context) {
            final model = context.watch<CountModel>();
            return Text(
              '${model.count}',
              style: TextStyle(
                fontSize: 80,
                // 色をモデルから取得
                color: model.color, 
              ),
            );
          }),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // カウンターを増やすボタン
            Builder(builder: (context) {
              return FloatingActionButton(
                onPressed: context.read<CountModel>().incrementCounter,
                child: const Icon(Icons.add),
              );
            }),
            // ボタン間のスペース
            const SizedBox(height: 10), 
            // 色を変更するボタン
            Builder(builder: (context) {
              return FloatingActionButton(
                onPressed: context.read<CountModel>().changeColor,
                child: const Icon(Icons.palette),
              );
            }),
          ],
        ),
      ),
    );
  }
}
