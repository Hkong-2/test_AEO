import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'store/integrations_store.dart';
import 'store/gsc_store.dart';
import 'widgets/connection_card.dart';
import 'widgets/search_overview_dashboard.dart';
import '../../di/service_locator.dart';

class IntegrationsScreen extends StatefulWidget {
  const IntegrationsScreen({Key? key}) : super(key: key);

  @override
  State<IntegrationsScreen> createState() => _IntegrationsScreenState();
}

class _IntegrationsScreenState extends State<IntegrationsScreen> {
  late IntegrationsStore _store;
  late GscStore _gscStore;

  @override
  void initState() {
    super.initState();
    _store = IntegrationsStore();
    _gscStore = getIt<GscStore>();
    // Check initial status using a dummy projectId for now since it's not defined where we get it
    _gscStore.checkStatus("default-project");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Integrations'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Observer(
              builder: (_) {
                if (_store.hasError) {
                  return Container(
                    width: double.infinity,
                    color: Colors.red[100],
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        const Icon(Icons.warning, color: Colors.red),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            'Token Expired. Please reconnect your Google account.',
                            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.red),
                          onPressed: () {
                            // User can dismiss the error or attempt to reconnect
                            _store.hasError = false;
                          },
                        ),
                      ],
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            ConnectionCard(store: _store, gscStore: _gscStore),
            SearchOverviewDashboard(store: _store),
          ],
        ),
      ),
    );
  }
}
