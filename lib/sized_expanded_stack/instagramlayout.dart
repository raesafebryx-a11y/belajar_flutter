
import 'package:flutter/material.dart';

class InstagramLayout extends StatelessWidget {
  const InstagramLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          // STORY
          SizedBox(
            height: 115,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Column(
                  children: [
                    SizedBox(height: 5),
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(
                        'https://picsum.photos/id/1015/200/200',
                      ),
                    ),
                    SizedBox(height: 5),
                    Text('Story 1'),
                  ],
                ),

                SizedBox(width: 12),

                Column(
                  children: [
                    SizedBox(height: 5),
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(
                        'https://picsum.photos/id/1060/200/200',
                      ),
                    ),
                    SizedBox(height: 5),
                    Text('Story 2'),
                  ],
                ),

                SizedBox(width: 12),

                Column(
                  children: [
                    SizedBox(height: 5),
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(
                        'https://picsum.photos/id/225/200/200',
                      ),
                    ),
                    SizedBox(height: 5),
                    Text('Story 3'),
                  ],
                ),

                SizedBox(width: 12),

                Column(
                  children: [
                    SizedBox(height: 5),
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(
                        'https://picsum.photos/id/237/200/200',
                      ),
                    ),
                    SizedBox(height: 5),
                    Text('Story 4'),
                  ],
                ),

                SizedBox(width: 12),

                Column(
                  children: [
                    SizedBox(height: 5),
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(
                        'https://picsum.photos/id/1011/200/200',
                      ),
                    ),
                    SizedBox(height: 5),
                    Text('Story 5'),
                  ],
                ),

                SizedBox(width: 12),

                Column(
                  children: [
                    SizedBox(height: 5),
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(
                        'https://picsum.photos/id/1003/200/200',
                      ),
                    ),
                    SizedBox(height: 5),
                    Text('Story 6'),
                  ],
                ),

                SizedBox(width: 12),

                Column(
                  children: [
                    SizedBox(height: 5),
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(
                        'https://picsum.photos/id/1035/200/200',
                      ),
                    ),
                    SizedBox(height: 5),
                    Text('Story 7'),
                  ],
                ),

                SizedBox(width: 12),

                Column(
                  children: [
                    SizedBox(height: 5),
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(
                        'https://picsum.photos/id/1040/200/200',
                      ),
                    ),
                    SizedBox(height: 5),
                    Text('Story 8'),
                  ],
                ),

                SizedBox(width: 12),

                Column(
                  children: [
                    SizedBox(height: 5),
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(
                        'https://picsum.photos/id/1025/200/200',
                      ),
                    ),
                    SizedBox(height: 5),
                    Text('Story 9'),
                  ],
                ),

                SizedBox(width: 12),

                Column(
                  children: [
                    SizedBox(height: 5),
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(
                        'https://picsum.photos/id/1024/200/200',
                      ),
                    ),
                    SizedBox(height: 5),
                    Text('Story 10'),
                  ],
                ),

                SizedBox(width: 12),

                Column(
                  children: [
                    SizedBox(height: 5),
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(
                        'https://picsum.photos/id/1000/200/200',
                      ),
                    ),
                    SizedBox(height: 5),
                    Text('Story 11'),
                  ],
                ),

                SizedBox(width: 12),

                Column(
                  children: [
                    SizedBox(height: 5),
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(
                        'https://picsum.photos/id/1001/200/200',
                      ),
                    ),
                    SizedBox(height: 5),
                    Text('Story 12'),
                  ],
                ),
              ],
            ),
          ),

          Divider(),

          // POSTINGAN PERTAMA
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: 5),
                  CircleAvatar(
                    radius: 19,
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/id/1015/200/200',
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'user_1',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Bandung, Indonesia'),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_vert),
                  ),
                ],
              ),

              Image.network(
                'https://picsum.photos/id/1018/800/1000',
                width: double.infinity,
                height: 350,
                fit: BoxFit.cover,
              ),

              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.chat_bubble_outline),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bookmark_border),
                  ),
                ],
              ),
            ],
          ),

          Divider(),

          // POSTINGAN KEDUA
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: 5),
                  CircleAvatar(
                    radius: 19,
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/id/1060/200/200',
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'user_2',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Bandung, Indonesia'),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_vert),
                  ),
                ],
              ),

              Image.network(
                'https://picsum.photos/id/1016/800/1000',
                width: double.infinity,
                height: 350,
                fit: BoxFit.cover,
              ),

              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.chat_bubble_outline),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bookmark_border),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
