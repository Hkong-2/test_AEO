import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../core/widgets/rounded_button_widget.dart';
import '../store/integrations_store.dart';
import '../store/gsc_store.dart';

class ConnectionCard extends StatelessWidget {
  final IntegrationsStore store;
  final GscStore gscStore;

  const ConnectionCard({Key? key, required this.store, required this.gscStore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Google Connection',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                if (!gscStore.isConnected) ...[
                  if (gscStore.isLoading)
                    const Center(child: CircularProgressIndicator())
                  else
                    RoundedButtonWidget(
                      buttonText: 'Connect Google',
                      buttonColor: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        // Dummy project ID for now
                        gscStore.connectGoogle("default-project");
                        // Also trigger dummy store for UI dashboard mock
                        store.connectGoogle();
                      },
                    ),
                  if (gscStore.errorStore.errorMessage.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      gscStore.errorStore.errorMessage,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],
                ] else ...[
                  Row(
                    children: [
                      const Icon(Icons.check_circle, color: Colors.green),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Đăng nhập thành công',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          gscStore.disconnectGoogle("default-project");
                          store.disconnect();
                        },
                        child: const Text('Disconnect', style: TextStyle(color: Colors.red)),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Keeping mock drop down data just for the UI
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Website Property',
                      border: OutlineInputBorder(),
                    ),
                    value: store.selectedGscProperty,
                    items: store.gscProperties
                        .map((prop) => DropdownMenuItem(value: prop, child: Text(prop)))
                        .toList(),
                    onChanged: (val) => store.selectedGscProperty = val,
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
