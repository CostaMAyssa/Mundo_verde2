import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            // Lógica para voltar à tela anterior
          },
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 400, // Largura máxima típica de smartphones
            maxHeight: 800, // Altura máxima típica de smartphones
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Cabeçalho
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('lib/assets/profile.jpg'),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'MAY_costa',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '@MAY_costa2022',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Entrou Março 2022',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Ranking
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    child: ListTile(
                      leading: const Icon(Icons.emoji_events, color: Color(0xFF4CAF50)),
                      title: const Text('Ranking'),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        // Lógica para abrir a tela de ranking
                      },
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Estatísticas
                  const Text(
                    'Estatísticas',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    shrinkWrap: true, // Permite ajustar o Grid ao conteúdo
                    crossAxisCount: 2, // Define duas colunas
                    mainAxisSpacing: 12, // Espaçamento entre linhas
                    crossAxisSpacing: 12, // Espaçamento entre colunas
                    childAspectRatio: 4 / 3, // Proporção menor para os cards
                    children: [
                      _buildStatisticItem(Icons.military_tech, 'Eco-Herói', 'Liga atual'),
                      _buildStatisticItem(Icons.leaderboard, '0', 'Top 3 melhores'),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Amigos
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Amigos',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _showAddFriendDialog(context);
                        },
                        child: const Text(
                          'ADICIONAR AMIGOS',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Lista de Amigos
                  _buildFriendItem('Matteus', '4367 XP', Colors.blue),
                 
                  const SizedBox(height: 24),

                  // Convidar Amigos
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Lógica para convidar amigos
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      ),
                      child: const Text(
                        'Convide seus amigos',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatisticItem(IconData icon, String value, String label) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Color(0xFF4CAF50), size: 30), // Ícone ajustado para verde
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFriendItem(String name, String xp, Color color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.2),
        child: Text(
          name[0],
          style: TextStyle(color: color),
        ),
      ),
      title: Text(name),
      subtitle: Text(xp),
      trailing: const Icon(Icons.more_horiz),
      onTap: () {
        // Lógica para interagir com o amigo
      },
    );
  }

  void _showAddFriendDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Adicionar amigo'),
          content: const TextField(
            decoration: InputDecoration(
              labelText: 'Nome do amigo',
              hintText: 'Digite o nome do amigo',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                // Lógica para adicionar amigo
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              child: const Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }
}
