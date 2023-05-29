import 'package:hive_flutter/hive_flutter.dart';

final _bookmarkBox = Hive.box("bookmarkBox");
List bookmarks = [];

class BookmarkDataBase {
  void loadData() {
    if (_bookmarkBox.get("BOOKMARKS") != null){
      bookmarks = _bookmarkBox.get("BOOKMARKS");
    }
  }

  void updateDataBase()  {
    _bookmarkBox.put("BOOKMARKS", bookmarks);
  }

  void addBookmark(videoItem){
    bookmarks.add(videoItem);
  } 

  void removeBookmark(videoItem){
    bookmarks.remove(videoItem);
  }

  getBookmarks(){
    return bookmarks;
  }
}
