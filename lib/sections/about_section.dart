import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 900;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 64,
        vertical: 80,
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
                    "Engineering Profile",
                    style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Container(
                padding: EdgeInsets.all(isMobile ? 24 : 40),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF131B2E) : Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: isDark ? const Color(0xFF253352) : const Color(0xFFCBD5E1),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Building High-Performance iOS Systems",
                      style: GoogleFonts.inter(
                        fontSize: isMobile ? 20 : 24,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Results-driven iOS Developer with 3+ years of professional experience specializing in Swift, SwiftUI, UIKit, and Clean Architecture. Expert in real-time trading platforms, secure payment gateways, and scalable mobile systems.",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: theme.colorScheme.onSurface.withOpacity(0.8),
                        height: 1.7,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        _aboutHighlight(context, "8+ Production Apps Shipped"),
                        _aboutHighlight(context, "10+ App Store Releases"),
                        _aboutHighlight(context, "30% Performance Boost"),
                        _aboutHighlight(context, "Clean Architecture & MVVM"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _aboutHighlight(BuildContext context, String text) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A233A) : const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? const Color(0xFF253352) : const Color(0xFFCBD5E1),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle_rounded, color: Color(0xFF3B82F6), size: 18),
          const SizedBox(width: 8),
          Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
