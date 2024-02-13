import 'package:flutter/material.dart';
import 'package:vcnafacul/components/atoms/my_text.dart';
import 'package:vcnafacul/entitys/user/user_entity.dart';

class CustomDrawerHeader extends StatelessWidget {
  final UserEntity user;
  const CustomDrawerHeader({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String image = 'assets/1705778628836.png';
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(image),
                ),
              ),
              MyText(text: '${user.firstName} ${user.lastName}'),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: MyText(text: user.email),
              )
            ],
          ),
        )
      ],
    );
  }
}
