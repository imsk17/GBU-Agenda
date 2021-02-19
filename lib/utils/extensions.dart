extension StringExtension on String {
  String get titleCase =>
      split(" ").map((e) => "${e[0].toUpperCase()}${e.substring(1)}").join(" ");
}
