/**
 *  Create by fazi
 *  Date: 2019-06-27
 */
import 'package:redux/redux.dart';
import "package:flutter_demo/State/Redux2/book.dart";

final BookReducer = combineReducers<Book>([
  TypedReducer<Book, AddBookAction>(_add),
  TypedReducer<Book, UpdateBookAction>(_update),
]);

Book _add(Book book, AddBookAction addAction) {
  addAction.book.name = "三年模拟，五年高考";
  book = addAction.book;
  return book;
}

class AddBookAction {
  Book book;
  AddBookAction(this.book);
}

Book _update(Book book, UpdateBookAction updateAction) {
  updateAction.book.name = "暂无书名";
  book = updateAction.book;
  return book;
}

class UpdateBookAction {
  Book book;
  UpdateBookAction(this.book);
}
