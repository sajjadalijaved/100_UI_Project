import 'Screens/movies.dart';
import 'Screens/loading.dart';
import 'Screens/discover.dart';
import 'Screens/tab_pair.dart';
import 'Screens/local_json.dart';
import 'Screens/bottom_bar.dart';
import 'Screens/furnitures.dart';
import 'Screens/helicopter.dart';
import 'Screens/file_picker.dart';
import 'Screens/bottom_navy.dart';
import 'Screens/design_tools.dart';
import 'Screens/github_users.dart';
import 'Screens/light_switch.dart';
import 'Screens/verification.dart';
import 'Screens/shopping_list.dart';
import 'Screens/chart_example.dart';
import 'Screens/learn_flutter.dart';
import 'Screens/advance_drawer.dart';
import 'Screens/fade_animation.dart';
import 'Screens/new_collection.dart';
import 'Screens/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'Screens/animated_container.dart';
import 'Screens/salomon_bottom_bar.dart';
import 'Screens/staggered_gridview.dart';
import 'Screens/searchable_listview.dart';
import 'Screens/register_with_phone.dart';
import 'Screens/vartical_card_pager.dart';
import 'Screens/glassmorphismCreditCard.dart';
import 'package:expense_ui/Screens/stocks.dart';
import 'package:expense_ui/Screens/expense.dart';
import 'package:expense_ui/Screens/tea_page.dart';
import 'package:expense_ui/Screens/travel_ui.dart';
import 'package:expense_ui/Screens/dream_job.dart';
import 'package:expense_ui/Screens/squid_game.dart';
import 'package:expense_ui/Screens/play_video.dart';
import 'package:expense_ui/Screens/dancing_man.dart';
import 'package:expense_ui/Screens/product_card.dart';
import 'package:expense_ui/Screens/no_connection.dart';
import 'Screens/ExerciseScreens/exercise_home_page.dart';
import 'package:expense_ui/Screens/odometer_example.dart';
import 'package:expense_ui/Screens/skeleton_loading.dart';
import 'package:expense_ui/Screens/flutter_stack_card/src/flutter_stack_card_home.dart';

void main() => runApp(const TestPage());

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int selectIndex = 0;
  PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              selectIndex = index;
            });
          },
          children: const [
            TravelUIPage(),
            ExpensesPage(),
            DesignTools(),
            DancingMan(),
            DiscoverPage(),
            DreamJob(),
            FadeAnimation(),
            HelicopterPage(),
            LightSwitch(),
            LearnFlutter(),
            LoadingExample(),
            MoviesPage(),
            NewCollection(),
            PlayVideoExample(),
            ProductCard(),
            SkeletonLoading(),
            SalomonBottomNavBar(),
            StocksPage(),
            TeaPage(),
            StaggeredGridViewExample(),
            VerticalCardPagerExample(),
            ExerciseHomePage(),
            AdvanceDrawerPage(),
            Furnitures(),
            CustomBottomNavigationBar(),
            TabBarAndTabViews(),
            GlassmorphismCreditCard(),
            LocalJsonPage(),
            SearchAbleListPage(),
            FilePickPage(),
            ShoppingListPage(),
            StackCardHomePage(),
            HomePage(),
            BottomNavyBarExample(),
            BouncingWidgetExample(),
            ChartExample(),
            GithubUsers(),
            SquidGame(),
            NoConnection(),
            OdometerExample(),
            RegisterWithPhoneNumber(),
            Verificatoin(),
          ],
        ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        color: const Color(0xff8186F0),
        child: const Center(child: Box()),
      ),
    );
  }
}
