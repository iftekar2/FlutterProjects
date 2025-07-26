import 'package:blog_app/components/blog.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BlogDatabase {
  // Database --> Blog
  final database = Supabase.instance.client.from('Blog');

  // Create a new blog
  Future createBlog(Blog newBlog) async {
    await database.insert(newBlog.toMap());
  }

  // Read a blog
  final stream = Supabase.instance.client
      .from('Blog')
      .stream(primaryKey: ['id'])
      .map((data) => data.map((blogMap) => Blog.fromMap(blogMap)).toList());

  // Update a blog
  Future updateBlog(Blog oldBlog, Blog newBlog) async {
    await database
        .update({
          'title': newBlog.title,
          'author': newBlog.author,
          'content': newBlog.content,
        })
        .eq('id', oldBlog.id!);
  }

  // Delete a blog
  Future deleteBlot(Blog blog) async {
    await database.delete().eq('id', blog.id!);
    ;
  }
}
