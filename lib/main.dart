import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() {
  runApp(const ImmunexApp());
}

class ImmunexApp extends StatelessWidget {
  const ImmunexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Immunex',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: const Text("Immunex"),
        centerTitle: true,

        actions: [

          IconButton(
            icon: const Icon(Icons.menu),

            onPressed: () {

              showDialog(
                context: context,

                builder: (context) {

                  return AlertDialog(
                    backgroundColor: Colors.black87,

                    title: const Text(
                      "Body Organs",
                      style: TextStyle(color: Colors.white),
                    ),

                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        organButton(
                          context,
                          "Heart",
                          "assets/heart.glb",
                        ),

                        organButton(
                          context,
                          "Brain",
                          "assets/brain.glb",
                        ),

                        organButton(
                          context,
                          "Lungs",
                          "assets/lungs.glb",
                        ),

                        organButton(
                          context,
                          "Liver",
                          "assets/liver.glb",
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),

      body: Stack(
        children: [

          const ModelViewer(
            src: 'assets/human.glb',
            alt: "Human Body",
            autoRotate: true,
            cameraControls: true,
            backgroundColor: Colors.black,
          ),

          Positioned(
            bottom: 50,
            left: 40,
            right: 40,

            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
              ),

              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VirusPage(),
                  ),
                );
              },

              child: const Text(
                "Open Organism Model",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget organButton(
    BuildContext context,
    String title,
    String modelPath,
    ) {

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),

    child: ElevatedButton(

      onPressed: () {

        Navigator.pop(context);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrganPage(
              title: title,
              modelPath: modelPath,
            ),
          ),
        );
      },

      child: Text(title),
    ),
  );
}

class VirusPage extends StatelessWidget {
  const VirusPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: const Text("Organism Model"),
      ),

      body: const ModelViewer(
        src: 'assets/organism.glb',
        alt: "Virus",
        autoRotate: true,
        cameraControls: true,
        backgroundColor: Colors.black,
      ),
    );
  }
}

class OrganPage extends StatelessWidget {

  final String title;
  final String modelPath;

  const OrganPage({
    super.key,
    required this.title,
    required this.modelPath,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: Text(title),
      ),

      body: ModelViewer(
        src: modelPath,
        alt: title,
        autoRotate: true,
        cameraControls: true,
        backgroundColor: Colors.black,
      ),
    );
  }
}