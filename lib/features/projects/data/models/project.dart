class Project {
  final String coverImagePath;
  final String title;
  final String description;
  final bool isCover;
  final Map<String, String>? subLinks;
  final List<String> techStack;
  final Function()? onCodeTap;
  final Function()? onDemoTap;

  Project({
    this.isCover = true,
    this.subLinks,
    required this.coverImagePath,
    required this.title,
    required this.description,
    required this.techStack,
    this.onCodeTap,
    this.onDemoTap
  });
}