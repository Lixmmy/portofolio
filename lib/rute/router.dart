import 'package:go_router/go_router.dart';
import 'package:portofolio/my_home_page.dart';

GoRouter myRouter() {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const MyHomePage()),
    ],
  );
}
