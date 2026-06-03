import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Ya no necesitamos ponerle color de fondo, el Scaffold lo hereda del tema automáticamente
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Tu logotipo: Gota de agua blanca gigante
                  const Icon(
                    Icons.water_drop_rounded,
                    size: 120,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20),

                  // Título principal
                  const Text(
                    'H2O Chimal',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Eslogan
                  const Text(
                    'Cuidemos el agua de nuestra nación',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      // fontStyle: FontStyle.italic, // Si quieres darle un toque cursivo
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Campo de Correo
                  const TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Correo Electrónico',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Campo de Contraseña
                  const TextField(
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Botón de Inicio de Sesión estilo "Explorar Menú"
                  ElevatedButton(
                    onPressed: () => context.go('/user-home'),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.login_rounded, size: 20),
                        SizedBox(width: 8),
                        Text('INICIAR SESIÓN'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Link para ir a Registro
                  GestureDetector(
                    onTap: () => context.push('/register'),
                    child: const Text(
                      '¿No tienes cuenta? Regístrate aquí',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Botones temporales para saltar rápido en las pruebas
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton.icon(
                        onPressed: () => context.go('/user-home'),
                        icon: const Icon(Icons.person, color: Colors.white60),
                        label: const Text(
                          'User Mode',
                          style: TextStyle(color: Colors.white60),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () => context.go('/admin-home'),
                        icon: const Icon(
                          Icons.admin_panel_settings,
                          color: Colors.white60,
                        ),
                        label: const Text(
                          'Admin Mode',
                          style: TextStyle(color: Colors.white60),
                        ),
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
