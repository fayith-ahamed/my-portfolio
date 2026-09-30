import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'theme/app_theme.dart';
import 'data/portfolio_data.dart';
import 'widgets/nav_bar.dart';
import 'widgets/footer.dart';
import 'sections/hero_section.dart';
import 'sections/metrics_section.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/experience_section.dart';
import 'sections/projects_section.dart';
import 'sections/architecture_section.dart';
import 'sections/achievements_education_section.dart';
import 'sections/github_section.dart';
import 'sections/contact_section.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fayith Ahamed — iOS Developer | SwiftUI | Swift',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _architectureKey = GlobalKey();
  final GlobalKey _githubKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(String sectionId) {
    GlobalKey? targetKey;
    switch (sectionId) {
      case 'hero':
        targetKey = _heroKey;
        break;
      case 'about':
        targetKey = _aboutKey;
        break;
      case 'skills':
        targetKey = _skillsKey;
        break;
      case 'experience':
        targetKey = _experienceKey;
        break;
      case 'projects':
        targetKey = _projectsKey;
        break;
      case 'architecture':
        targetKey = _architectureKey;
        break;
      case 'github':
        targetKey = _githubKey;
        break;
      case 'contact':
        targetKey = _contactKey;
        break;
    }

    if (targetKey != null && targetKey.currentContext != null) {
      Scrollable.ensureVisible(
        targetKey.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _downloadResume() async {
    final uri = Uri.parse(PortfolioData.resumeUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Could not open resume link."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: NavBar(
        onNavTap: (id) {
          Navigator.of(context).maybePop(); // Close drawer if open
          _scrollToSection(id);
        },
      ),
      endDrawer: Drawer(
        backgroundColor: theme.scaffoldBackgroundColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Fayith Ahamed",
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.apple,
                          color: Colors.white,
                          size: 20,
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close_rounded),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                _drawerItem(context, "About", "about"),
                _drawerItem(context, "Skills", "skills"),
                _drawerItem(context, "Experience", "experience"),
                _drawerItem(context, "Projects", "projects"),
                _drawerItem(context, "Architecture", "architecture"),
                _drawerItem(context, "GitHub", "github"),
                _drawerItem(context, "Contact", "contact"),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _downloadResume,
                    icon: const Icon(Icons.description_rounded, size: 18),
                    label: const Text("View Resume"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B82F6),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            KeyedSubtree(key: _heroKey, child: HeroSection(
              onViewWork: () => _scrollToSection('projects'),
              onContact: () => _scrollToSection('contact'),
            )),
            const MetricsSection(),
            KeyedSubtree(key: _aboutKey, child: const AboutSection()),
            KeyedSubtree(key: _skillsKey, child: const SkillsSection()),
            KeyedSubtree(key: _experienceKey, child: const ExperienceSection()),
            KeyedSubtree(key: _projectsKey, child: const ProjectsSection()),
            KeyedSubtree(key: _architectureKey, child: const ArchitectureSection()),
            const AchievementsEducationSection(),
            KeyedSubtree(key: _githubKey, child: const GithubSection()),
            KeyedSubtree(key: _contactKey, child: const ContactSection()),
            Footer(onNavTap: _scrollToSection),
          ],
        ),
      ),
      floatingActionButton: AnimatedResumeButton(onPressed: _downloadResume),
    );
  }

  Widget _drawerItem(BuildContext context, String title, String sectionId) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          _scrollToSection(sectionId);
        },
        child: Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}

class AnimatedResumeButton extends StatefulWidget {
  final VoidCallback onPressed;

  const AnimatedResumeButton({super.key, required this.onPressed});

  @override
  State<AnimatedResumeButton> createState() => _AnimatedResumeButtonState();
}

class _AnimatedResumeButtonState extends State<AnimatedResumeButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: 1.0 + (_controller.value * 0.06),
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF3B82F6), Color(0xFF06B6D4), Color(0xFF6366F1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF3B82F6).withOpacity(0.5 + (_controller.value * 0.3)),
                  blurRadius: 18 + (_controller.value * 12),
                  spreadRadius: _controller.value * 2,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: widget.onPressed,
                borderRadius: BorderRadius.circular(30),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.description_rounded, color: Colors.white, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        "View Resume",
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
