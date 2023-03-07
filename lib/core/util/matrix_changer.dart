import 'package:matrix_visualizr/pages/matrix_view/index.dart';

abstract class MatrixIndicer<T> {
  MatrixModel<T> changeIndices(MatrixModel<T> model);
}

class LinearMatrixIndicer<T> extends MatrixIndicer<T> {
  @override
  MatrixModel<T> changeIndices(MatrixModel<T> model) {
    for (int i = 0; i < model.indices.length; i++) {
      model.indices[i] = (model.indices[i] + 1) % model.size;
    }
    return model;
  }
}
