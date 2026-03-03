String smartTrimMax18(String text, {int maxLength = 18}) {
  if (text.length <= maxLength) return text;

  final trimmed = text.substring(0, maxLength);
  final lastSpace = trimmed.lastIndexOf(' ');

  if (lastSpace == -1) {
    return '$trimmed...';
  }

  return '${trimmed.substring(0, lastSpace)}...';
}