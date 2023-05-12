import 'package:basic_flutter/res/dimens.dart';
import 'package:basic_flutter/src/common/extensions/context_ext.dart';
import 'package:basic_flutter/src/ui/components/navigation_drawer_content.dart';
import 'package:basic_flutter/src/ui/components/navigation_rail_content.dart';
import 'package:flutter/material.dart';

import 'botttom_app_bar_content.dart';
import 'nested_navigation_content.dart';

class NavigationContent extends StatefulWidget {
  const NavigationContent({Key? key}) : super(key: key);

  @override
  State<NavigationContent> createState() => _NavigationContentState();
}

class _NavigationContentState extends State<NavigationContent> {
  int currentNavigationPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(),
          Text("BottomAppBar", style: Theme.of(context).textTheme.titleMedium),
          ElevatedButton(
              onPressed: () {
                context.navigateToCustomScreen(builder: (c) {
                  return const BottomAppBarSample1();
                });
              },
              child: const Text("BottomAppBar 1")),
          ElevatedButton(
              onPressed: () {
                context.navigateToCustomScreen(builder: (c) {
                  return const BottomAppBarSample2();
                });
              },
              child: const Text("BottomAppBar 2")),
          gh8x2,
          const Divider(),
          Text("Navigation Bar",
              style: Theme.of(context).textTheme.titleMedium),
          gh8x2,
          SizedBox(
            height: 100,
            child: <Widget>[
              Container(
                color: Colors.red,
                alignment: Alignment.center,
                child: const Text('Page 1'),
              ),
              Container(
                color: Colors.green,
                alignment: Alignment.center,
                child: const Text('Page 2'),
              ),
              Container(
                color: Colors.blue,
                alignment: Alignment.center,
                child: const Text('Page 3'),
              ),
            ][currentNavigationPageIndex],
          ),
          NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                currentNavigationPageIndex = index;
              });
            },
            selectedIndex: currentNavigationPageIndex,
            destinations: const <Widget>[
              NavigationDestination(
                icon: Icon(Icons.explore),
                label: 'Explore',
              ),
              NavigationDestination(
                icon: Icon(Icons.commute),
                label: 'Commute',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.bookmark),
                icon: Icon(Icons.bookmark_border),
                label: 'Saved',
              ),
            ],
          ),
          gh8x2,
          ElevatedButton(
              onPressed: () {
                context.navigateToCustomScreen(builder: (c) {
                  return const NestedNavHome();
                });
              },
              child: const Text("Nested Navigation")),
          gh8x2,
          ElevatedButton(
              onPressed: () {
                context.navigateToCustomScreen(builder: (c) {
                  return const NavigationDrawerSample();
                });
              },
              child: const Text("Navigation Drawer & Navigation Rail")),
          gh8x2,
          ElevatedButton(
              onPressed: () {
                context.navigateToCustomScreen(builder: (c) {
                  return const NavigationRailSample();
                });
              },
              child: const Text("Navigation Rail")),
          const Divider(),
          DefaultTabController(
            initialIndex: 1,
            length: 3,
            child: SizedBox(
              height: 200,
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('TabBar with DefaultTabController]'),
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  bottom: const TabBar(
                    tabs: <Widget>[
                      Tab(
                        icon: Icon(Icons.cloud_outlined),
                      ),
                      Tab(
                        icon: Icon(Icons.beach_access_sharp),
                      ),
                      Tab(
                        icon: Icon(Icons.brightness_5_sharp),
                      ),
                    ],
                  ),
                ),
                body: const TabBarView(
                  children: <Widget>[
                    Center(
                      child: Text("It's cloudy here"),
                    ),
                    Center(
                      child: Text("It's rainy here"),
                    ),
                    Center(
                      child: Text("It's sunny here"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(),
          const TabBarSample2(),
          const Divider(),
          const NestedTabBarSample(),
          const Divider(),
          const TopAppBars(),
          const Divider(),
          const AppBarSample(),
          gh8x2,
          const AppBarSample2(),
          gh8x2,
          const SliverAppBarSample(),
          gh8x2,
        ],
      ),
    );
  }
}

class TabBarSample2 extends StatefulWidget {
  const TabBarSample2({super.key});

