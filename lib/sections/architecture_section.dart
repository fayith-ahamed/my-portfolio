import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArchitectureSection extends StatelessWidget {
  const ArchitectureSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 900;

    final steps = [
      {
        "title": "1. SwiftUI & UIKit Views",
        "desc": "Declarative, reactive UI components built with SwiftUI and robust UIKit lifecycle controllers.",
        "icon": Icons.phone_iphone_rounded,
      },
      {
        "title": "2. ViewModel & State Management",
        "desc": "Publishers, `@Observable`, and Combine managing reactive data binding and UI state flows.",
        "icon": Icons.memory_rounded,
      },
      {
        "title": "3. Use Cases & Business Logic",
        "desc": "Encapsulated domain logic ensuring single responsibility and independent testability.",
        "icon": Icons.rule_rounded,
      },
      {
        "title": "4. Repository Pattern & Data Sources",
        "desc": "Abstracted data access coordinating remote REST/WebSocket APIs and local Core Data/SwiftData caching.",
        "icon": Icons.storage_rounded,
      },
      {
        "title": "5. Network & Persistence Layers",
        "desc": "URLSession, Alamofire, WebSockets, and encrypted Keychain/Core Data local persistence.",
        "icon": Icons.cloud_sync_rounded,
      },
    ];

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
                    "How I Build iOS Applications",
                    style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                "Clean Architecture, MVVM, and SOLID principles for maintainable, testable, and scalable apps.",
                style: GoogleFonts.inter(
                  fontSize: 15,
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 32),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: steps.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final step = steps[index];
                  return Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF131B2E) : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isDark ? const Color(0xFF253352) : const Color(0xFFCBD5E1),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF3B82F6).withOpacity(0.15),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            step["icon"] as IconData,
                            color: const Color(0xFF3B82F6),
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                step["title"] as String,
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.onSurface,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                step["desc"] as String,
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: theme.colorScheme.onSurface.withOpacity(0.75),
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
