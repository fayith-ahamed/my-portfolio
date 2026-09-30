import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/portfolio_data.dart';
import '../models/portfolio_model.dart';
import '../widgets/project_detail_modal.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  String _selectedCategory = "All";

  final List<String> _categories = [
    "All",
    "Trading Applications",
    "Wallet & Affiliate",
    "AI / Computer Vision",
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 900;

    final filteredProjects = _selectedCategory == "All"
        ? PortfolioData.projects
        : PortfolioData.projects.where((p) => p.category == _selectedCategory).toList();

    final List<List<ProjectItem>> rows = [];
    if (isMobile) {
      for (var proj in filteredProjects) {
        rows.add([proj]);
      }
    } else {
      for (int i = 0; i < filteredProjects.length; i += 2) {
        rows.add([
          filteredProjects[i],
          if (i + 1 < filteredProjects.length) filteredProjects[i + 1],
        ]);
      }
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 64,
        vertical: 60,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 24,
                    decoration: BoxDecoration(
                      color: const Color(0xFF3B82F6),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "Featured Projects",
                    style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Category Filter Chips (Fully Visible & Scrollable)
              SizedBox(
                height: 48,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    final cat = _categories[index];
                    final isSelected = _selectedCategory == cat;
                    return Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: ChoiceChip(
                        label: Text(cat),
                        selected: isSelected,
                        onSelected: (selected) {
                          setState(() {
                            _selectedCategory = cat;
                          });
                        },
                        selectedColor: const Color(0xFF3B82F6),
                        backgroundColor: isDark ? const Color(0xFF131B2E) : Colors.white,
                        labelStyle: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: isSelected ? Colors.white : theme.colorScheme.onSurface.withOpacity(0.8),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: isSelected
                                ? const Color(0xFF3B82F6)
                                : (isDark ? const Color(0xFF253352) : const Color(0xFFCBD5E1)),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 28),

              // Projects Rows
              Column(
                children: rows.map((rowProjs) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: isMobile
                        ? Column(
                            children: rowProjs.map((proj) => Padding(
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                  child: _buildProjectCard(context, proj, isDark),
                                )).toList(),
                          )
                        : IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(child: _buildProjectCard(context, rowProjs[0], isDark)),
                                const SizedBox(width: 24),
                                Expanded(
                                  child: rowProjs.length > 1
                                      ? _buildProjectCard(context, rowProjs[1], isDark)
                                      : const SizedBox(),
                                ),
                              ],
                            ),
                          ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectCard(BuildContext context, ProjectItem project, bool isDark) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => ProjectDetailModal(project: project),
        );
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF131B2E) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isDark ? const Color(0xFF253352) : const Color(0xFFCBD5E1),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3B82F6).withOpacity(0.12),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    project.category,
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF3B82F6),
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_outward_rounded,
                  size: 18,
                  color: Color(0xFF94A3B8),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              project.title,
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              project.subtitle,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF06B6D4),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              project.description,
              style: GoogleFonts.inter(
                fontSize: 13,
                color: theme.colorScheme.onSurface.withOpacity(0.7),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: project.technologies.take(4).map((tech) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF1A233A) : const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      tech,
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        color: theme.colorScheme.onSurface.withOpacity(0.8),
                      ),
                    ),
                  )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
