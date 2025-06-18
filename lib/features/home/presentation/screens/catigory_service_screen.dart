import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../admin/prsentation/bloc/service_bloc/serviceEvent.dart';
import '../../../admin/prsentation/bloc/service_bloc/service_bloc.dart';
import '../../../admin/prsentation/bloc/service_bloc/service_states.dart';

class CategoryServicesScreen extends StatefulWidget {
  final String category;

  const CategoryServicesScreen({ required this.category});

  @override
  State<CategoryServicesScreen> createState() => _CategoryServicesScreenState();
}

class _CategoryServicesScreenState extends State<CategoryServicesScreen> {
  @override
  void initState() {
    super.initState();

    final category = widget.category.toLowerCase();
    final bloc = context.read<ServiceBloc>();

    switch (category) {
      case "food":
        bloc.add(GetFoodServicesEvent());
        break;
      case "health":
        bloc.add(GetHealthServicesEvent());
        break;
      case "grocery":
        bloc.add(GetGroceryServicesEvent());
        break;
      default:
        bloc.add(GetAllServicesEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.category} Services'),
        centerTitle: true,
      ),
      body: BlocBuilder<ServiceBloc, ServiceState>(
        builder: (context, state) {
          if (state is ServiceLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ServiceLoaded) {
            final services = state.services;

            if (services.isEmpty) {
              return const Center(child: Text("No services found."));
            }

            return ListView.builder(
              itemCount: services.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final service = services[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: const Icon(Icons.image_not_supported),
                    title: Text(service.name),
                    subtitle: Text(service.description),
                    trailing: Text('${service.discount}%'),
                  ),
                );
              },
            );
          }

          if (state is ServiceError) {
            return Center(child: Text("Error: ${state.message}"));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
