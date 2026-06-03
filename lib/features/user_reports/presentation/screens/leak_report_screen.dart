//cambio en el formato de reporte
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LeakReportScreen extends StatefulWidget {
  const LeakReportScreen({super.key});

  @override
  State<LeakReportScreen> createState() => _LeakReportScreenState();
}

class _LeakReportScreenState extends State<LeakReportScreen> {
  // Controlador para cambiar entre Formulario y Éxito
  final PageController _pageController = PageController();

  // Variables de estado del formulario
  String _selectedServiceType = 'Fuga de agua';
  final _detailsController = TextEditingController();

  @override
  void dispose() {
    _pageController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), // Fondo grisáceo muy limpio
      appBar: AppBar(
        title: Text(
          _pageController.hasClients && _pageController.page == 1
              ? 'Solicitud enviada'
              : 'Solicitar servicio',
          style: const TextStyle(
            fontFamily: 'sans-serif',
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: const Color(0xFF1E88E5),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (_pageController.hasClients && _pageController.page == 1) {
              _pageController.animateToPage(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              setState(() {});
            } else {
              context.pop();
            }
          },
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics:
            const NeverScrollableScrollPhysics(), // Evita que el usuario arrastre con el dedo
        children: [_buildFormPage(), _buildSuccessPage()],
      ),
    );
  }

  // =========================================================================
  // PANTALLA 1: FORMULARIO DE SOLICITUD
  // =========================================================================
  Widget _buildFormPage() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Tipo de servicio
          _buildSectionTitle('Tipo de servicio'),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 2.3,
            children: [
              _buildServiceRadioCard('Fuga de agua', Icons.water_drop_rounded),
              _buildServiceRadioCard('Alcantarillado', Icons.opacity_rounded),
              _buildServiceRadioCard('Cloracion de agua', Icons.speed_rounded),
              _buildServiceRadioCard(
                'noche lo reviso mañana',
                Icons.more_horiz_rounded,
              ),
            ],
          ),
          const SizedBox(height: 24),

          // 2. Ubicación del servicio
          _buildSectionTitle('Ubicación del servicio'),
          const SizedBox(height: 12),
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Stack(
              alignment: Alignment.center,
              children: [
                // Simulación de Mapa
                Icon(Icons.location_on_rounded, color: Colors.red, size: 45),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // 3. Evidencia visual
          _buildSectionTitle('Evidencia visual'),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildMediaButton('Cámara', Icons.camera_alt_rounded),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildMediaButton('Galería', Icons.image_rounded),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // 4. Detalles adicionales
          _buildSectionTitle('Detalles adicionales'),
          const SizedBox(height: 12),
          TextField(
            controller: _detailsController,
            maxLines: 4,
            style: const TextStyle(color: Colors.black87),
            decoration: InputDecoration(
              hintText:
                  'Describe el problema o agrega información que consideres importante...',
              hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color(0xFF1E88E5),
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color(0xFF1E88E5),
                  width: 1.5,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Botón de Enviar Solicitud
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E88E5),
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 55),
              shape: const StadiumBorder(),
            ),
            onPressed: () {
              // Animamos a la pantalla de éxito
              _pageController.animateToPage(
                1,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
              setState(() {});
            },
            child: const Text('ENVIAR SOLICITUD'),
          ),
        ],
      ),
    );
  }

  // =========================================================================
  // PANTALLA 2: SOLICITUD ENVIADA (ÉXITO)
  // =========================================================================
  Widget _buildSuccessPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
      child: Column(
        children: [
          const Spacer(),
          // Icono animado o check circular verde
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5E9),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFA5D6A7), width: 2),
            ),
            child: const Icon(
              Icons.check_rounded,
              size: 70,
              color: Color(0xFF4CAF50),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '¡Solicitud enviada!',
            style: TextStyle(
              fontSize: 28,
              color: Color(0xFF1E88E5),
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Tu solicitud de servicio de agua ha sido registrada correctamente.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Colors.black54, height: 1.4),
          ),
          const SizedBox(height: 32),

          // Tarjeta: Fecha y Hora
          _buildInfoCard(
            icon: Icons.calendar_month_rounded,
            title: 'Fecha y hora de la solicitud',
            subtitle: '18 de mayo de 2025\n04:23 p. m.',
          ),
          const SizedBox(height: 14),

          // Tarjeta: Número de Folio
          _buildInfoCard(
            icon: Icons.unfold_more_rounded,
            title: 'Número de folio',
            subtitle: 'AGUA-2025-000123',
            subtitleColor: const Color(0xFF1E88E5),
          ),
          const SizedBox(height: 14),

          // Info Banner azul inferior
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFE3F2FD),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              children: [
                Icon(Icons.info_rounded, color: Color(0xFF1E88E5)),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Te notificaremos cuando haya novedades sobre tu solicitud.',
                    style: TextStyle(
                      color: Color(0xFF1E88E5),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),

          // Botones de acción inferiores
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E88E5),
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 52),
              shape: const StadiumBorder(),
            ),
            onPressed: () => context.push('/user-home/my-reports'),
            child: const Text('VER MIS SOLICITUDES'),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () => context.go('/user-home'),
            child: const Text(
              'IR AL MENÚ PRINCIPAL',
              style: TextStyle(
                color: Color(0xFF1E88E5),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================================
  // SUB-WIDGETS COMPARTIDOS Y ESTILOS
  // =========================================================================

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        color: Color(0xFF1E88E5),
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildServiceRadioCard(String title, IconData icon) {
    final bool isSelected = _selectedServiceType == title;
    return GestureDetector(
      onTap: () => setState(() => _selectedServiceType = title),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? const Color(0xFF1E88E5) : Colors.black12,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: const Color(0xFF1E88E5), size: 22),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(fontSize: 13, color: Colors.black87),
                ),
              ],
            ),
            Icon(
              isSelected
                  ? Icons.radio_button_checked_rounded
                  : Icons.radio_button_off_rounded,
              color: const Color(0xFF1E88E5),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMediaButton(String label, IconData icon) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        color: const Color(0xFFEBF3FA),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: const Color(0xFF1E88E5), size: 26),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: Color(0xFF1E88E5), fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
    Color subtitleColor = Colors.black87,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 1)),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF1E88E5), size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: subtitleColor,
                    fontWeight: FontWeight.w500,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
