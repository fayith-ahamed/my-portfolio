import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/portfolio_data.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewWork;
  final VoidCallback onContact;

  const HeroSection({
    super.key,
    required this.onViewWork,
    required this.onContact,
  });

  Future<void> _launchUrl(String urlString) async {
    final uri = Uri.parse(urlString);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 900;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 64,
        vertical: isMobile ? 40 : 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildProfileVisual(context, isMobile: true),
                    const SizedBox(height: 32),
                    _buildHeroContent(context, isMobile: true),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 7,
                      child: _buildHeroContent(context, isMobile: false),
                    ),
                    const SizedBox(width: 48),
                    Expanded(
                      flex: 5,
                      child: _buildProfileVisual(context, isMobile: false),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildHeroContent(BuildContext context, {required bool isMobile}) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Availability Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF3B82F6).withOpacity(0.12),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: const Color(0xFF3B82F6).withOpacity(0.3),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFF10B981),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "Available for iOS Developer Roles",
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF3B82F6),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Headline
        Text(
          "Hi! I'm Fayith Ahamed",
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.inter(
            fontSize: isMobile ? 22 : 28,
            fontWeight: FontWeight.w500,
            color: theme.colorScheme.onSurface.withOpacity(0.8),
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            Text(
              "iOS Developer",
              textAlign: isMobile ? TextAlign.center : TextAlign.start,
              style: GoogleFonts.inter(
                fontSize: isMobile ? 38 : 52,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.5,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(width: 12),
            const Icon(
              Icons.apple,
              color: Colors.white,
              size: 42,
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Summary (Punchy & Minimal)
        Text(
          "3+ years building high-performance production iOS apps. Specialized in SwiftUI, Clean Architecture, real-time trading systems, and secure fintech workflows.",
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.inter(
            fontSize: isMobile ? 15 : 17,
            color: theme.colorScheme.onSurface.withOpacity(0.75),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 36),

        // Modern 2026 Styled CTA Buttons
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            // "Let's Connect" - Glowing Electric Blue Gradient Button
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF3B82F6).withOpacity(0.45),
                    blurRadius: 20,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: onContact,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  textStyle: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                child: const Text("Let's Connect"),
              ),
            ),

            // "See My Work" - Modern Glass Outlined Button with Blue Border
            OutlinedButton(
              onPressed: onViewWork,
              style: OutlinedButton.styleFrom(
                foregroundColor: theme.colorScheme.onSurface,
                backgroundColor: const Color(0xFF131D31),
                side: const BorderSide(color: Color(0xFF3B82F6), width: 1.5),
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                textStyle: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              child: const Text("See My Work"),
            ),

            // "View Resume" - Modern Glass Outlined Button with Cyan Border
            OutlinedButton(
              onPressed: () async {
                final uri = Uri.parse(PortfolioData.resumeUrl);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: theme.colorScheme.onSurface,
                backgroundColor: const Color(0xFF131D31),
                side: const BorderSide(color: Color(0xFF06B6D4), width: 1.5),
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                textStyle: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              child: const Text("View Resume"),
            ),
          ],
        ),
        const SizedBox(height: 32),

        // Floating Tech Badges
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            _techBadge(context, "Swift"),
            _techBadge(context, "SwiftUI"),
            _techBadge(context, "Clean Architecture"),
            _techBadge(context, "MVVM"),
            _techBadge(context, "WebSockets"),
            _techBadge(context, "Core Data"),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileVisual(BuildContext context, {required bool isMobile}) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: isMobile ? 320 : 400,
          maxHeight: isMobile ? 400 : 500,
        ),
        child: Container(
          height: isMobile ? 380 : 520,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF3B82F6).withOpacity(0.02),
                blurRadius: 35,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(
            'assets/images/profile_1.png',
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF3B82F6), Color(0xFF131D31)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.person_rounded,
                        size: 70,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Place vertical half pic at\nassets/images/profile.png",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _techBadge(BuildContext context, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF131D31),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF253352)),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF94A3B8),
        ),
      ),
    );
  }
}
