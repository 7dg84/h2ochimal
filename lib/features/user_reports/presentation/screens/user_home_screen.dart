// La pantalla contenedora con el menú de navegación
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Clave para poder abrir el Drawer desde el botón central
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      // AppBar transparente con el icono de menú
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white, size: 30),
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
        ),
      ),
      // Agregamos el menú lateral que definiremos abajo
      drawer: const _CustomNavigationDrawer(isAdmin: false),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo de la gota (Como en tu imagen)
            const Icon(
              Icons.water_drop_rounded,
              size: 150,
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            const Text(
              'H2O Chimal',
              style: TextStyle(
                fontSize: 42,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
            const Text(
              'Cuidamos el agua de nuestra nación',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 80),

            // EL BOTÓN DE TU CAPTURA
            ElevatedButton(
              onPressed: () => scaffoldKey.currentState?.openDrawer(),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.notes_rounded), // Icono similar al de tu imagen
                  SizedBox(width: 12),
                  Text('EXPLORAR MENÚ'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// COMPONENTE DEL MENÚ LATERAL (ESTILIZADO AZUL)
class _CustomNavigationDrawer extends StatelessWidget {
  final bool isAdmin;
  const _CustomNavigationDrawer({required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF1E88E5), // Mismo azul del fondo
      child: Column(
        children: [
          // Encabezado del Menú
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.black12),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.account_circle,
                    size: 60,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    isAdmin ? 'MODO ADMINISTRADOR' : 'MENÚ DE USUARIO',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Opciones dinámicas según el rol
          if (!isAdmin) ...[
            _DrawerItem(
              icon: Icons.water_damage_outlined,
              label: 'Reporte de Fugas',
              onTap: () => context.push('/user-home/report-leak'),
            ),
            _DrawerItem(
              icon: Icons.assignment_outlined,
              label: 'Consulta de Reportes',
              onTap: () => context.push('/user-home/my-reports'),
            ),
            _DrawerItem(
              icon: Icons.notifications_none_rounded,
              label: 'Notificaciones',
              onTap: () => context.push('/user-home/notifications'),
            ),
            _DrawerItem(
              icon: Icons.help_outline_rounded,
              label: 'Centro de Ayuda',
              onTap: () => context.push('/user-home/help'),
            ),
            _DrawerItem(
              icon: Icons.star_outline_rounded,
              label: 'Calificar App',
              onTap: () => context.push('/user-home/rate'),
            ),
          ] else ...[
            _DrawerItem(
              icon: Icons.dashboard_customize_outlined,
              label: 'Dashboard Monitoreo',
              onTap: () => context.push('/admin-home/dashboard'),
            ),
            _DrawerItem(
              icon: Icons.manage_accounts_outlined,
              label: 'Gestionar Reportes',
              onTap: () => context.push('/admin-home/manage-reports'),
            ),
          ],

          const Spacer(), // Empuja el botón de cerrar sesión hacia abajo
          const Divider(color: Colors.white24),
          _DrawerItem(
            icon: Icons.logout_rounded,
            label: 'Cerrar Sesión',
            onTap: () => context.go('/login'),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// Widget pequeño para cada opción del menú
class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      onTap: () {
        Navigator.pop(context); // Cierra el menú
        onTap(); // Navega
      },
    );
  }
}
