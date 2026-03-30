class SubLinks {
  final String feLink;
  final String beLink;

  const SubLinks({
    required this.feLink,
    required this.beLink
  });
}

class Project {
  final String coverImagePath;
  final String title;
  final String description;
  final bool isCover;
  final SubLinks? subLinks;
  final List<String> techStack;
  final Function()? onCodeTap;
  final Function() onDemoTap;

  Project({
    this.isCover = true,
    this.subLinks,
    required this.coverImagePath,
    required this.title,
    required this.description,
    required this.techStack,
    this.onCodeTap,
    required this.onDemoTap
  });
}