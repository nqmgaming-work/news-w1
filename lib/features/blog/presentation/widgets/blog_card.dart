import 'package:first_pj/core/utils/caculate_reading_time.dart';
import 'package:first_pj/features/blog/domain/entities/blog.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  final Blog blog;
  final Color color;

  const BlogCard({super.key, required this.blog, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16).copyWith(bottom: 4),
      padding: const EdgeInsets.all(16),
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.5), color],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: blog.topics
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Chip(
                            label: Text(e),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              Text(
                blog.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                blog.content,
                style: const TextStyle(
                  fontSize: 16,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Text("${calculateReadingTime(blog.content)} min(s) read")
        ],
      ),
    );
  }
}
