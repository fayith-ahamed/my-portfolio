import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/portfolio_data.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launchUrl(String urlString) async {
    final uri = Uri.parse(urlString);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                    "Let's Build Something Meaningful",
                    style: GoogleFonts.inter(
                      fontSize: isMobile ? 24 : 32,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Text(
                  "I am currently open to discussing iOS development opportunities, engineering roles, and challenging technical projects. Get in touch via email, phone, or LinkedIn.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: theme.colorScheme.onSurface.withOpacity(0.75),
                    height: 1.6,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  _contactCard(
                    context,
                    widget: const Icon(Icons.email_rounded, color: Color(0xFF3B82F6), size: 24),
                    title: "Email",
                    value: PortfolioData.email,
                    onTap: () => _launchUrl("mailto:${PortfolioData.email}"),
                  ),
                  _contactCard(
                    context,
                    widget: const Icon(Icons.phone_rounded, color: Color(0xFF3B82F6), size: 24),
                    title: "Phone",
                    value: PortfolioData.phone,
                    onTap: () => _launchUrl("tel:${PortfolioData.phone}"),
                  ),
                  _contactCard(
                    context,
                    widget: Image.network(
                      'https://img.icons8.com/color/48/linkedin.png',
                      width: 26,
                      height: 26,
                      errorBuilder: (c, e, s) => const Icon(Icons.business_center_rounded, color: Color(0xFF3B82F6), size: 24),
                    ),
                    title: "LinkedIn",
                    value: "fayith-ahamed",
                    onTap: () => _launchUrl(PortfolioData.linkedin),
                  ),
                  _contactCard(
                    context,
                    widget: Image.network(
                      'https://img.icons8.com/ios-filled/50/ffffff/github.png',
                      width: 24,
                      height: 24,
                      errorBuilder: (c, e, s) => const Icon(Icons.code_rounded, color: Color(0xFF3B82F6), size: 24),
                    ),
                    title: "GitHub",
                    value: "fayith-ahamed",
                    onTap: () => _launchUrl(PortfolioData.github),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contactCard(
    BuildContext context, {
    required Widget widget,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 280,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF131B2E) : Colors.white,
          borderRadius: BorderRadius.circular(16),
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
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3B82F6).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: widget,
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
              title,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
