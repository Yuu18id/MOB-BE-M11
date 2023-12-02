import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Semantic"),
      ),
      body: Column(
        children: [
          Semantics(
            label: 'Judul Aplikasi',
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Aplilasi Semantics buatan Anak Negeri",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Name'.i18n()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: MergeSemantics(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ListTile(
                    leading: const Icon(Icons.help, semanticLabel: 'Bantuan',),
                    title: Text(
                      'Text_call'.i18n(),
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.email, semanticLabel: 'email',),
                    title: const Text(
                      "Johndoe@test.com",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () {},
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: MergeSemantics(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      }),
                      Semantics(
                        hint: _isChecked? 'Anda Memilih untuk Setuju' : 'Anda Belum Setuju',
                        child: Text('Checkbox-agree'.i18n()),
                      )
                  
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Semantics(
                        onTapHint: 'Ketuk 2 kali untuk masuk ke aplikasi',
                        child: Text('Button-sign-in'.i18n()))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Semantics(
                        onTapHint: 'Ketuk 2 kali untuk keluar ke aplikasi',
                        child: Text('Button-sign-out'.i18n()))),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
