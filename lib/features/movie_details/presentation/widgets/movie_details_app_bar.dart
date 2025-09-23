import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/features/movie_details/data/data_sources/shared_preferences/watch_list.dart';

class MovieDetailsAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  final VoidCallback? onBack;
  final VoidCallback? onSave;
  final String backSvgPath;
  final String saveSvgPath;
  final double iconSize;
  final String movieId;

  const MovieDetailsAppBar({
    super.key,
    this.onBack,
    this.onSave,
    this.backSvgPath = 'assets/icons/arrowBack.svg',
    this.saveSvgPath = 'assets/icons/save.svg',
    this.iconSize = 22.0, required this.movieId,
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
  }

  Future<void> _checkIfSaved() async {
    final saved = await WatchlistService.isMovieSaved(widget.movieId);
    setState(() {
      isSaved = saved;
    });
  }

  Future<void> _toggleSave() async {
    if (isSaved) {
      await WatchlistService.removeMovie(widget.movieId);
    } else {
      await WatchlistService.addMovie(widget.movieId);
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
          widget.backSvgPath,
          width: widget.iconSize,
          height: widget.iconSize,
          colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          semanticsLabel: 'Back',
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
