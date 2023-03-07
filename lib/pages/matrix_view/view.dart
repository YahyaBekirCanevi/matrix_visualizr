import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:matrix_visualizr/core/util/matrix_changer.dart';
import 'package:matrix_visualizr/pages/matrix_view/index.dart';

class MatrixView extends StatelessWidget {
  final int size;
  const MatrixView({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MatrixVM<int>(
        size: size,
        fillValue: 0,
        indices: [0, 3, 8],
        matrixIndicer: LinearMatrixIndicer<int>(),
      ),
      child: const _MatrixView(),
    );
  }
}

class _MatrixView extends HookWidget {
  const _MatrixView();

  @override
  Widget build(BuildContext context) {
    final updater = useState(0);
    double width = MediaQuery.of(context).size.width;
    var bloc = BlocProvider.of<MatrixVM<int>>(context);

    useEffect(() {
      Future.delayed(
        const Duration(milliseconds: 400),
        () {
          updater.value++;
          bloc.changeActive();
        },
      );
      return null;
    }, [updater.value]);

    return BlocBuilder<MatrixVM<int>, MatrixModel<int>>(
      bloc: bloc,
      builder: (context, state) => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: state.dimension,
        ),
        itemCount: state.dimension * state.dimension,
        itemBuilder: (_, i) => DecoratedBox(
          decoration: BoxDecoration(
            color: state.isActiveIndex(i) ? Colors.red : Colors.black,
            border: Border.all(color: Colors.grey, width: 1),
          ),
          child: SizedBox.square(dimension: width / state.dimension),
        ),
      ),
    );
  }
}
