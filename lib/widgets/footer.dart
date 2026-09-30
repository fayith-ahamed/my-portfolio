import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Footer extends StatelessWidget {
  final Function(String) onNavTap;

  const Footer({super.key, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF04070D) : const Color(0xFFE2E8F0),
        border: Border(
          top: BorderSide(
            color: theme.dividerColor.withOpacity(0.15),
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1400),
          child: Column(
            children: [
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 24,
                runSpacing: 24,
                children: [
                  // Impressive Branding Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Text(
                            "Fayith Ahamed",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.apple, color: Colors.white, size: 20),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Crafted with precision & engineering",
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: theme.colorScheme.onSurface.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),

                  // Footer Nav Links (Responsive Wrap)
                  Wrap(
                    spacing: 16,
                    runSpacing: 8,
                    children: [
                      _footerLink(context, "About", "about"),
                      _footerLink(context, "Skills", "skills"),
                      _footerLink(context, "Experience", "experience"),
                      _footerLink(context, "Projects", "projects"),
                      _footerLink(context, "Contact", "contact"),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Divider(color: theme.dividerColor.withOpacity(0.2)),
              const SizedBox(height: 24),
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 16,
                runSpacing: 12,
                children: [
                  Text(
                    "© ${DateTime.now().year} Fayith Ahamed. All rights reserved.",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: theme.colorScheme.onSurface.withOpacity(0.5),
                    ),
                  ),
                  // Text(
                  //   "Built with Flutter Web",
                  //   style: GoogleFonts.inter(
                  //     fontSize: 12,
                  //     color: theme.colorScheme.onSurface.withOpacity(0.5),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _footerLink(BuildContext context, String title, String sectionId) {
    final theme = Theme.of(context);
    return TextButton(
      onPressed: () => onNavTap(sectionId),
      style: TextButton.styleFrom(
        foregroundColor: theme.colorScheme.onSurface.withOpacity(0.75),
        textStyle: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w500),
      ),
      child: Text(title),
    );
  }
}
