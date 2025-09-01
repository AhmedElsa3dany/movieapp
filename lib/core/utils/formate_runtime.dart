String formatRuntime(int? runtime) {
  if (runtime == null || runtime == 0) return "N/A";
  final hours = runtime ~/ 60;
  final minutes = runtime % 60;
  return "${hours}h : ${minutes}m";
}
