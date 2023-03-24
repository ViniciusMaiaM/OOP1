void main(){
  User vini = new User("Vinicius", "vinicius@yahoo.com", "1234");
  vini.createPost("O professor Fabricio é um ótimo professor e irei receber pontos extras por esta atividade");
  SocialNetwork facebook = new SocialNetwork();
  facebook.addUser(vini);
  print(facebook);
}

class SocialNetwork{
  List<User> users = [];

  void addUser(User user) => users.add(user);

  void removeUser(User user) => users.remove(user);

  User createUser(String userName, String email, String password) {
    User user = User(userName, email, password);
    addUser(user);
    return user;
  }

  @override
  String toString() => "\nUsers: ${users.join(", ")}";
}

class User{
  String userName;
  String email;
  String _password;
  List<Post> posts = [];

  User(this.userName, this.email, this._password);

  String get password => _password;

  set password(String password) => _password = password;

  void createPost(String content) => posts.add(Post(this, content));

  void deletePost(Post post) => posts.remove(post);

  @override
  String toString() => "\nUser: ${this.userName} \nEmail: ${this.email} \nPosts: ${this.posts}";
}


class Post{
  final User user;
  String content;
  List<User> likes = [];
  List<Comment> comments = [];

  void updateContent(String newContent) => content = newContent;

  void likePost(User user) => likes.add(user);

  Post(this.user,this.content);

  @override
  String toString() {
    String likesStr = likes.isEmpty ? "No likes" : "Likes: ${likes.join(", ")}";
    String commentsStr = comments.isEmpty ? "No comments" : "Comments: ${comments.join(", ")}";
    return "\n\tContent: ${this.content} \n\t${likesStr} \n\t${commentsStr}\n";
  }
}

class Comment{
  User user;
  String content;

  Comment(this.user,this.content);
}
