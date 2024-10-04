import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // ChangeNotifierProvider için gerekli

class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  final T viewModel;
  final Function(T model) onModelReady;
  final VoidCallback? onDispose;
  final Widget Function(BuildContext context, T value) onPageBuilder;

  const BaseView(
      {super.key,
      required this.viewModel,
      required this.onModelReady,
      this.onDispose,
      required this.onPageBuilder});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> {
  late T model;

  @override
  void initState() {
    super.initState();
    model = widget.viewModel;
    widget.onModelReady(model);
  }

  @override
  void dispose() {
    if (widget.onDispose != null) widget.onDispose!();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(
        builder: (context, value, child) {
          return widget.onPageBuilder(context, value);
        },
      ),
    );
  }
}
