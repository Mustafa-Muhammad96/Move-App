import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/widgets/default_elevated_button.dart';
import 'package:movie_app/features/home/data/model/movie.dart';
import 'package:movie_app/l10n/app_localizations.dart';
import 'package:movie_app/tabs/profile/data/storage_helper.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> with TickerProviderStateMixin {
  List<Movie> watchList = [];
  List<Movie> history = [];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadData();
  }

  Future<void> _loadData() async {
    final savedWatchlist = await StorageHelper.getWatchlist();
    final savedHistory = await StorageHelper.getHistory();

    setState(() {
      watchList = savedWatchlist;
      history = savedHistory;
    });
  }

  Widget _buildMovieGrid(List<Movie> movies) {
    if (movies.isEmpty) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(24.0),
          child: Center(
            child: Image.asset(
              "assets/images/search_empty.png",
              height: 200,
              width: 200,
              fit: BoxFit.contain,
            ),
          ),
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsetsDirectional.only(bottom: 16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.7,
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          final movie = movies[index];
          return GestureDetector(
            onTap: () {
              if (movie.id != null) {
                Navigator.pushNamed(
                  context,
                  AppRoutes.movieDetailsScreen,
                  arguments: movie.id,
                ).then((_) => _loadData());
              }
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                movie.mediumCoverImage ?? "",
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          );
        }, childCount: movies.length),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 16.0),
          child: CustomScrollView(
            slivers: [
              // Header + Profile info
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsetsDirectional.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/avatar/avatar1.png',
                            height: screenSize.height * 0.15,
                            width: screenSize.width * 0.33,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'User Name',
                            style: textTheme.labelLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "${watchList.length}",
                            style: textTheme.displaySmall!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Watch List',
                            style: textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "${history.length}",
                            style: textTheme.displaySmall!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'History',
                            style: textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Edit + Exit Buttons
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: DefaultElevatedButton(
                        label: AppLocalizations.of(context)!.editProfile,
                        onPressed: () {
                          Navigator.of(
                            context,
                          ).pushNamed(AppRoutes.updateProfileScreen);
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: DefaultElevatedButton(
                        label: AppLocalizations.of(context)!.exit,
                        backgroundColor: AppColors.red,
                        foregroundColor: AppColors.white,
                        svgAsset: 'assets/icons/exit.svg',
                        svgSize: 16,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 16)),

              // TabBar ثابت مع مسافة أسفلها وindicator أصفر
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    controller: _tabController,
                    indicatorColor: AppColors.primary,
                    indicatorWeight: 3,
                    dividerColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: AppColors.white,
                    unselectedLabelColor: AppColors.white,
                    tabs: [
                      Tab(
                        text: "Watch List",
                        icon: SizedBox(
                          width: 35,
                          height: 35,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: SvgPicture.asset(
                              'assets/icons/watch_list.svg',
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        text: "History",
                        icon: SizedBox(
                          width: 35,
                          height: 35,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: SvgPicture.asset('assets/icons/history.svg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  bottomPadding: 16, // مسافة أسفل التاب
                ),
              ),

              // Grid Content حسب التاب مع Padding
              Builder(
                builder: (context) {
                  return _buildMovieGrid(
                    _tabController.index == 0 ? watchList : history,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Delegate لتثبيت الـ TabBar مع padding أسفلها
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;
  final double bottomPadding;
  _SliverAppBarDelegate(this._tabBar, {this.bottomPadding = 0});

  @override
  double get minExtent => _tabBar.preferredSize.height + bottomPadding;
  @override
  double get maxExtent => _tabBar.preferredSize.height + bottomPadding;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: AppColors.backgroundDark,
      child: Column(
        children: [
          _tabBar,
          SizedBox(height: bottomPadding), // مسافة أسفل التاب
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) => false;
}
