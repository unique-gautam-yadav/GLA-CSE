import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glau/Providers/provider.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
                onPressed: () => context.read<Counter>().increment(),
                child: const Icon(CupertinoIcons.add)),
            const SizedBox(height: 10),
            FloatingActionButton(
                onPressed: () => context.read<Counter>().decrement(),
                child: const Icon(CupertinoIcons.minus)),
            const SizedBox(height: 10),
            FloatingActionButton(
                onPressed: () => context.read<Counter>().reset(),
                child: const Text("0")),
          ],
        ),
        appBar: AppBar(
          title: const Text("Counter Application"),
          backgroundColor: Colors.red[900],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Your counter values : ${context.watch<Counter>().count}",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                "${context.watch<Counter>().count}",
                style: Theme.of(context).textTheme.headlineLarge,
              )
            ],
          ),
        ),
      ),
    );
  }
}
