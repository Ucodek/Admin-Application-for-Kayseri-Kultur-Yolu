// ignore_for_file: file_names

abstract class IStorable<T> {
  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
  //getColumns
}
