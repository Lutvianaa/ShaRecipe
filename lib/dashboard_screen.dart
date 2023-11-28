import 'package:flutter/material.dart';
import 'recipe_detail_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    ExploreScreen(),
    SavedScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    bool shouldShowSearchIcon = _currentIndex == 0; // Menentukan kapan menampilkan ikon pencarian

    return Scaffold(
      appBar: _currentIndex == 0 // Menampilkan appbar hanya di HomeScreen
          ? AppBar(
        backgroundColor: const Color(0xFFFFE4C4),
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          if (shouldShowSearchIcon) // Hanya menampilkan ikon search jika shouldShowSearchIcon adalah true
            IconButton(
              icon: Icon(Icons.search, color: Colors.brown),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExploreScreen()),
                );
              },
            ),
        ],
      )
          : null, // Menghilangkan AppBar jika bukan HomeScreen
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        backgroundColor: const Color(0xFFFFE4C4),
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
      ),
      backgroundColor: const Color(0xFFFFE4C4),
    );
  }
}


class HomeScreen extends StatelessWidget {
  final List<Recipe> recommendations = [
    Recipe(
      name: "Farfalle with Pesto, Goat Cheese and Grape Tomatoes",
      imagePath: "assets/pesto-pasta.jpg",
      rating: 4,
      ingredients: '''
        1 lb. farfalle (bow-tie) pasta
        1/2 c. walnuts
        1/4 c. extra-virgin olive oil
        2 c. fresh basil leaves
        2 small cloves garlic
        1/2 tsp. crushed red pepper
        kosher salt
        4 oz. fresh goat cheese
        1 pt grape or cherry tomatoes
      ''',
      directions: '''
        Step 1
        Cook the pasta according to package directions. Reserve 1/2 cup of the pasta water, drain the pasta and return it to the pot.
        
        Step 2
        Meanwhile, using a food processor or blender, pulse the walnuts, oil, basil, garlic, crushed pepper, and 1/2 tsp salt until finely chopped but not totally puréed.
        
        Step 3
        Add the basil mixture, half the goat cheese, and reserved pasta water to the pot; toss to coat. Fold in the tomatoes and sprinkle with the remaining goat cheese before serving.
      ''',
    ),
    Recipe(
      name: "Apple Pancakes",
      imagePath: "assets/apple-pancakes.jpg",
      rating: 4,
      ingredients: '''
    1 1/3 c. all-purpose flour
    1 1/2 tsp. baking powder
    1 1/2 tsp. ground cinnamon, divided
    1 tbsp. granulated sugar
    1/2 tsp. kosher salt
    4 tbsp. butter, divided, plus more for cooking
    1 large egg, separated
    1 tsp. pure vanilla extract
    1 1/4 c. milk
    4 large apples, peeled, cored, and finely chopped (about 5 to 6 cups)
    1/2 c. dark or light brown sugar
  ''',
      directions: '''
    Step 1
    Mix flour, baking powder, 1 teaspoon cinnamon, sugar, and salt in a medium bowl. Melt 2 tablespoons of the butter. In a large bowl, whisk to combine egg yolk, vanilla, milk, and melted butter. Gently fold dry ingredients into wet ingredients until just combined, then fold in 1½  cups of chopped apple.
    
    Step 2
    In another medium bowl, using a hand mixer, beat egg white until stiff peaks form. Fold egg white into batter gently with a rubber spatula until just combined.
    
    Step 3
    Make apple topping: in a small saucepan over medium heat, melt remaining 2 tablespoons butter. Add remaining apples, brown sugar, remaining 1/2 teaspoon cinnamon, and a 1/4 cup water. Cook, stirring occasionally, until apples have softened and mixture is jammy, 10 to 15 minutes.
    
    Step 4
    In a large skillet over medium heat, melt 1 tablespoon butter. Pour about 1/4 cup pancake batter into pan. When little bubbles appear, about 1 to 2 minutes, flip and continue cooking until both sides are lightly golden. Repeat with remaining batter, adding more butter to pan as needed. Serve pancakes topped with apple mixture.
  ''',
    ),
    Recipe(
      name: "Tuscan Sun Salmon Salad",
      imagePath: "assets/salmon-salad.jpg",
      rating: 4,
      ingredients: '''
    1 lemon
    1/4 c. water
    4 skinless salmon fillets
    1/4 tsp. salt
    1/4 tsp. freshly ground black pepper
    5 oz. baby arugula
    1/2 c. roasted red peppers
    1/2 c. Kalamata olives
    1 tbsp. balsamic vinegar
    2 tsp. extra-virgin olive oil
    Focaccia
  ''',
      directions: '''
    Step 1
    Arrange thin slices of lemon in a single layer in an 8- by 8-inch glass baking dish.
    
    Step 2
    Add 1/4 cup water. Place thawed salmon on top; sprinkle with 1/4 teaspoon salt and 1/4 teaspoon freshly ground black pepper.
    
    Step 3
    Cover with vented plastic wrap and microwave on high for 8 minutes or until fish just turns opaque throughout. Meanwhile, in a large bowl, toss baby arugula, roasted red peppers, Kalamata olives, balsamic vinegar, and extra-virgin olive oil.
    
    Step 4
    Divide among 4 plates and top with salmon. Serve with focaccia.
  ''',
    ),
    // ... (tambahkan resep lainnya di sini)
  ];

