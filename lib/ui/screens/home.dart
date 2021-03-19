import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn/blocs/user/user_bloc.dart';
import 'package:flutter_learn/blocs/user/user_event.dart';
import 'package:flutter_learn/blocs/user/user_state.dart';
import 'package:flutter_learn/helpers/launch_helper.dart';
import 'package:flutter_learn/models/user.dart';
import 'package:flutter_learn/ui/components/rounded_image.dart';
import 'package:flutter_learn/ui/components/tag.dart';
import 'package:flutter_learn/ui/components/text.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  User? _selectedUser;

  AnimationController? controller;
  late Animation<double> animation;
  final _userBloc = UserBloc(UserInitial());

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    animation = CurvedAnimation(parent: controller!, curve: Curves.easeIn);
    _userBloc.add(GetUsers());
  }

  @override
  Widget build(BuildContext context) {
    controller?.reset();
    controller?.forward();
    return WillPopScope(
      onWillPop: () async {
        if (_selectedUser != null) {
          _selectUser(null);
          return false;
        }
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            leading: _selectedUser != null
                ? IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => _selectUser(null))
                : null,
            title: TextView.large(
              _selectedUser != null ? "Profile" : "Home",
              fontWeight: FontWeight.bold,
            ),
          ),
          body: _selectedUser == null
              ? _buildUserList()
              : FadeTransition(opacity: animation, child: _buildUserDetails())),
    );
  }

  Widget _buildUserList() {
    return BlocBuilder<UserBloc, UserState>(
        bloc: _userBloc,
        builder: (context, userState) {
          if (userState is UserLoaded) {
            return FadeTransition(
                opacity: animation, child: _showList(userState.users));
          }
          if (userState is UserError) {
            return TextView.small(
              userState.message,
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
            );
          }

          return _showProgress();
        });
  }

  Widget _buildUserDetails() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RoundedImage.url(null, 80, 80, 80),
          SizedBox(height: 10),
          _buildNameRow(),
          SizedBox(height: 12),
          _buildUserInfoRow(),
          SizedBox(height: 4),
          Divider(thickness: 1, color: Colors.grey)
        ],
      ),
    );
  }

  Widget _showList(List<User>? _userList) {
    return new ListView.builder(
        itemCount: _userList!.length,
        itemBuilder: (context, index) {
          User user = _userList[index];
          return ListTile(
            title: TextView.medium('${user.name} (${user.city})'),
            subtitle: TextView.tiny(
              '@${user.userName}',
              fontWeight: FontWeight.bold,
            ),
            onTap: () => _selectUser(user),
          );
        });
  }

  Widget _showProgress() {
    return Center(child: CircularProgressIndicator());
  }

  _buildTag(Function()? onTap, String? text, IconData icon) {
    return Tag(
      onTap: onTap,
      text: text,
      icon: Icon(icon, color: Colors.white),
      textColor: Colors.white,
      fullWidth: true,
    );
  }

  _buildUserInfoRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTag(
              () => call(_selectedUser?.phone), "Call", CupertinoIcons.phone),
          SizedBox(width: 14),
          _buildTag(() => launchMap(_selectedUser?.lat, _selectedUser?.long),
              _selectedUser?.city, CupertinoIcons.location_circle),
          SizedBox(width: 14),
          _buildTag(() => launchSite(_selectedUser?.website),
              _selectedUser?.website, CupertinoIcons.info),
        ],
      ),
    );
  }

  _buildNameRow() {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextView.large(
        '${_selectedUser?.name}',
        fontWeight: FontWeight.bold,
      ),
      SizedBox(width: 2),
      TextView.tiny('@${_selectedUser?.userName}', color: Colors.grey),
    ]);
  }

  void _selectUser(User? user) {
    setState(() {
      _selectedUser = user;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _userBloc.close();
  }
}
