import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String) onNavTap;

  const NavBar({
    super.key,
    required this.onNavTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1100;
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor.withOpacity(0.85),
        border: Border(
          bottom: BorderSide(
            color: theme.dividerColor.withOpacity(0.15),
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo / Brand
              InkWell(
                onTap: () => onNavTap('hero'),
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Fayith Ahamed",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.apple,
                            color: Colors.white,
                            size: 24,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Desktop Navigation Links
              if (!isMobile) ...[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _navItem(context, "About", "about"),
                    _navItem(context, "Skills", "skills"),
                    _navItem(context, "Experience", "experience"),
                    _navItem(context, "Projects", "projects"),
                    _navItem(context, "Architecture", "architecture"),
                    _navItem(context, "GitHub", "github"),
                    _navItem(context, "Contact", "contact"),
                  ],
                ),
              ],

              // Mobile Menu Button
              if (isMobile)
                IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: Icon(
                    Icons.menu_rounded,
                    color: theme.colorScheme.onSurface,
                  ),
                  tooltip: "Open Menu",
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(BuildContext context, String title, String sectionId) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: () => onNavTap(sectionId),
        style: TextButton.styleFrom(
          foregroundColor: theme.colorScheme.onSurface.withOpacity(0.8),
          textStyle: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        child: Text(title),
      ),
    );
  }
}
