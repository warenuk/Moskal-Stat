import 'package:flutter/material.dart';

import '../sourse/get_data.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? keye});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<dynamic>>? statList;

  @override
  void initState() {
    get();
  }

  get() {
    statList = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Втрати москалів'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.3,
            image: AssetImage("lib/assets/font/57c44f9497a8e156d6d6dc8d.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder(
          future: statList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        subtitle: Text('${snapshot.data?[index]}'),
                        leading: Image.asset('lib/assets/icons/$index.png'),
                        isThreeLine: true,
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return const Text('Error');
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
