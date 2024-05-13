import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grpc/grpc.dart';
import 'package:test_drive/src/dto/employee_dto.dart';
import 'package:test_drive/src/generated/management-service.pbgrpc.dart';

class Employees extends StatefulWidget {
  const Employees({super.key});

  @override
  State<Employees> createState() => _EmployeesState();
}

class _EmployeesState extends State<Employees> {
  List<EmployeeDto> employees = [];

  @override
  void initState() {
    super.initState();
    fetchEmployees();
  }

  Future<void> fetchEmployees() async {
    final channel = ClientChannel("localhost",
        port: 50051,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()));

    final _client = ManagementServiceClient(channel);

    List<EmployeeDto> data = [];
    await for (var apiEmployee in _client.getEmployees(Void())) {
      data.add(EmployeeDto(apiEmployee.id, apiEmployee.name,
          apiEmployee.employeeType, apiEmployee.dob.toInt()));
    }

    setState(() {
      employees = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Employees")),
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'Employees',
        itemCount: employees.length,
        itemBuilder: (BuildContext context, int index) {
          final item = employees[index];
          print("item ${item.name}");

          return ListTile(title: Text(item.name), onTap: () {});
        },
      ),
    );
  }
}
