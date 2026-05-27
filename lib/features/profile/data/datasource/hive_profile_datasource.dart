import 'package:timelens/constants.dart';
import 'package:timelens/features/profile/domain/entities/profile_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveProfileDataSource {
  Future<Box<dynamic>> get _box async =>
      await Hive.openBox<dynamic>(kHiveProfilesBox);

  Future<void> cacheProfile(ProfileEntity profile) async {
    final box = await _box;
    await box.put(profile.id, profile);
    // store fetch timestamp alongside
    await box.put('${profile.id}_cached_at', DateTime.now().toIso8601String());
  }

  Future<ProfileEntity?> getCachedProfile(String userId) async {
    final box = await _box;
    return box.get(userId) as ProfileEntity?;
  }

  Future<bool> isCacheStale(String userId, {Duration threshold = const Duration(hours: 24)}) async {
    final box = await _box;
    final raw = box.get('${userId}_cached_at');
    if (raw == null) return true;
    final cachedAt = DateTime.tryParse(raw as String);
    if (cachedAt == null) return true;
    return DateTime.now().difference(cachedAt) > threshold;
  }
}