import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CardComponent extends Component<CardState> {
  CardComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CardState>(
                adapter: null,
                slots: <String, Dependent<CardState>>{
                }),);

}
