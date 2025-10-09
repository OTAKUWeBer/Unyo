class TextUtils {
  static String parseHtmlToPlainText(String html) {
    if (html.isEmpty) {
      return '';
    }
    String text = html;
    // Remove common HTML tags
    text = text.replaceAll(RegExp(r'<br\s*/?>', caseSensitive: false), '\n');
    text = text.replaceAll(RegExp(r'<p[^>]*>', caseSensitive: false), '');
    text = text.replaceAll(RegExp(r'</p>', caseSensitive: false), '\n\n');
    text = text.replaceAll(RegExp(r'<div[^>]*>', caseSensitive: false), '');
    text = text.replaceAll(RegExp(r'</div>', caseSensitive: false), '\n');
    // Remove inline formatting tags
    text = text.replaceAll(
      RegExp(r'<b>|</b>|<strong>|</strong>', caseSensitive: false),
      '',
    );
    text = text.replaceAll(
      RegExp(r'<i>|</i>|<em>|</em>', caseSensitive: false),
      '',
    );
    text = text.replaceAll(RegExp(r'<u>|</u>', caseSensitive: false), '');
    // Remove any other HTML tags
    text = text.replaceAll(RegExp(r'<[^>]*>'), '');
    // Decode HTML entities
    text = text.replaceAll('&nbsp;', ' ');
    text = text.replaceAll('&amp;', '&');
    text = text.replaceAll('&lt;', '<');
    text = text.replaceAll('&gt;', '>');
    text = text.replaceAll('&quot;', '"');
    text = text.replaceAll('&#39;', "'");
    // Clean up whitespace
    text = text.replaceAll(RegExp(r'\n{3,}'), '\n\n');
    return text.trim();
  }
}