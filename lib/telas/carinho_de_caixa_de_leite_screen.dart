import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CarinhoDeCaixaDeLeiteScreen extends StatefulWidget {
  const CarinhoDeCaixaDeLeiteScreen({Key? key}) : super(key: key);

  @override
  State<CarinhoDeCaixaDeLeiteScreen> createState() =>
      _CarinhoDeCaixaDeLeiteScreenState();
}

class _CarinhoDeCaixaDeLeiteScreenState
    extends State<CarinhoDeCaixaDeLeiteScreen> {
  // Link do vídeo no YouTube
  final String youtubeLink =
      "https://www.youtube.com/watch?v=5JUCwjvGGak&list=PLooqzTcqqZvmqNkoxBojvXcqHB9jeJhxV&index=4";

  // Link do passo a passo
  final String passoAPassoUrl =
      "https://www.artesanatopassoapassoja.com.br/carrinho-de-caixa-de-leite-passo-passo/";

  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Inicializa o controlador do YouTube
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(youtubeLink)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false, // Vídeo não toca automaticamente
        mute: false, // Vídeo não está mudo
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Libera o controlador ao sair da tela
    super.dispose();
  }

  // Função para abrir URL
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw "Não foi possível abrir o link: $url";
    }
  }

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
            SizedBox(
              width: screenWidth,
              height: screenHeight * 0.25,
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true, // Mostra barra de progresso
                progressIndicatorColor: Colors.red, // Cor da barra de progresso
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
                    onTap: () => _launchUrl(passoAPassoUrl),
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
                                subtitle: const Text(
                                    "Descrição da criação feita por um usuário."),
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
