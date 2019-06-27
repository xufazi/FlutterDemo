/**
 *  Create by fazi
 *  Date: 2019-06-10
 */

/// 定义一个state
class ReduxState {
  String name;
  ReduxState.initState() : name = "666";
}

/// 定义action
enum Action {
  Change
}

/// 定义reducer
ReduxState getReduce(ReduxState state, action) {
  if(action == Action.Change) {
    String nname = "1";
    state.name = state.name + nname;
  }
  return state;
}
