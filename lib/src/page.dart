import 'package:flutter/material.dart';
import 'package:atividade_flutter/src/personagem_controller.dart';
import 'package:atividade_flutter/src/personagem_repository.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = PersonagemController(repository: PersonagemRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: controller.getPersonagem(),
        builder: (context, snapshot) {
          if (!snapshot.hasData && !snapshot.hasError) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Não há dados para mostrar!'),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.all(16.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      ImagemPerfil(imagem: snapshot.data![index].imagem),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            snapshot.data![index].nome!,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            snapshot.data![index].casa!,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
class ImagemPerfil extends StatelessWidget {
  final String? imagem;
  const ImagemPerfil({required this.imagem, super.key});

  @override
  Widget build(BuildContext context) {
    return imagem != null && imagem!.isNotEmpty
        ? Image.network(imagem!, width: 100, height: 100)
        : const Icon(
            Icons.person,
            size: 100,
          );
  }
}
