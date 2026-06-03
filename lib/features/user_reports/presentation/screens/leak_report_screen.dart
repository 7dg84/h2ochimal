import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LeakReportScreen extends StatefulWidget {
  const LeakReportScreen({super.key});

  @override
  State<LeakReportScreen> createState() => _LeakReportScreenState();
}

class _LeakReportScreenState extends State<LeakReportScreen> {
  // Controladores para el formulario
  final _addressController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedFugaType = 'Fuga de agua potable'; // Valor por defecto

  @override
  void dispose() {
    _addressController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // La AppBar hereda el diseño limpio. Usamos el azul oscuro para que resalte sobre el fondo claro
      appBar: AppBar(
        title: const Text('Reportar Nueva Fuga'),
        backgroundColor: const Color(0xFF03549A),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(), // Regresa al menú anterior
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ayúdanos a localizar el problema',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF03549A),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Introduce los detalles de la fuga de agua para que el equipo de administración o las pipas puedan atenderla.',
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
              const SizedBox(height: 24),

              // Selector de Tipo de Fuga (Dropdown)
              const Text(
                'Tipo de Incidencia',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black12),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedFugaType,
                    isExpanded: true,
                    items:
                        <String>[
                          'Fuga de agua potable',
                          'Fuga de aguas negras',
                          'Falta de suministro / Escasez',
                          'cloracion del agua',
                          'alcantarillado ',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedFugaType = newValue!;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Campo de Dirección (Ubicación)
              const Text(
                'Dirección / Referencia',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _addressController,
                style: const TextStyle(color: Colors.black87),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Ej. Av. Central, entre Calle 3 y Calle 4',
                  hintStyle: const TextStyle(color: Colors.black38),
                  prefixIcon: const Icon(
                    Icons.location_on_outlined,
                    color: Color(0xFF1E88E5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xFF1E88E5),
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Campo de Descripción
              const Text(
                'Descripción de la situación',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _descriptionController,
                maxLines: 4,
                style: const TextStyle(color: Colors.black87),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText:
                      'Describe el problema (ej. El agua brota del pavimento desde hace dos días...)',
                  hintStyle: const TextStyle(color: Colors.black38),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xFF1E88E5),
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // RECUADRO PARA SUBIR FOTO (Simulado)
              const Text(
                'Evidencia fotográfica',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  // Aquí irá la lógica para abrir la cámara o galería
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Cámara/Galería (Próximamente)'),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.black12,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        size: 40,
                        color: Colors.black38,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Subir foto de la fuga',
                        style: TextStyle(color: Colors.black45),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // BOTÓN PARA ENVIAR REPORTE
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                    0xFF03549A,
                  ), // Azul fuerte para que resalte en fondo blanco
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // Por ahora simula que se envía con éxito
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('¡Reporte generado con éxito!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                  context.pop(); // Regresa al menú de usuario
                },
                child: const Text('ENVIAR REPORTE'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}