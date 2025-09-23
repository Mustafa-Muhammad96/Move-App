import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/features/home/data/model/movie.dart';
import 'package:movie_app/tabs/profile/data/storage_helper.dart';

class MovieDetailsAppBar extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback? onBack;
  final double iconSize;
  final Movie movie; // 🟢 Movie كامل

  const MovieDetailsAppBar({
    super.key,
    this.onBack,
    this.iconSize = 22.0,
    required this.movie,
  });

  @override
  State<MovieDetailsAppBar> createState() => _MovieDetailsAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MovieDetailsAppBarState extends State<MovieDetailsAppBar> {
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    _checkIfSaved();

    // 🟢 أول ما تفتح تفاصيل الفيلم -> ضيفه في History
    StorageHelper.addToHistory(widget.movie);
  }

  // 🟢 تحقق إذا الفيلم موجود في Watchlist
  Future<void> _checkIfSaved() async {
    final saved = await StorageHelper.isMovieInWatchlist(widget.movie.id);
    setState(() {
      isSaved = saved;
    });
  }

  // 🟢 إضافة أو إزالة الفيلم من Watchlist
  Future<void> _toggleSave() async {
    if (isSaved) {
      await StorageHelper.removeFromWatchlist(widget.movie.id);
    } else {
      await StorageHelper.addToWatchlist(widget.movie);
    }
    setState(() {
      isSaved = !isSaved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: widget.onBack ?? () => Navigator.of(context).maybePop(),
        icon: SvgPicture.asset(
          'assets/icons/arrowBack.svg',
          width: widget.iconSize,
          height: widget.iconSize,
          colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
        ),
        splashRadius: 20,
        tooltip: 'Back',
      ),
      actions: [
        IconButton(
          onPressed: _toggleSave,
          icon: Icon(
            isSaved ? Icons.bookmark : Icons.bookmark_border,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
