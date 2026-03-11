class Project {
  final String coverImagePath;
  final String title;
  final String description;
  final List<String> techStack;
  final Function() onCodeTap;
  final Function() onDemoTap;

  Project({
    required this.coverImagePath,
    required this.title,
    required this.description,
    required this.techStack,
    required this.onCodeTap,
    required this.onDemoTap
  });
}