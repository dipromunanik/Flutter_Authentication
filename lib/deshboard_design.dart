import 'package:flutter/material.dart';
import 'package:registration_firebase/custom_design/custom_textfield_design.dart';

class DeshBoard extends StatefulWidget {
  const DeshBoard({Key? key}) : super(key: key);

  @override
  _DeshBoardState createState() => _DeshBoardState();
}

class _DeshBoardState extends State<DeshBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deshboard'),
        actions: [
          IconButton(onPressed: (){
            _InformationSave();
          }, icon: const Icon(Icons.save,color: Colors.black,))
        ],
      ),
    );
  }

  void _InformationSave() {

  }
}
