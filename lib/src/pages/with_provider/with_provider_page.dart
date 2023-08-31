import 'package:example_provider/src/pages/with_provider/widgets/produto_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../../models/user_model.dart';

class WithProviderPage extends StatelessWidget {
  const WithProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserModel>(context); // opção 1
    // .read ele retorna uma instãncia sem ficar escutando alterações
    // var user = context.read<UserModel>(); // opção 2
    //extrai apenas o valor de uma propriedade da class model
    // var userAvatar = context.select<UserModel, String>((userModel) => userModel.imgAvatar); // opção 3

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                minRadius: 180,
                // backgroundImage: NetworkImage(user.imgAvatar),
                backgroundImage: NetworkImage(user.imgAvatar),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(user.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
                  Text('(${user.birthday})', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(user.email, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Provider(
                    create: (_) => ProductModel(nome: 'Serviço de Publicação de Ofertas'),
                    child: const ProdutoWidget(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
