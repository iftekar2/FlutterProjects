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
  void updateBlog(Blog blog) {
    // prefill existing data
    titleController.text = blog.title;
    authorController.text = blog.author;
    contentController.text = blog.content;

    // Show dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xffedefef),
        title: Text("Update Blog"),
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
              final updateBlog = Blog(
                title: titleController.text,
                author: authorController.text,
                content: contentController.text,
              );

              blogDatabase.updateBlog(blog, updateBlog);

              // Optionally clear the text fields after creating
              titleController.clear();
              authorController.clear();
              contentController.clear();

              // Close the dialog
              Navigator.pop(context);
            },
            child: const Text("Update"), // Added const
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

  // Delete a Blog
  void deleteBlog(Blog blog) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xffedefef),
        title: Text("Delete Blog"),
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
              blogDatabase.deleteBlog(blog);

              // Optionally clear the text fields after creating
              titleController.clear();
              authorController.clear();
              contentController.clear();

              // Close the dialog
              Navigator.pop(context);
            },
            child: const Text("Delete"), // Added const
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

  // Body of the page
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

      body: StreamBuilder(
        // Listen to the stream..
        stream: blogDatabase.stream,
        // to build the UI
        builder: (context, snapshot) {
          // Loading
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          // Loaded
          final blogs = snapshot.data!;

          // Build the UI
          return ListView.builder(
            itemCount: blogs.length,
            itemBuilder: (context, index) {
              // Get each Blog
              final blog = blogs[index];

              // Return a Blog
              return Center(
                child: SizedBox(
                  width: 400,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        children: [
                          Text(
                            blog.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple, // Example style
                            ),
                          ),

                          SizedBox(height: 20),
                          Text(
                            'by ${blog.author}',
                            style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey[700],
                            ),
                          ),

                          SizedBox(height: 10),
                          Text(
                            blog.content,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    updateBlog(blog);
                                  },
                                  child: Text("Edit"),
                                ),
                                SizedBox(width: 10),
                                TextButton(
                                  onPressed: () {
                                    deleteBlog(blog);
                                  },
                                  child: Text("Delete"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
