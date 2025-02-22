class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Recipe> recipes = [
    // ... (same recipes as before)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recipe Book')),
      body: Column(
        children: [
          ElevatedButton(
            child: Text('View Favorites'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(recipes: recipes),
                ),
              );
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(recipes[index].name),
                  trailing: Icon(
                    recipes[index].isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: recipes[index].isFavorite ? Colors.red : null,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          recipe: recipes[index],
                          onFavoriteToggle: () {
                            setState(() {
                              recipes[index].isFavorite = !recipes[index].isFavorite;
                            });
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

