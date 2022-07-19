import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class BasePage<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T value, Widget? child) builder;
  final T provider;
  final Widget? child;

  const BasePage({
    Key? key, 
    required this.builder, 
    required this.provider, 
    required this.child
  }) : super(key: key);

  @override
  _BasePageState<T> createState() => _BasePageState<T>();
}

class _BasePageState<T extends ChangeNotifier> extends State<BasePage<T>> {
  // We want to store the instance of the model in the state
  // that way it stays constant through rebuilds
  late T model;
  
  @override
  void initState() {
    // assign the model once when state is initialised
    model = widget.provider;
    super.initState();
  }

  @override
  void dispose() {
    widget.provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var s = widget.child as Scaffold;
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}