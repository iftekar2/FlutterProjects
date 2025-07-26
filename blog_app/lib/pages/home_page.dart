import 'package:blog_app/components/blog.dart';
import 'package:blog_app/components/blog_database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Blog database
  final blogDatabase = BlogDatabase();

  // Text controller
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    authorController.dispose();
    contentController.dispose();
    super.dispose();
  }

  // Create a new Blog
  void createNewBlog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xffedefef),
        title: Text("Create a new Blog"),
        content: Container(
          height: 400,
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Title"),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "Enter Blog Title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                ),
              ),

              SizedBox(height: 20),
              Text(
                "Author",
              ), // Removed Align since Column now handles alignment
              TextField(
                controller: authorController,
                decoration: InputDecoration(
                  hintText: "Enter Blog Author",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                ),
              ),

              SizedBox(height: 20),
              Text("Content"),
              TextField(
                controller: contentController,
                decoration: InputDecoration(
                  hintText: "Enter Blog Content",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 5,
              ),
            ],
          ),
        ),
        actions: [
          // Save Button
          TextButton(
            onPressed: () {
              // Read the text directly from the controllers
              final newBlog = Blog(
                title: titleController.text,
                author: authorController.text,
                content: contentController.text,
              );

              blogDatabase.createBlog(newBlog);

              // Optionally clear the text fields after creating
              titleController.clear();
              authorController.clear();
              contentController.clear();

              // Close the dialog
              Navigator.pop(context);
            },
            child: const Text("Create"), // Added const
          ),

          // Cancel Button
          TextButton(
            onPressed: () {
              // Optionally clear text fields on cancel too
              titleController.clear();
              authorController.clear();
              contentController.clear();
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
        ],
      ),
    );
  }

  // Update the Blog

  // Delete a Blog
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffedefef),
      appBar: AppBar(
        title: Text("Create Blog"),
        backgroundColor: const Color(0xffedefef),
        automaticallyImplyLeading: false,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewBlog,
        child: Icon(Icons.add),
      ),
    );
  }
}
