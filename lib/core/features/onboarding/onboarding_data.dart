class OnboardingData{
  String imageName;
  String title;
  String ?description;


 OnboardingData({
  required this.imageName,
  required this.title,
   this.description
 });

static List<OnboardingData> OnboardingList=[
  OnboardingData(imageName: "onboarding1", title: "Find Your Next\nFavorite Movie Here", description: "Get access to a huge library of movies\nto suit all tastes. You will surely like it."),
  OnboardingData(imageName: "onboading2", title:"Discover Movies", description: "Explore a vast collection of movies in all\nqualities and genres. Find your next\nfavorite film with ease."),
  OnboardingData(imageName: "onboarding3", title:"Explore All Genres", description: "Discover movies from every genre, in all\navailable qualities. Find something new\nand exciting to watch every day."),
  OnboardingData(imageName: "onboarding4", title:"Create Watchlists", description: "Save movies to your watchlist to keep\ntrack of what you want to watch next.\nEnjoy films in various qualities and\ngenres."),
  OnboardingData(imageName: "onboarding5", title:"Rate, Review, and Learn", description: "Share your thoughts on the movies\nyou've watched. Dive deep into film\ndetails and help others discover great\nmovies with your reviews."),
  OnboardingData(imageName: "onboarding6", title:"Start Watching Now"),
];

}