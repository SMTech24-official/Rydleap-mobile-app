class Urls {
  static const String _baseUrl = 'https://music-app-web.vercel.app/api/v1';
  static const String registration = '$_baseUrl/user/register';
  static const String login = '$_baseUrl/auth/login';

  static const String baseUrl = 'https://music-app-web.vercel.app/api/v1';
  // static const String registration = '$baseUrl/user/register';
  // static const String login = '$baseUrl/auth/login';

  // static const String createTask = '$_baseUrl/createTask';
  // static const String newTasks = '$_baseUrl/listTaskByStatus/New';
  // static const String completedTasks = '$_baseUrl/listTaskByStatus/Completed';
  // static const String taskStatusCount = '$_baseUrl/taskStatusCount';
  // static String deleteTask(String id) => '$_baseUrl/deleteTask/$id';

  static String updateProfile = '$_baseUrl/profileUpdate';
  static String getSongs = '$_baseUrl/songs';
  static String getblogs = '$_baseUrl/blogs';
  static String createblogs = '$_baseUrl/blogs';
  static String updateblogs = '$_baseUrl/blogs';
  static String getCategory = '$_baseUrl/categories';

  // static String updateProfile = '$baseUrl/profileUpdate';
}
