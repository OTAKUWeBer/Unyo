import 'package:unyo/core/enums/service.dart';
import 'package:unyo/domain/entities/user.dart' show User;

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
    text = text.replaceAll(RegExp(r'<b>|</b>|<strong>|</strong>', caseSensitive: false), '');
    text = text.replaceAll(RegExp(r'<i>|</i>|<em>|</em>', caseSensitive: false), '');
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

  static String extractYearFromStartDate(String startDate, User loggedUser) {
    switch (loggedUser.settings.service) {
      case Service.anilist:
        return startDate.split("/").length > 1 ? startDate.split("/")[2] : "";
      case Service.mal:
        throw UnimplementedError();
      case Service.kitsu:
        throw UnimplementedError();
      case Service.shikimori:
        throw UnimplementedError();
      case Service.simkl:
        throw UnimplementedError();
    }
  }

  static List<String> upperCaseFirstCharacter(List<String> list) {
    return list
        .map(
          (strElement) =>
              strElement.isNotEmpty ? strElement[0].toUpperCase() + strElement.substring(1) : strElement,
        )
        .toList();
  }
}
