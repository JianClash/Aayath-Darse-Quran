import 'package:hive_flutter/hive_flutter.dart';

final _bookmarkBox = Hive.box("bookmarkBox");
List bookmarks = [];

class BookmarkDataBase {


  void loadData() {
    // _bookmarkBox.put("BOOKMARKS", []);
    if (_bookmarkBox.get("BOOKMARKS") == null){
      print("no data");
    } else {
      bookmarks = _bookmarkBox.get("BOOKMARKS");
      print('load data local: $bookmarks');
    }
  }

  void updateDataBase()  {
    _bookmarkBox.put("BOOKMARKS", bookmarks);
  }

  void updateBookmarks(videoItem){
    bookmarks.add(videoItem);
  } 

  getBookmarks(){
    return bookmarks;
  }
}
