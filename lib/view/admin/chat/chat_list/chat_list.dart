import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shorinryu/controller/provider/admin/chat_provider/chat_provider.dart';
import 'package:shorinryu/controller/provider/admin/user_get_details/user_details_get_prov.dart';
import 'package:shorinryu/model/users_get_model/users_get_model.dart';
import 'package:shorinryu/view/admin/chat/chat_screen.dart';
import 'package:sizer/sizer.dart';

class AdminChatListScreen extends StatelessWidget {
  const AdminChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserGetProvider>(context);
    final users = userProvider.users;
    //  userProvider.fetchUsers();

    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.yellowAccent,
                )),
            backgroundColor: Colors.black.withOpacity(0.7300000190734863),
            title: const Text(
              'Chat',
              style: TextStyle(color: Colors.yellowAccent),
            ),
          ),
          body: FutureBuilder(
            future: userProvider.fetchUsers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    UsersGetModel user = users[index];

                    // Check if the user is not a superuser
                    if (user.isSuperuser == false) {
                      return Card(
                        child: ListTile(
                          title: Text(user.name ?? ''),
                          subtitle: Text(user.email ?? ''),
                          trailing: const Icon(Icons.arrow_forward_ios_rounded),
                          leading: ClipOval(
                            child: user.profilePicture != null
                                ? Image.network(
                                    user.profilePicture!,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  )
                                : const Icon(Icons.person),
                          ),
                          onTap: () async {
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();

                            final id = prefs.getString('userId');

                            // ignore: use_build_context_synchronously
                            Provider.of<MessageProvider>(context, listen: false)
                                .fetchNotification();
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AdminChatScreen(
                                  userdata: user,
                                  id: id,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      // Return an empty Container for superusers
                      return Container();
                    }
                  },
                );
              }
            },
          ),
        );
      },
    );
  }
}
