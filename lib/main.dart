import 'package:flutter/material.dart';

void main() {
  runApp(const MiRestauranteApp());
}

class MiRestauranteApp extends StatelessWidget {
  const MiRestauranteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const PantallaPrincipal(),
    );
  }
}

class PantallaPrincipal extends StatelessWidget {
  const PantallaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      // CAMBIO CLAVE: endDrawer coloca la hamburguesa a la DERECHA
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.green, Colors.red]),
              ),
              child: Text(
                "Menú ITA", 
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Inicio"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.shopping_basket),
              title: const Text("Mi Carrito"),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Configuración"),
              onTap: () {},
            ),
          ],
        ),
      ),

      appBar: AppBar(
        centerTitle: true,
        // Eliminamos el botón de retroceso automático si existiera
        automaticallyImplyLeading: false, 
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Colors.white, Colors.red],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        // Íconos de acción (Medicina y Paciente) a la IZQUIERDA ahora que la derecha está ocupada
        leading: Row(
          children: const [
            SizedBox(width: 8),
            
            SizedBox(width: 5),
           
          ],
        ),
        leadingWidth: 80, // Damos espacio para los dos iconos
        title: const Text(
          "ITA restaurant: Platillos",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Barra de búsqueda sencilla
                TextField(
                  decoration: InputDecoration(
                    hintText: "Buscar platillo italiano...",
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                ),
                const SizedBox(height: 25),

                // Filas de Platillos (2 columnas)
                crearFilaPlatillos(
                  "Pasta Pesto", "12.50", "Albahaca y piñones", "https://raw.githubusercontent.com/Abdiel-Vega128/Act10_pantalla_Vega0395/refs/heads/main/espaguetis-al-pesto.jpg",
                  "Pizza Pepperoni", "15.00", "Queso y pepperoni", "https://raw.githubusercontent.com/Abdiel-Vega128/Act10_pantalla_Vega0395/refs/heads/main/pizza.jpg"
                ),
                const SizedBox(height: 25),
                crearFilaPlatillos(
                  "Lasaña", "14.00", "Carne y bechamel", "https://raw.githubusercontent.com/Abdiel-Vega128/Act10_pantalla_Vega0395/refs/heads/main/carne.png",
                  "Ensalada", "9.50", "Fresca de temporada", "https://raw.githubusercontent.com/Abdiel-Vega128/Act10_pantalla_Vega0395/refs/heads/main/ensalada.png"
                ),
                const SizedBox(height: 25),
                crearFilaPlatillos(
                  "Ravioli", "13.00", "Rellenos de espinaca", "https://picsum.photos/200/150?random=15",
                  "Tiramisú", "7.00", "Postre de café", "https://picsum.photos/200/150?random=16"
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget crearFilaPlatillos(String t1, String p1, String d1, String img1, String t2, String p2, String d2, String img2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: tarjetaPlatillo(t1, p1, d1, img1)),
        const SizedBox(width: 15),
        Expanded(child: tarjetaPlatillo(t2, p2, d2, img2)),
      ],
    );
  }

  Widget tarjetaPlatillo(String titulo, String precio, String desc, String url) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[200],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              url,
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text("\$$precio", style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
        Text(desc, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}