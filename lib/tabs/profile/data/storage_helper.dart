import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:movie_app/features/home/data/model/movie.dart';

class StorageHelper {
  // مفاتيح التخزين
  static const String _watchlistKey = 'watchlist';
  static const String _historyKey = 'history';

  // إعداد: أقصى طول للهستوري (últimos vistos)
  static const int _maxHistoryLength = 20;

  // ---------------------------
  //  WATCHLIST (Bookmark)
  // ---------------------------

  /// جلب كل الأفلام من الـ watchlist
  static Future<List<Movie>> getWatchlist() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_watchlistKey) ?? [];
    try {
      return list.map((s) {
        final map = jsonDecode(s) as Map<String, dynamic>;
        return Movie.fromJson(map);
      }).toList();
    } catch (e) {
      // لو حصل خطأ في ال decode أو fromJson، رجع لائحة فاضية بدل الكراش
      debugPrint('StorageHelper.getWatchlist decode error: $e');
      return [];
    }
  }

  /// هل الفيلم موجود بالفعل في الـ watchlist؟ (بـ id)
  static Future<bool> isMovieInWatchlist(int? movieId) async {
    if (movieId == null) return false;
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_watchlistKey) ?? [];
    return list.any((s) {
      try {
        final map = jsonDecode(s) as Map<String, dynamic>;
        final m = Movie.fromJson(map);
        return m.id == movieId;
      } catch (_) {
        return false;
      }
    });
  }

  /// إضافة فيلم للـ watchlist (يتحقق من التكرار باستخدام id إن وجد)
  static Future<void> addToWatchlist(Movie movie) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_watchlistKey) ?? [];

    // لو عندنا id نتحقق من التكرار
    if (movie.id != null) {
      final exists = list.any((s) {
        try {
          final map = jsonDecode(s) as Map<String, dynamic>;
          final m = Movie.fromJson(map);
          return m.id == movie.id;
        } catch (_) {
          return false;
        }
      });
      if (exists) return; // لو موجود لا نضيف تاني
    }

    // نضيف الـ movie كمجموعة JSON string
    list.add(jsonEncode(movie.toJson()));
    await prefs.setStringList(_watchlistKey, list);
  }

  /// إزالة فيلم من الـ watchlist بواسطة id
  static Future<void> removeFromWatchlist(int? movieId) async {
    if (movieId == null) return;
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_watchlistKey) ?? [];

    list.removeWhere((s) {
      try {
        final map = jsonDecode(s) as Map<String, dynamic>;
        final m = Movie.fromJson(map);
        return m.id == movieId;
      } catch (_) {
        return false;
      }
    });

    await prefs.setStringList(_watchlistKey, list);
  }

  /// مسح الـ watchlist كله
  static Future<void> clearWatchlist() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_watchlistKey);
  }

  // ---------------------------
  //  HISTORY (recently viewed)
  // ---------------------------

  /// جلب الهيستوري كامل (الأحدث أولاً)
  static Future<List<Movie>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_historyKey) ?? [];
    try {
      return list.map((s) {
        final map = jsonDecode(s) as Map<String, dynamic>;
        return Movie.fromJson(map);
      }).toList();
    } catch (e) {
      debugPrint('StorageHelper.getHistory decode error: $e');
      return [];
    }
  }

  /// إضافة فيلم للهيستوري (يحطّه في البداية، ويمنع التكرار، ويحافظ على _maxHistoryLength)
  static Future<void> addToHistory(Movie movie) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_historyKey) ?? [];

    // نشيل أي نسخة قديمة من نفس الفيلم (لو id موجود)
    if (movie.id != null) {
      list.removeWhere((s) {
        try {
          final map = jsonDecode(s) as Map<String, dynamic>;
          final m = Movie.fromJson(map);
          return m.id == movie.id;
        } catch (_) {
          return false;
        }
      });
    }

    // نضيف في البداية (أحدث أول)
    list.insert(0, jsonEncode(movie.toJson()));

    // نحافظ على طول محدود
    if (list.length > _maxHistoryLength) {
      list.removeRange(_maxHistoryLength, list.length);
    }

    await prefs.setStringList(_historyKey, list);
  }

  /// تنظيف الـ history كاملاً
  static Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_historyKey);
  }
}
