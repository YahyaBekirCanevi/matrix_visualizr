import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrix_visualizr/core/util/matrix_changer.dart';
import 'package:matrix_visualizr/pages/matrix_view/index.dart';

class MatrixVM<T> extends BlocBase<MatrixModel<T>> {
  MatrixIndicer<T> matrixIndicer;
  bool change = true;

  MatrixVM({
    required int size,
    required T fillValue,
    required List<int> indices,
    required this.matrixIndicer,
  })  : assert(size > 0, "Size cannot be negative! $size"),
        super(MatrixModel<T>(
          dimension: size,
          fillValue: fillValue,
          indices: indices,
        ));

  changeActive() => emit(matrixIndicer.changeIndices(state));
}
