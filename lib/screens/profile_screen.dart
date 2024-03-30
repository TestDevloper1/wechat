import 'package:flutter/material.dart';

import '../model/meme_model.dart';
import '../serivices/api.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Meme> memes = [];

  @override
  void initState() {
    super.initState();
    fetchMemes();
  }

  Future<void> fetchMemes() async {
    try {
      MemesService api = MemesService();
      List<Meme> fetchedMemes = await api.fetchMemes();
      setState(() {
        memes = fetchedMemes;
      });
    } catch (error) {
      print('Failed to fetch memes: $error');
      // Handle error gracefully
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, left: 12),
      child: Container(
        height: 80,
        decoration: const BoxDecoration(),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          itemCount: memes.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final meme = memes[index];
            return Padding(
              padding: const EdgeInsets.all(5),
              child: InkWell(
                onTap: () {
                  print('story');
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    image: DecorationImage(
                      image: NetworkImage('https://twilsms.com/meme_admin/${meme.thumbnail}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}




class ChatProfileScreen extends StatefulWidget {
  const ChatProfileScreen({super.key});

  @override
  _ChatProfileScreenState createState() => _ChatProfileScreenState();
}

class _ChatProfileScreenState extends State<ChatProfileScreen> {
  List<Meme> memes = [];

  @override
  void initState() {
    super.initState();
    fetchMemes();
  }

  Future<void> fetchMemes() async {
    try {
      MemesService api = MemesService();
      List<Meme> fetchedMemes = await api.fetchMemes();
      setState(() {
        memes = fetchedMemes;
      });
    } catch (error) {
      print('Failed to fetch memes: $error');
      // Handle error gracefully
    }
  }
  //'https://twilsms.com/meme_admin/${meme.thumbnail}'
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            // width: 80,
            decoration: const BoxDecoration(),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
              // itemCount: memes.length,
              itemCount: 8,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final meme = memes[index];
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: InkWell(
                    onTap: () {

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: Colors.grey.shade100,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade100,
                              image: DecorationImage(
                                  image:NetworkImage('https://twilsms.com/meme_admin/${meme.thumbnail}'),
                                  fit: BoxFit.cover
                              ),
                            ),
                          ),
                          // if(imageUrl.isEmpty)
                          // Container(
                          //   width: 80,
                          //   height: 80,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(10),
                          //     color: Colors.grey.shade100,
                          //     image: DecorationImage(
                          //         image:NetworkImage('https://twilsms.com/meme_admin/$thumbna'),
                          //         fit: BoxFit.cover
                          //     ),
                          //   ),
                          //   child: Center(
                          //     child: Wrap(
                          //       children: [
                          //         // if (Url.contains("mp4"))
                          //         Icon(Icons.play_arrow,color: Colors.grey,size: 50),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 25),
                                Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width * 0.6,
                                      child: ListTile(
                                        title:  Text(meme.description.trim(),
                                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    )
                                    // Spacer(),
                                    // Icon(Icons.search)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}