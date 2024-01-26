import 'package:flutter/material.dart';
import 'package:news_app/NewsModel.dart';
import 'package:news_app/Category.dart';
import 'package:news_app/ArticleView.dart';
import 'package:cached_network_image/cached_network_image.dart';


class CategoryNews extends StatefulWidget {
  String name;
  CategoryNews({required this.name});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<NewsModel> categories = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    ShowNews showCategoryNews = ShowNews();
    await showCategoryNews.getNewsCategory(widget.name.toLowerCase());
    categories = showCategoryNews.categories;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.name,
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
              icon: const Icon(Icons.search),
            ),// IconButton
          ],
          centerTitle: true,
          elevation: 0.0,
        ),

        body: SingleChildScrollView(
          child: Column(
            verticalDirection: VerticalDirection.down,
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 10,
                            spreadRadius: 3,
                            offset: const Offset(5, 5)
                      )
                      ]
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.sort,
                      size: 26,
                    ),
                  )
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return ShowCategory(
                          Image: categories[index].urlToImage!,
                          desc: categories[index].description!,
                          title: categories[index].title!,
                          url: categories[index].url!
                      );
                    }),
              )
            ],
          ),
        )

    );
  }
}

class ShowCategory extends StatelessWidget {
  String Image, desc, title, url;
  ShowCategory({required this.Image, required this.desc, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ArticleView(blogUrl: url)));
      },
      child: Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: Image,
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              title,
              maxLines: 2,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(desc, maxLines: 3,),
            SizedBox(height: 20.0,),
          ],
        ),
      ),
    );
  }
}


class CustomSearchDelegate extends SearchDelegate {
  List<NewsModel> result = [];

  getNews() async {
    ShowNews showCategoryNews = ShowNews();
    await showCategoryNews.getNewsSearch(query);
    result = showCategoryNews.categories;
    }

  @override
  List<Widget> buildActions (BuildContext context)
  {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: (){
          query='';
        },
      ),
    ];
  }

  @override
  Widget buildLeading (BuildContext context)
  {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context)
  {
    getNews();

    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: result.length,
        itemBuilder: (context, index) {
          return ShowCategory(
              Image: result[index].urlToImage!,
              desc: result[index].description!,
              title: result[index].title!,
              url: result[index].url!
          );
        });
  }


  @override
  Widget buildSuggestions (BuildContext context)
  {

    getNews();

    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: result.length,
        itemBuilder: (context, index) {
          return ShowCategory(
              Image: result[index].urlToImage!,
              desc: result[index].description!,
              title: result[index].title!,
              url: result[index].url!
          );
        });

    //return Text("data");
  }
}