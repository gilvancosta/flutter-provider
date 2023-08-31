import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import 'controler/provider_controller.dart';

class WithChangerNotifierPage extends StatefulWidget {
  const WithChangerNotifierPage({super.key});

  @override
  State<WithChangerNotifierPage> createState() => _WithChangerNotifierPageState();
}

class _WithChangerNotifierPageState extends State<WithChangerNotifierPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ProviderController>().alterarDados();
    });
  }

  @override
  Widget build(BuildContext context) {
    // var controller = Provider.of<ProviderController>(context);

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
              Selector<ProviderController, String>(
                  selector: (context, controller) => controller.imgAvatar,
                  builder: (context, imgAvatar, child) {
                    return CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(imgAvatar),
                    );
                  }),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Selector<ProviderController, String>(
                      selector: (context, controller) => controller.name,
                      builder: (context, name, child) {
                        return Text(name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ));
                      }),
                  Selector<ProviderController, String>(
                      selector: (context, controller) => controller.birthday,
                      builder: (context, birthday, child) {
                        return Text(birthday,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ));
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Selector<ProviderController, Tuple2<String, String>>(
                      selector: (context, controller) => Tuple2(controller.email, controller.name),
                      // shouldRebuild: (previous, next) => previous != next,
                      builder: (context, tuple, child) {
                        print('controller.birthday');
                        return Text(
                          '(${tuple.item1} - ${tuple.item2})',
                          style: const TextStyle(fontSize: 16),
                        );
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        context.read<ProviderController>().changeName('Nome Alterado');
                      },
                      child: const Text('Alterar Nome')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