  @override
  State<TabBarSample2> createState() => _TabBarSample2State();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
class _TabBarSample2State extends State<TabBarSample2>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar with TabController'),
          automaticallyImplyLeading: false,
          centerTitle: true,
          bottom: TabBar(
            controller: _tabController,
            tabs: const <Widget>[
              Tab(
                icon: Icon(Icons.cloud_outlined),
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const <Widget>[
            Center(
              child: Text("It's cloudy here"),
            ),
            Center(
              child: Text("It's rainy here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
      ),
    );
  }
}

class NestedTabBarSample extends StatelessWidget {
  const NestedTabBarSample({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Primary and secondary TabBar'),
            automaticallyImplyLeading: false,
            centerTitle: true,
            bottom: const TabBar(
              dividerColor: Colors.transparent,
              tabs: <Widget>[
                Tab(
                  text: 'Flights',
                  icon: Icon(Icons.flight),
                ),
                Tab(
                  text: 'Trips',
                  icon: Icon(Icons.luggage),
                ),
                Tab(
                  text: 'Explore',
                  icon: Icon(Icons.explore),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              NestedTabBar('Flights'),
              NestedTabBar('Trips'),
              NestedTabBar('Explore'),
            ],
          ),
        ),
      ),
    );
  }
}

class NestedTabBar extends StatefulWidget {
  const NestedTabBar(this.outerTab, {super.key});

  final String outerTab;

  @override
  State<NestedTabBar> createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar.secondary(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(text: 'Overview'),
            Tab(text: 'Specifications'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Card(
                margin: const EdgeInsets.all(16.0),
                child: Center(child: Text('${widget.outerTab}: Overview tab')),
              ),
              Card(
                margin: const EdgeInsets.all(16.0),
                child: Center(
                    child: Text('${widget.outerTab}: Specifications tab')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TopAppBars extends StatelessWidget {
  const TopAppBars({super.key});

  static final actions = [
    IconButton(icon: const Icon(Icons.attach_file), onPressed: () {}),
    IconButton(icon: const Icon(Icons.event), onPressed: () {}),
    IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Top app bars", style: Theme.of(context).textTheme.titleMedium),
        AppBar(
          title: const Text('Center-aligned'),
          leading: const BackButton(),
          actions: [
            IconButton(
              iconSize: 32,
              icon: const Icon(Icons.account_circle_outlined),
              onPressed: () {},
            ),
          ],
          centerTitle: true,
        ),
        gh8x2,
        AppBar(
          title: const Text('Small'),
          leading: const BackButton(),
          actions: actions,
          centerTitle: false,
        ),
        gh8x2,
        SizedBox(
          height: 100,
          child: CustomScrollView(
            slivers: [
              SliverAppBar.medium(
                title: const Text('Medium'),
                leading: const BackButton(),
                actions: actions,
              ),
              const SliverFillRemaining(),
            ],
          ),
        ),
        gh8x2,
        SizedBox(
          height: 130,
          child: CustomScrollView(
            slivers: [
              SliverAppBar.large(
                title: const Text('Large'),
                leading: const BackButton(),
                actions: actions,
              ),
              const SliverFillRemaining(),
            ],
          ),
        ),
      ],
    );
  }
}

final List<int> _items = List<int>.generate(51, (int index) => index);

/// Ref: https://api.flutter.dev/flutter/material/AppBar-class.html
class AppBarSample extends StatefulWidget {
  const AppBarSample({super.key});

  @override
  State<AppBarSample> createState() => _AppBarSampleState();
}

class _AppBarSampleState extends State<AppBarSample> {
  bool shadowColor = false;
  double? scrolledUnderElevation;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

    return SizedBox(
      //theme: ThemeData(useMaterial3: false),
      height: 400,
      child: MaterialApp(
        //height: 400,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          colorSchemeSeed: const Color(0xff6750a4),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('AppBar Sample 1'),
            scrolledUnderElevation: scrolledUnderElevation,
            shadowColor:
                shadowColor ? Theme.of(context).colorScheme.shadow : null,
          ),
          body: SafeArea(
            child: GridView.builder(
              itemCount: _items.length,
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Center(
                    child: Text(
                      'Scroll to see the Appbar in effect.',
                      style: Theme.of(context).textTheme.labelLarge,
                      textAlign: TextAlign.center,
                    ),
                  );
                }
                return Container(
                  alignment: Alignment.center,
                  // tileColor: _items[index].isOdd ? oddItemColor : evenItemColor,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: _items[index].isOdd ? oddItemColor : evenItemColor,
                  ),
                  child: Text('Item $index'),
                );
              },
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: OverflowBar(
                overflowAlignment: OverflowBarAlignment.center,
                alignment: MainAxisAlignment.center,
                overflowSpacing: 5.0,
                children: <Widget>[
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        shadowColor = !shadowColor;
                      });
                    },
                    icon: Icon(
                      shadowColor ? Icons.visibility_off : Icons.visibility,
                    ),
                    label: const Text('shadow color'),
                  ),
                  const SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {
                      if (scrolledUnderElevation == null) {
                        setState(() {
                          // Default elevation is 3.0, increment by 1.0.
                          scrolledUnderElevation = 4.0;
                        });
                      } else {
                        setState(() {
                          scrolledUnderElevation =
                              scrolledUnderElevation! + 1.0;
                        });
                      }
                    },
                    child: Text(
                      'scrolledUnderElevation: ${scrolledUnderElevation ?? 'default'}',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<String> titles = <String>[
  'Cloud',
  'Beach',
  'Sunny',
];

class AppBarSample2 extends StatelessWidget {
  const AppBarSample2({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    const int tabsCount = 3;

    return SizedBox(
      height: 300,
      child: DefaultTabController(
        initialIndex: 1,
        length: tabsCount,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('AppBar Sample 2'),
            automaticallyImplyLeading: false,
            // This check specifies which nested Scrollable's scroll notification
            // should be listened to.
            //
            // When `ThemeData.useMaterial3` is true and scroll view has
            // scrolled underneath the app bar, this updates the app bar
            // background color and elevation.
            //
            // This sets `notification.depth == 1` to listen to the scroll
            // notification from the nested `ListView.builder`.
            notificationPredicate: (ScrollNotification notification) {
              return notification.depth == 1;
            },
            // The elevation value of the app bar when scroll view has
            // scrolled underneath the app bar.
            scrolledUnderElevation: 4.0,
            shadowColor: Theme.of(context).shadowColor,
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: const Icon(Icons.cloud_outlined),
                  text: titles[0],
                ),
                Tab(
                  icon: const Icon(Icons.beach_access_sharp),
                  text: titles[1],
                ),
                Tab(
                  icon: const Icon(Icons.brightness_5_sharp),
                  text: titles[2],
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ListView.builder(
                itemCount: 25,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    tileColor: index.isOdd ? oddItemColor : evenItemColor,
                    title: Text('${titles[0]} $index'),
                  );
                },
              ),
              ListView.builder(
                itemCount: 25,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    tileColor: index.isOdd ? oddItemColor : evenItemColor,
                    title: Text('${titles[1]} $index'),
                  );
                },
              ),
              ListView.builder(
                itemCount: 25,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    tileColor: index.isOdd ? oddItemColor : evenItemColor,
                    title: Text('${titles[2]} $index'),
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

class SliverAppBarSample extends StatefulWidget {
  const SliverAppBarSample({super.key});

  @override
  State<SliverAppBarSample> createState() => _SliverAppBarSampleState();
}

class _SliverAppBarSampleState extends State<SliverAppBarSample> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;

// [SliverAppBar]s are typically used in [CustomScrollView.slivers], which in
// turn can be placed in a [Scaffold.body].
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          colorSchemeSeed: const Color(0xff6750a4),
        ),
        home: Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: _pinned,
                snap: _snap,
                floating: _floating,
                expandedHeight: 160.0,
                flexibleSpace: const FlexibleSpaceBar(
                  title: Text('SliverAppBar'),
                  background: FlutterLogo(),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                  child: Center(
                    child: Text('Scroll to see the SliverAppBar in effect.'),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      color: index.isOdd ? Colors.white : Colors.black12,
                      height: 100.0,
                      child: Center(
                        child: Text('$index', textScaleFactor: 5),
                      ),
                    );
                  },
                  childCount: 20,
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: OverflowBar(
                overflowAlignment: OverflowBarAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('pinned'),
                      Switch(
                        onChanged: (bool val) {
                          setState(() {
                            _pinned = val;
                          });
                        },
                        value: _pinned,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('snap'),
                      Switch(
                        onChanged: (bool val) {
                          setState(() {
                            _snap = val;
                            // Snapping only applies when the app bar is floating.
                            _floating = _floating || _snap;
                          });
                        },
                        value: _snap,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('floating'),
                      Switch(
                        onChanged: (bool val) {
                          setState(() {
                            _floating = val;
                            _snap = _snap && _floating;
                          });
                        },
                        value: _floating,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