  final List<Recipe> trendingRecipes = [
    Recipe(
      name: "Tuscan Sun Salmon Salad",
      imagePath: "assets/salmon-salad.jpg",
      rating: 4,
      ingredients: '''
    1 lemon
    1/4 c. water
    4 skinless salmon fillets
    1/4 tsp. salt
    1/4 tsp. freshly ground black pepper
    5 oz. baby arugula
    1/2 c. roasted red peppers
    1/2 c. Kalamata olives
    1 tbsp. balsamic vinegar
    2 tsp. extra-virgin olive oil
    Focaccia
  ''',
      directions: '''
    Step 1
    Arrange thin slices of lemon in a single layer in an 8- by 8-inch glass baking dish.
    
    Step 2
    Add 1/4 cup water. Place thawed salmon on top; sprinkle with 1/4 teaspoon salt and 1/4 teaspoon freshly ground black pepper.
    
    Step 3
    Cover with vented plastic wrap and microwave on high for 8 minutes or until fish just turns opaque throughout. Meanwhile, in a large bowl, toss baby arugula, roasted red peppers, Kalamata olives, balsamic vinegar, and extra-virgin olive oil.
    
    Step 4
    Divide among 4 plates and top with salmon. Serve with focaccia.
  ''',
    ),
    Recipe(
      name: "Apple Pancakes",
      imagePath: "assets/apple-pancakes.jpg",
      rating: 4,
      ingredients: '''
    1 1/3 c. all-purpose flour
    1 1/2 tsp. baking powder
    1 1/2 tsp. ground cinnamon, divided
    1 tbsp. granulated sugar
    1/2 tsp. kosher salt
    4 tbsp. butter, divided, plus more for cooking
    1 large egg, separated
    1 tsp. pure vanilla extract
    1 1/4 c. milk
    4 large apples, peeled, cored, and finely chopped (about 5 to 6 cups)
    1/2 c. dark or light brown sugar
  ''',
      directions: '''
    Step 1
    Mix flour, baking powder, 1 teaspoon cinnamon, sugar, and salt in a medium bowl. Melt 2 tablespoons of the butter. In a large bowl, whisk to combine egg yolk, vanilla, milk, and melted butter. Gently fold dry ingredients into wet ingredients until just combined, then fold in 1½  cups of chopped apple.
    
    Step 2
    In another medium bowl, using a hand mixer, beat egg white until stiff peaks form. Fold egg white into batter gently with a rubber spatula until just combined.
    
    Step 3
    Make apple topping: in a small saucepan over medium heat, melt remaining 2 tablespoons butter. Add remaining apples, brown sugar, remaining 1/2 teaspoon cinnamon, and a 1/4 cup water. Cook, stirring occasionally, until apples have softened and mixture is jammy, 10 to 15 minutes.
    
    Step 4
    In a large skillet over medium heat, melt 1 tablespoon butter. Pour about 1/4 cup pancake batter into pan. When little bubbles appear, about 1 to 2 minutes, flip and continue cooking until both sides are lightly golden. Repeat with remaining batter, adding more butter to pan as needed. Serve pancakes topped with apple mixture.
  ''',
    ),
    Recipe(
      name: "Farfalle with Pesto, Goat Cheese and Grape Tomatoes",
      imagePath: "assets/pesto-pasta.jpg",
      rating: 4,
      ingredients: '''
        1 lb. farfalle (bow-tie) pasta
        1/2 c. walnuts
        1/4 c. extra-virgin olive oil
        2 c. fresh basil leaves
        2 small cloves garlic
        1/2 tsp. crushed red pepper
        kosher salt
        4 oz. fresh goat cheese
        1 pt grape or cherry tomatoes
      ''',
      directions: '''
        Step 1
        Cook the pasta according to package directions. Reserve 1/2 cup of the pasta water, drain the pasta and return it to the pot.
        
        Step 2
        Meanwhile, using a food processor or blender, pulse the walnuts, oil, basil, garlic, crushed pepper, and 1/2 tsp salt until finely chopped but not totally puréed.
        
        Step 3
        Add the basil mixture, half the goat cheese, and reserved pasta water to the pot; toss to coat. Fold in the tomatoes and sprinkle with the remaining goat cheese before serving.
      ''',
    ),
    // ... (tambahkan resep lainnya di sini)
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        Text(
          'Recommendation For You',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: recommendations.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 180,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(12.0),
                        ),
                        child: Image.asset(
                          recommendations[index].imagePath,
                          height: 120,
                          width: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          recommendations[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0), // Tambahkan padding horizontal di sini
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      RecipeDetailScreen(recipe: recommendations[index]),
                                ),
                              );
                            },
                            child: Text('Read More'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Trending Recipe',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Column(
          children: trendingRecipes.map((recipe) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      recipe.imagePath,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recipe.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: List.generate(
                            5,
                                (index) => Icon(
                              index < recipe.rating
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class SavedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Saved Screen'),
    );
  }
}


class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Menghilangkan bayangan di appbar
        titleSpacing: 0,
        title: Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: screenWidth * 0.5, // Menggunakan 80% dari lebar layar
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search Here',
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Aksi saat icon search ditekan
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.trending_up_sharp),
            title: Text('Menu 1'),
          ),
          ListTile(
            leading: Icon(Icons.trending_up_sharp),
            title: Text('Menu 1'),
          ),
          ListTile(
            leading: Icon(Icons.trending_up_sharp),
            title: Text('Menu 1'),
          ),
          // Tambahkan ListTile lainnya
        ],
      ),
    );
  }
}


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Screen'),
    );
  }
}

class Recipe {
  final String name;
  final String imagePath;
  final int rating;
  final String ingredients; // Tambahkan properti ingredients
  final String directions; // Tambahkan properti directions

  Recipe({
    required this.name,
    required this.imagePath,
    required this.rating,
    required this.ingredients,
    required this.directions,
  });
}