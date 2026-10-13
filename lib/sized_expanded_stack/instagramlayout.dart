
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class InstagramLayout extends StatelessWidget {
  const InstagramLayout({super.key});

  final List<Map<String, String>> stories = const [
    {'name': 'Story 1', 'image': 'https://picsum.photos/id/1015/200/200'},
    {'name': 'Story 2', 'image': 'https://picsum.photos/id/1060/200/200'},
    {'name': 'Story 3', 'image': 'https://picsum.photos/id/225/200/200'},
    {'name': 'Story 4', 'image': 'https://picsum.photos/id/237/200/200'},
    {'name': 'Story 5', 'image': 'https://picsum.photos/id/1011/200/200'},
    {'name': 'Story 6', 'image': 'https://picsum.photos/id/1025/200/200'},
    {'name': 'Story 7', 'image': 'https://picsum.photos/id/1003/200/200'},
    {'name': 'Story 8', 'image': 'https://picsum.photos/id/1035/200/200'},
    {'name': 'Story 9', 'image': 'https://picsum.photos/id/1040/200/200'},
  ];

  final List<Map<String, String>> posts = const [
    {
      'username': 'user_1',
      'location': 'Bandung, Indonesia',
      'profile': 'https://picsum.photos/id/1015/200/200',
      'image': 'https://picsum.photos/id/1018/800/1000',
      'caption': 'Pemandangan hari ini',
    },
    {
      'username': 'user_2',
      'location': 'Bandung, Indonesia',
      'profile': 'https://picsum.photos/id/1060/200/200',
      'image': 'https://picsum.photos/id/1031/800/1000',
      'caption': 'Jalan-jalan sebentar',
    },
    {
      'username': 'user_3',
      'location': 'Lembang, Indonesia',
      'profile': 'https://picsum.photos/id/1011/200/200',
      'image': 'https://picsum.photos/id/1016/800/1000',
      'caption': 'Suasana sore ini',
    },
    {
      'username': 'user_4',
      'location': 'Bandung, Indonesia',
      'profile': 'https://picsum.photos/id/1025/200/200',
      'image': 'https://picsum.photos/id/1043/800/1000',
      'caption': 'Foto hari ini',
    },
    {
      'username': 'user_5',
      'location': 'Jawa Barat, Indonesia',
      'profile': 'https://picsum.photos/id/1003/200/200',
      'image': 'https://picsum.photos/id/1019/800/1000',
      'caption': 'Momen sederhana',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        title: const Text(
          'Instagram',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: const [
          Icon(Icons.favorite_border, color: Colors.white),
          SizedBox(width: 18),
          Icon(Icons.send_outlined, color: Colors.white),
          SizedBox(width: 15),
        ],
      ),

      // Hanya story dan postingan, tanpa menu bawah.
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: ScrollConfiguration(
              behavior: const MaterialScrollBehavior().copyWith(
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.trackpad,
                },
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  final story = stories[index];

                  return SizedBox(
                    width: 75,
                    child: Column(
                      children: [
                        Container(
                          width: 58,
                          height: 58,
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Colors.orange,
                                Colors.pink,
                                Colors.purple,
                              ],
                            ),
                          ),
                          child: ClipOval(
                            child: Image.network(
                              story['image']!,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) =>
                                  const Icon(Icons.person),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          story['name']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const Divider(height: 1, color: Colors.white24),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return PostCard(post: posts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PostCard extends StatefulWidget {
  final Map<String, String> post;

  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool liked = false;
  bool saved = false;

  @override
  Widget build(BuildContext context) {
    final post = widget.post;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(
            children: [
              ClipOval(
                child: Image.network(
                  post['profile']!,
                  width: 38,
                  height: 38,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      const CircleAvatar(radius: 19),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post['username']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      post['location']!,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.more_vert, color: Colors.white),
            ],
          ),
        ),
        AspectRatio(
          aspectRatio: 0.8,
          child: Image.network(
            post['image']!,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const Center(
              child: Icon(Icons.broken_image, color: Colors.white),
            ),
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() => liked = !liked);
              },
              icon: Icon(
                liked ? Icons.favorite : Icons.favorite_border,
                color: liked ? Colors.red : Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.chat_bubble_outline,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                setState(() => saved = !saved);
              },
              icon: Icon(
                saved ? Icons.bookmark : Icons.bookmark_border,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
          child: Text.rich(
            TextSpan(
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
              children: [
                TextSpan(
                  text: '${post['username']} ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: post['caption']!),
              ],
            ),
          ),
        ),
        const Divider(height: 1, color: Colors.white12),
      ],
    );
  }
}
