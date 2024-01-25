import 'package:flutter/material.dart';
import 'package:flutter_app/api/api_service.dart';
import 'package:flutter_app/resources/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiMenu extends StatefulWidget {
  const ApiMenu({super.key});

  @override
  State<ApiMenu> createState() => _ApiMenuState();
}

class _ApiMenuState extends State<ApiMenu> {
  final TextEditingController _apiLinkController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _apiLinkController.text = APIService.apiUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.blue),
      body: Column(
        children: [
          const Spacer(),
          Row(
            children: [
              const Spacer(),
              Expanded(
                child: TextField(
                  controller: _apiLinkController,
                  decoration: const InputDecoration(labelText: 'API Link'),
                ),
              ),
              IconButton(
                onPressed: saveSettings,
                icon: Icon(Icons.save, color: AppColors.white),
              ),
              const Spacer(),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Future<void> saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    String apiLink = _apiLinkController.text;
    await prefs.setString('apiLink', apiLink);
  }
}
