class MatrixModel<T> {
  final int dimension;
  List<int> indices;
  late List<List<T>> matrix;

  int get size => dimension * dimension;

  MatrixModel({
    required this.dimension,
    required T fillValue,
    required this.indices,
  }) {
    matrix = List.filled(dimension, List.filled(dimension, fillValue));
  }

  bool isActiveIndex(int i) => indices.contains(i);
}

extension MatrixExtension<T> on List<List<T>> {
  get(int index) {
    int row = index % length;
    int column = (index / length).floor();
    return this[row][column];
  }
}
