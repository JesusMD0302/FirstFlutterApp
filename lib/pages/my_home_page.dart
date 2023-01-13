import 'package:flutter/material.dart';
import 'package:my_awesome_name_app/pages/favorites_page.dart';
import 'package:my_awesome_name_app/pages/generator_page.dart';
import 'package:my_awesome_name_app/widgets/data_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  var activeDataCard = false;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      default:
        throw UnimplementedError("No widget for $selectedIndex");
    }

    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: page,
      ),
    );

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            return Column(
              children: [
                Expanded(child: mainArea),
                SafeArea(
                  child: Column(
                    children: [
                      BottomNavigationBar(
                        items: const [
                          BottomNavigationBarItem(
                            icon: Icon(Icons.home),
                            label: "Home",
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.favorite),
                            label: "Favorites",
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.list),
                            label: "Information",
                          )
                        ],
                        currentIndex: selectedIndex,
                        onTap: (value) {
                          if (value == 2) {
                            setState(() {
                              activeDataCard = !activeDataCard;
                            });
                            return;
                          }

                          setState(() {
                            selectedIndex = value;
                          });
                        },
                      ),
                      if (activeDataCard) DataCard()
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Row(
              children: [
                if (activeDataCard)
                  SafeArea(
                    child: DataCard(),
                  ),
                SafeArea(
                  child: NavigationRail(
                    extended: constraints.maxWidth >= 600,
                    destinations: const [
                      NavigationRailDestination(
                        icon: Icon(Icons.home),
                        label: Text("Home"),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.favorite),
                        label: Text("Favorites"),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.list),
                        label: Text("Information"),
                      ),
                    ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) {
                      if (value == 2) {
                        setState(() {
                          activeDataCard = !activeDataCard;
                        });
                        return;
                      }

                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                ),
                Expanded(child: mainArea),
              ],
            );
          }
        },
      ),
    );
  }
}
