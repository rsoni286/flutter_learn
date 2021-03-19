import 'package:flutter/material.dart';
import 'package:flutter_learn/ui/components/edit_text.dart';

class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: SizedBox()),
            Card(
              child: _buildLoginForm(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          EditText(hint: "@Username"),
          SizedBox(height: 12),
          EditText(hint: "Password", isPassword: true),
        ],
      ),
    );
  }
}
