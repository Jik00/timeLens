String fileToHttp(String url) {
  if (url.startsWith('file://')) {
    return url.replaceFirst('file://', 'https://');
  }
  if (url.startsWith('//')) {
    return 'https:$url';
  }
  return url;
}