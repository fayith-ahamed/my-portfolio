class MetricItem {
  final String value;
  final String label;
  final String description;

  const MetricItem({
    required this.value,
    required this.label,
    required this.description,
  });
}

class SkillCategory {
  final String category;
  final List<String> skills;

  const SkillCategory({
    required this.category,
    required this.skills,
  });
}

class ExperienceItem {
  final String role;
  final String company;
  final String location;
  final String period;
  final List<String> highlights;
  final List<String> technologies;

  const ExperienceItem({
    required this.role,
    required this.company,
    required this.location,
    required this.period,
    required this.highlights,
    required this.technologies,
  });
}

class ProjectItem {
  final String title;
  final String subtitle;
  final String category; // Trading, Wallet & Affiliate, AI / Computer Vision, SwiftUI Architecture
  final String description;
  final List<String> responsibilities;
  final List<String> technologies;
  final String architecture;
  final List<String> keyChallenges;
  final List<String> impact;
  final String? githubUrl;
  final String? appStoreUrl;

  const ProjectItem({
    required this.title,
    required this.subtitle,
    required this.category,
    required this.description,
    required this.responsibilities,
    required this.technologies,
    required this.architecture,
    required this.keyChallenges,
    required this.impact,
    this.githubUrl,
    this.appStoreUrl,
  });
}

class EducationItem {
  final String degree;
  final String institution;
  final String period;
  final String description;

  const EducationItem({
    required this.degree,
    required this.institution,
    required this.period,
    required this.description,
  });
}

class AchievementItem {
  final String title;
  final String organization;
  final String description;

  const AchievementItem({
    required this.title,
    required this.organization,
    required this.description,
  });
}
