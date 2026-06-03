import 'package:go_router/go_router.dart';

// Importaciones de tus pantallas (ajusta los paths según el nombre de tu proyecto)
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/admin_dashboard/presentation/screens/admin_home_screen.dart';
import '../../features/admin_dashboard/presentation/screens/monitoring_dashboard_screen.dart';
import '../../features/admin_dashboard/presentation/screens/manage_reports_screen.dart';
import '../../features/user_reports/presentation/screens/user_home_screen.dart';
import '../../features/user_reports/presentation/screens/leak_report_screen.dart';
import '../../features/user_reports/presentation/screens/report_history_screen.dart';
import '../../features/user_reports/presentation/screens/notifications_screen.dart';
import '../../features/user_reports/presentation/screens/help_center_screen.dart';
import '../../features/user_reports/presentation/screens/rate_app_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/login', // La app siempre iniciará en el Login
    routes: [
      // ==========================================
      // RUTAS DE AUTENTICACIÓN (PÚBLICAS)
      // ==========================================
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),

      // ==========================================
      // RUTAS DEL USUARIO COMÚN
      // ==========================================
      // 'user_home_screen' actuará como el contenedor principal (con BottomNavigationBar)
      GoRoute(
        path: '/user-home',
        builder: (context, state) => const UserHomeScreen(),
        routes: [
          GoRoute(
            path: 'report-leak',
            builder: (context, state) => const LeakReportScreen(),
          ),
          GoRoute(
            path: 'my-reports',
            builder: (context, state) => const ReportHistoryScreen(),
          ),
          GoRoute(
            path: 'notifications',
            builder: (context, state) => const NotificationsScreen(),
          ),
          GoRoute(
            path: 'help',
            builder: (context, state) => const HelpCenterScreen(),
          ),
          GoRoute(
            path: 'rate',
            builder: (context, state) => const RateAppScreen(),
          ),
        ],
      ),

      // ==========================================
      // RUTAS DEL ADMINISTRADOR
      // ==========================================
      // 'admin_home_screen' actuará como el contenedor principal del Admin
      GoRoute(
        path: '/admin-home',
        builder: (context, state) => const AdminHomeScreen(),
        routes: [
          GoRoute(
            path: 'dashboard',
            builder: (context, state) => const MonitoringDashboardScreen(),
          ),
          GoRoute(
            path: 'manage-reports',
            builder: (context, state) => const ManageReportsScreen(),
          ),
        ],
      ),
    ],

    // TODO: Aquí implementaremos más adelante el 'redirect' para proteger las rutas basadas en el rol.
  );
}

// flutter pub add go_router
// github se me olvida xD
// openStreetMap
