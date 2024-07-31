int calculateReadingTime(String content) {
  // Regular expression to match words
  final wordCount = content.split(RegExp(r'\s+')).length;
  // Average reading speed is 200 words per minute speed = d/t
  const speed = 200;
  final time = wordCount / speed;
  return time.ceil();
}
