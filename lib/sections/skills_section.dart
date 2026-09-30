import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/portfolio_data.dart';
import '../models/portfolio_model.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 900;

    final categories = PortfolioData.skillCategories;
    final List<List<SkillCategory>> rows = [];
    if (isMobile) {
      for (var cat in categories) {
        rows.add([cat]);
      }
    } else {
      for (int i = 0; i < categories.length; i += 2) {
        rows.add([
          categories[i],
          if (i + 1 < categories.length) categories[i + 1],
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
                    "Skills & Technical Expertise",
                    style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              Column(
                children: rows.map((rowCats) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: isMobile
                        ? Column(
                            children: rowCats.map((cat) => Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: _buildSkillCard(context, cat, isDark),
                                )).toList(),
                          )
                        : IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(child: _buildSkillCard(context, rowCats[0], isDark)),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: rowCats.length > 1
                                      ? _buildSkillCard(context, rowCats[1], isDark)
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

  Widget _buildSkillCard(BuildContext context, SkillCategory cat, bool isDark) {
    final theme = Theme.of(context);
    return Container(
      constraints: const BoxConstraints(minHeight: 200),
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF3B82F6).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.code_rounded,
                  color: Color(0xFF3B82F6),
                  size: 18,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  cat.category,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: cat.skills
                .map((skill) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF1A233A) : const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: isDark ? const Color(0xFF253352) : const Color(0xFFE2E8F0),
                        ),
                      ),
                      child: Text(
                        skill,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: theme.colorScheme.onSurface.withOpacity(0.85),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
