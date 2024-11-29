import 'package:flutter/material.dart';
import 'package:mundo_verde/telas/oficina_sustentavel_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9), // Fundo claro
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 600, // Largura máxima típica de smartphones
            maxHeight: 800, // Altura máxima típica de smartphones
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Banner Superior
                Stack(
                  children: [
                    // Fundo do banner
                    Container(
                      height: 200, // Altura do banner
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        ),
                      ),
                    ),
                    // Imagem no fundo
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Image.asset(
                        'lib/assets/telaverde.png', // Caminho da imagem
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Conteúdo do banner
                    Positioned(
                      bottom: 16,
                      left: 16,
                      right: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Vamos Criar!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Inicie sua Jornada Criativa Abaixo",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              // Navegação para OficinaSustentavelScreen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const OficinaSustentavelScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 20,
                              ),
                            ),
                            child: const Text(
                              "Comece por aqui",
                              style: TextStyle(
                                color: Color(0xFF4CAF50),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Filtros de categorias
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 05.0),
                  child: Row(
                    children: [
                      _buildFilterChip("Tudo", selected: true),
                      _buildFilterChip("Doação"),
                      _buildFilterChip("Materiais recicláveis"),
                      _buildFilterChip("Parcerias"),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Seção de Atividades
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: const Text(
                    "Criações Sustentáveis em Ação",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Lista de Atividades em Grid
                GridView.count(
                  crossAxisCount: 1,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: [
                    _buildProjectCard(
                      "Finn",
                      "Transforme suas criações em sorrisos: doe brinquedos feitos por você para instituições carentes.",
                      ["Doação", "Parcerias"],
                      "lib/assets/bghome.png",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Filtros de categorias (Chips)
  Widget _buildFilterChip(String label, {bool selected = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: FilterChip(
        label: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : const Color(0xFF4CAF50),
            fontWeight: FontWeight.bold,
          ),
        ),
        selected: selected,
        onSelected: (bool value) {
          // Lógica de filtro ao clicar
        },
        backgroundColor: const Color(0xFFECEBFF),
        selectedColor: const Color(0xFF4CAF50),
      ),
    );
  }

  // Cartão de Atividades
  Widget _buildProjectCard(
    String userName,
    String projectTitle,
    List<String> tags,
    String assetPath,
  ) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (assetPath.isNotEmpty)
              AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    assetPath,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            const SizedBox(height: 8),
            Text(
              projectTitle,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 0,
              children: tags
                  .map((tag) => Chip(
                        label: Text(tag),
                        backgroundColor: const Color(0xFFECEBFF),
                        labelStyle: const TextStyle(
                          color: Color(0xFF4CAF50),
                          fontSize: 12,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 8,
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
