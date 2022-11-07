import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DevelopersScreen extends StatelessWidget {
  const DevelopersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Know your developers")),
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Text("App developer"),
          ),
          DeveloperTile(
            name: "Harshpreet Singh Johar",
            social: "https://www.linkedin.com/in/harshjohar/",
            photo:
                "https://media-exp1.licdn.com/dms/image/C4D03AQEo1BSVMZ-PWg/profile-displayphoto-shrink_800_800/0/1642917136421?e=1673481600&v=beta&t=9-UBCpEEgDMXgbPX725I0-WgCbmyF3kkG6sDn46OnFE",
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Text("ML Engineers"),
          ),
          DeveloperTile(
            name: "Divyansh Agarwal",
            social: "https://www.linkedin.com/in/divyansh-agarwal-011b80195/",
            photo:
                "https://media-exp1.licdn.com/dms/image/C4D03AQH0ucQpTgtwQA/profile-displayphoto-shrink_400_400/0/1593055911661?e=1673481600&v=beta&t=K7hf3eCK9vlT8Kql_rL9xNA4ZJPRcHZLIEjqqXX0Ui4",
          ),
          DeveloperTile(
            name: "Vibhu Chandranees Bhanot",
            social:
                "https://www.linkedin.com/in/vibhu-chandransh-bhanot-624720192/",
            photo:
                "https://media-exp1.licdn.com/dms/image/C5603AQEP5N-4p7jCww/profile-displayphoto-shrink_400_400/0/1613653685640?e=1673481600&v=beta&t=dzjoJC-5F7Gpd_kRAuXQ-YQq-w_GQjK82J_kOF43R-Y",
          ),
        ],
      ),
    );
  }
}

class DeveloperTile extends StatelessWidget {
  const DeveloperTile({
    Key? key,
    required this.name,
    required this.photo,
    required this.social,
  }) : super(key: key);
  final String name;
  final String social;
  final String photo;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(
          photo,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(
          name,
        ),
        trailing: CupertinoButton(
          onPressed: () {},
          child: Image.network(
            "https://cdn-icons-png.flaticon.com/512/174/174857.png",
            height: 25,
          ),
        ),
      ),
    );
  }
}
