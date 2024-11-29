import 'package:flutter/material.dart';

class CarinhoDeCaixaDeLeiteScreen extends StatelessWidget {
  final String youtubeLink = "https://www.youtube.com/watch?v=5JUCwjvGGak&list=PLooqzTcqqZvmqNkoxBojvXcqHB9jeJhxV&index=4";

  const CarinhoDeCaixaDeLeiteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double screenHeight = 800;
    const double screenWidth = 500;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Carinho de Caixa de Leite",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Column(
          children: [
            // Área superior com o vídeo
            GestureDetector(
              onTap: () async {
                // Ação ao tocar no vídeo
              },
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.25,
                color: Colors.black,
                child: const Center(
                  child: Icon(
                    Icons.play_circle_fill,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
            ),
            const Divider(),
            // Menu inferior com opções
            Expanded(
              child: ListView(
                children: [
                  _buildListTile(
                    icon: Icons.info,
                    title: "Passo a Passo",
                    onTap: () {
                      // Ação ao clicar
                    },
                  ),
                  _buildListTile(
                    icon: Icons.school,
                    title: "Materiais Necessários",
                    onTap: () {
                      // Ação ao clicar
                    },
                  ),
                  _buildListTile(
                    icon: Icons.share,
                    title: "Compartilhar este projeto",
                    onTap: () {
                      // Ação ao clicar
                    },
                  ),
                  _buildListTile(
                    icon: Icons.note,
                    title: "Doe este projeto para o bazar solidário Mundo Verde",
                    onTap: () {
                      // Ação ao clicar
                    },
                  ),
                  _buildListTile(
                    icon: Icons.star_border,
                    title: "Adicionar projeto aos favoritos",
                    onTap: () {
                      // Ação ao clicar
                    },
                  ),
                  const Divider(),
                  // Nova área: Espaço Criativo
                  Padding(
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Espaço Criativo",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        ElevatedButton.icon(
                          onPressed: () {
                            // Navegar para a tela de adicionar postagem
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddPostScreen(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.add),
                          label: const Text("Mostre sua Criação"),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        // Exibição de postagens (exemplo de post estático)
                        Column(
                          children: List.generate(3, (index) {
                            return Card(
                              child: ListTile(
                                leading: const Icon(Icons.image, size: 40),
                                title: Text("Criação ${index + 1}"),
                                subtitle: const Text("Descrição da criação feita por um usuário."),
                                onTap: () {
                                  // Exibir detalhes da postagem
                                },
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget genérico para ListTile
  Widget _buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, size: 30),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      onTap: onTap,
    );
  }
}

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double screenHeight = 800;
    const double screenWidth = 400;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Adicionar Criação",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: "Título da criação",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            const TextField(
              decoration: InputDecoration(
                labelText: "Descrição",
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: screenHeight * 0.02),
            ElevatedButton(
              onPressed: () {
                // Função para salvar a postagem
                Navigator.pop(context);
              },
              child: const Text("Salvar"),
            ),
          ],
        ),
      ),
    );
  }
}
