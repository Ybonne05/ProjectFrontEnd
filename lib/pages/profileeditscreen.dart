import 'package:flutter/material.dart';

class ProfileEditScreen extends StatefulWidget {
  final String initialName;
  final String initialAge;
  final String initialEmail;
  final String initialContactNumber;
  final String initialAddress;

  ProfileEditScreen({
    required this.initialName,
    required this.initialAge,
    required this.initialEmail,
    required this.initialContactNumber,
    required this.initialAddress,
  });

  @override
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  late TextEditingController _emailController;
  late TextEditingController _contactNumberController;
  late TextEditingController _addressController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
    _ageController = TextEditingController(text: widget.initialAge);
    _emailController = TextEditingController(text: widget.initialEmail);
    _contactNumberController = TextEditingController(text: widget.initialContactNumber);
    _addressController = TextEditingController(text: widget.initialAddress);
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _contactNumberController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Icon(Icons.check_circle, color: Colors.green, size: 50),
          content: Text("Successfully Updated Your Profile"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop({
                  'name': _nameController.text,
                  'age': _ageController.text,
                  'email': _emailController.text,
                  'contactNumber': _contactNumberController.text,
                  'address': _addressController.text,
                });
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Icon(Icons.error, color: Colors.red, size: 50),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _saveProfile() {
    final name = _nameController.text;
    final email = _emailController.text;
    final address = _addressController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (name.length < 10 || name.length > 60) {
      _showErrorDialog("Failed to Update Your Details: Name must be between 10 and 60 characters.");
      return;
    }
    if (email.length < 10 || email.length > 60) {
      _showErrorDialog("Failed to Update Your Details: Email must be between 10 and 60 characters.");
      return;
    }
    if (address.length < 10 || address.length > 60) {
      _showErrorDialog("Failed to Update Your Details: Address must be between 10 and 60 characters.");
      return;
    }
    if (password.isNotEmpty && password != confirmPassword) {
      _showErrorDialog("Password and confirmation do not match.");
      return;
    }
    if (password.length < 8 && password.isNotEmpty) {
      _showErrorDialog("Password must be at least 8 characters long.");
      return;
    }

    bool isSaveSuccessful = true;

    if (isSaveSuccessful) {
      _showSuccessDialog();
    } else {
      _showErrorDialog("Error Editing Your Details");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,  // Allows adjustment of layout when the keyboard appears
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/Carousel 1.jpg',
              fit: BoxFit.cover,  // Ensure the image covers the entire screen
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.brown[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: _nameController,
                            decoration: InputDecoration(labelText: 'Name'),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.brown[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: _ageController,
                            decoration: InputDecoration(labelText: 'Age'),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.brown[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: _emailController,
                            decoration: InputDecoration(labelText: 'Email'),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.brown[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: _contactNumberController,
                            decoration: InputDecoration(labelText: 'Contact Number'),
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.brown[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: _addressController,
                            decoration: InputDecoration(labelText: 'Address'),
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.brown[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Stack(
                            children: [
                              TextField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  labelText: 'New Password',
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordVisible = !_isPasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                                obscureText: !_isPasswordVisible,  // Toggle password visibility
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.brown[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Stack(
                            children: [
                              TextField(
                                controller: _confirmPasswordController,
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isConfirmPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                                obscureText: !_isConfirmPasswordVisible,  // Toggle password visibility
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  color: Colors.white,  // Background color for the container
                  child: ElevatedButton.icon(
                    onPressed: _saveProfile,
                    icon: Icon(Icons.save, color: Colors.black),
                    label: Text('Save', style: TextStyle(color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 48),
                      backgroundColor: Colors.brown[600],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
