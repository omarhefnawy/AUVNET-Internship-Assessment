import 'package:auvent_intership/features/admin/prsentation/bloc/service_bloc/serviceEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/service/serviceEntity.dart';
import '../bloc/service_bloc/service_bloc.dart';
import '../bloc/service_bloc/service_states.dart';
class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({super.key});

  @override
  State<AddServiceScreen> createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _discountController = TextEditingController();

  String? _selectedCategory;

  final List<String> categories = ['food', 'health', 'grocery', 'all'];

  @override
  Widget build(BuildContext context) {
    final spacing = SizedBox(height: MediaQuery.of(context).size.height * 0.025);

    return Scaffold(
      appBar: AppBar(title: const Text("Add Service"), centerTitle: true),
      body: BlocConsumer<ServiceBloc, ServiceState>(
        listener: (context, state) {
          if (state is ServiceAddedSuccessfully) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Service added successfully!")),
            );
            Navigator.pop(context);
          } else if (state is ServiceError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  spacing,
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: "Service Name",
                      border: OutlineInputBorder(),
                    ),
                    validator: (val) => val!.isEmpty ? "Enter name" : null,
                  ),
                  spacing,
                  TextFormField(
                    controller: _descController,
                    decoration: const InputDecoration(
                      labelText: "Description",
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                    validator: (val) => val!.isEmpty ? "Enter description" : null,
                  ),
                  spacing,
                  TextFormField(
                    controller: _discountController,
                    decoration: const InputDecoration(
                      labelText: "Discount %",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (val) {
                      final value = int.tryParse(val ?? '');
                      if (value == null || value < 0 ) {
                        return "Enter discount ( > 0)";
                      }
                      return null;
                    },
                  ),
                  spacing,
                  DropdownButtonFormField<String>(
                    value: _selectedCategory,
                    decoration: const InputDecoration(
                      labelText: "Category",
                      border: OutlineInputBorder(),
                    ),
                    items: categories.map((cat) {
                      return DropdownMenuItem(
                        value: cat,
                        child: Text(cat[0].toUpperCase() + cat.substring(1)),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _selectedCategory = val),
                    validator: (val) => val == null ? "Select category" : null,
                  ),
                  spacing,
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: state is ServiceLoading
                          ? null
                          : () {
                        if (_formKey.currentState!.validate()) {
                          final service = ServiceEntity(
                            id: UniqueKey().toString(),
                            name: _nameController.text.trim(),
                            description: _descController.text.trim(),
                            category: _selectedCategory!,
                            discount: int.tryParse(_discountController.text.trim()) ?? 0,
                          );
                          context.read<ServiceBloc>().add(AddServiceEvent(service));
                        }
                      },
                      icon: const Icon(Icons.add),
                      label: state is ServiceLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text("Add Service", style: TextStyle(fontSize: 18,color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
