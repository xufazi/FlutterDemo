/**
 *  Create by fazi
 *  Date: 2019-07-09
 */
import 'package:rxdart/rxdart.dart';
import 'package:flutter_demo/RxDartBloc/User.dart';

class MainBloc {

  User user;

  MainBloc(){
    if (this.user == null) {
      this.user = User("默认名称", "默认地址");
    }
  }

  ///rxdart 实现的 stream
  var _subject = PublishSubject<User>();

  Observable<User> get stream => _subject.stream;

  change(){
    User u = User("默认名称1", "默认地址1");
    _subject.add(u);
  }

  change2(){
    User u = User("默认名称2", "默认地址2");
    _subject.add(u);
  }

}
