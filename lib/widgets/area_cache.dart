import 'dart:collection';

import 'package:brag/widgets/area.dart';

class AreaCache {
  var _index = -1;

  final List<Area> _Areas = [
    const Area(
      'lib/assets/img1.png',
      'Home Decor Ideas',
    ),
    const Area(
      'lib/assets/img2.png',
      'Interior Inspiration',
    ),
    const Area(
      'lib/assets/img3.png',
      'Modern Sofa Ideas',
    ),
    const Area(
      'lib/assets/img4.png',
      'Modern Sofa Ideas',
    ),
    const Area(
      'lib/assets/img5.png',
      'Living Room Inspiration',
    ),
    const Area(
      'lib/assets/img6.png',
      'Interior Inspiration',
    ),
    const Area(
      'lib/assets/img7.png',
      '',
    ),
    const Area(
      'lib/assets/img8.png',
      '',
    ),
  ];

  void addItem(
    String image,
    String description,
  ) {
    _Areas.add(Area(
      image,
      description,
    ));
  }

  int get index => _index;

  set index(int value) {
    if ((value >= 0) && (value < _Areas.length)) {
      _index = value;
    } else {
      _index = -1;
    }
  }

  UnmodifiableListView<Area> get list => UnmodifiableListView<Area>(_Areas);
}
