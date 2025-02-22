class FavoritesScreen extends StatelessWidget {
  final List<Recipe> recipes;

  FavoritesScreen({required this.recipes});

  @override
  Widget build(BuildContext context) {
    final favoriteRecipes = recipes.where((recipe) => recipe.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Favorite Recipes')),
      body: ListView.builder(
        itemCount: favoriteRecipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteRecipes[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    recipe: favoriteRecipes[index],
                    onFavoriteToggle: () {
                      // This is a simplification. In a real app, you'd want to update the state properly.
                      favoriteRecipes[index].isFavorite = !favoriteRecipes[index].isFavorite;
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

