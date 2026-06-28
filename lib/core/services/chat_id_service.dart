import 'package:timelens/constants.dart';
import 'package:timelens/core/services/shared_preferences_singleton.dart';

class ChatIdService {

  Future<String> getOrCreateChatId() async {
    _resetIfNewDay();

    String? chatId = Prefs.getString(kActiveChatKey);

    if (chatId == null) {
      chatId = DateTime.now().millisecondsSinceEpoch.toString();
      await Prefs.setString(kActiveChatKey, chatId);
    }

    return chatId;
  }

  Future<void> _resetIfNewDay() async {
    final String? lastResetDate = Prefs.getString(kLastResetDateKey);
    final String today = _todayDateString();

    if (lastResetDate != today) {
      await clearActiveChatId();
      await Prefs.setString(kLastResetDateKey, today);
    }
  }

  String _todayDateString() {
    final now = DateTime.now();
    return '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
  }

  Future<void> saveActiveChatId(String chatId) async {
    await Prefs.setString(kActiveChatKey, chatId);
  }

  Future<void> clearActiveChatId() async {
    await Prefs.remove(kActiveChatKey);
  }
}