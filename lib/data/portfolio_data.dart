import '../models/portfolio_model.dart';

class PortfolioData {
  static const String name = "Fayith Ahamed";
  static const String title = "iOS Developer | SwiftUI | Swift";
  static const String email = "fayithahamed007@gmail.com";
  static const String phone = "+91 96007 43644";
  static const String linkedin = "https://www.linkedin.com/in/fayith-ahamed/";
  static const String github = "https://github.com/fayith-ahamed?tab=repositories";
  static const String resumeUrl = "https://docs.google.com/document/d/1gmJ6ydQXMiZtQeu5Oic1aSvP-oB_35GwuK0hkl3qjM8/edit?usp=sharing";
  static const String location = "Madurai, India";

  static const String summary =
      "Results-driven iOS Developer with 3+ years of professional experience building high-performance, production-grade applications using Swift, SwiftUI, UIKit, and modern iOS architecture (MVVM, Clean Architecture, SOLID). Proven expertise in real-time trading systems, financial wallets, secure payment gateways, WebSocket live data pipelines, and on-device machine learning (CoreML + YOLOv8). Passionate about writing clean, maintainable code, optimizing performance, and delivering exceptional user experiences.";

  static const List<MetricItem> metrics = [
    MetricItem(
      value: "3+",
      label: "Years Experience",
      description: "Professional iOS engineering expertise",
    ),
    MetricItem(
      value: "8+",
      label: "Production iOS Apps",
      description: "Shipped and maintained in production",
    ),
    MetricItem(
      value: "10+",
      label: "App Store Releases",
      description: "Successful deployment & TestFlight cycles",
    ),
    MetricItem(
      value: "30+",
      label: "SwiftUI Components",
      description: "Reusable design system building blocks",
    ),
    MetricItem(
      value: "30%",
      label: "Performance Boost",
      description: "Optimized memory & rendering pipelines",
    ),
    MetricItem(
      value: "25%",
      label: "Crash Reduction",
      description: "Robust exception handling & debugging",
    ),
    MetricItem(
      value: "50%",
      label: "Faster Delivery",
      description: "Streamlined architecture & reusable components",
    ),
    MetricItem(
      value: "40%",
      label: "Dev Speed Gain",
      description: "Accelerated feature rollout across teams",
    ),
  ];

  static const List<SkillCategory> skillCategories = [
    SkillCategory(
      category: "Languages",
      skills: ["Swift", "Dart", "Objective-C (Interoperability)"],
    ),
    SkillCategory(
      category: "iOS Core",
      skills: [
        "SwiftUI",
        "UIKit",
        "Combine",
        "Core Data",
        "SwiftData",
        "Swift Concurrency (async/await)",
        "GCD (Grand Central Dispatch)",
        "AVFoundation"
      ],
    ),
    SkillCategory(
      category: "Architecture & Design",
      skills: [
        "MVVM",
        "Clean Architecture",
        "SOLID Principles",
        "Dependency Injection",
        "Design Patterns",
        "Modularization"
      ],
    ),
    SkillCategory(
      category: "Networking & Real-Time",
      skills: [
        "REST APIs",
        "URLSession",
        "Alamofire",
        "WebSockets",
        "Pusher",
        "JSON / Codable",
        "Deep Linking"
      ],
    ),
    SkillCategory(
      category: "AI & Computer Vision",
      skills: [
        "CoreML",
        "Vision Framework",
        "YOLOv8",
        "On-Device Inference",
        "Non-Max Suppression"
      ],
    ),
    SkillCategory(
      category: "Testing & Debugging",
      skills: [
        "XCTest",
        "Unit Testing",
        "Firebase Crashlytics",
        "Xcode Instruments",
        "Memory Profiling"
      ],
    ),
    SkillCategory(
      category: "Apple Ecosystem & DevOps",
      skills: [
        "Xcode",
        "Git & GitHub",
        "Swift Package Manager (SPM)",
        "TestFlight",
        "App Store Connect",
        "Provisioning & Signing",
        "APNs (Push Notifications)"
      ],
    ),
    SkillCategory(
      category: "Cross-Platform & AI Tools",
      skills: [
        "Flutter",
        "Provider",
        "Claude",
        "Gemini",
        "Codex",
        "Cursor / AI-Assisted Workflow"
      ],
    ),
  ];

  static const List<ExperienceItem> experiences = [
    ExperienceItem(
      role: "Mobile Application Developer (iOS)",
      company: "Pixel Web Solutions",
      location: "Madurai, India",
      period: "May 2023 – May 2026",
      highlights: [
        "Led the end-to-end design, development, and deployment of 8+ production-grade iOS applications, achieving 10+ successful App Store releases.",
        "Spearheaded complex crypto trading and financial trading applications (Savita, Armup, Bitmet, Tradyex, Zeus Trader) featuring real-time market data pipelines, WebSocket/Pusher feeds, and high-frequency order execution.",
        "Engineered robust financial transaction systems integrated with Stripe payment gateways, withdrawal workflows, and Sumsub KYC identity verification.",
        "Architected scalable applications using MVVM, Clean Architecture, and SOLID principles with Dependency Injection, reducing delivery timelines by 50%.",
        "Optimized app performance utilizing Swift Concurrency (async/await), Grand Central Dispatch (GCD), and Xcode Instruments, delivering a 30% boost in rendering speed and 25% crash reduction.",
        "Created a design system of 30+ reusable SwiftUI components, accelerating team development speed by 40% and ensuring consistent UI/UX across all products.",
        "Contributed to cross-platform mobile deliverables using Flutter and participated in Agile sprint planning and code reviews."
      ],
      technologies: [
        "Swift",
        "SwiftUI",
        "UIKit",
        "MVVM",
        "Clean Architecture",
        "Swift Concurrency",
        "WebSockets",
        "Pusher",
        "Combine",
        "Core Data",
        "Stripe SDK",
        "Sumsub KYC",
        "Flutter"
      ],
    ),
  ];

  static const List<ProjectItem> projects = [
    // Trading Applications
    ProjectItem(
      title: "Savita",
      subtitle: "High-Performance Crypto Trading Platform",
      category: "Trading Applications",
      description:
          "A professional-grade crypto trading iOS application delivering real-time market tickers, advanced order books, interactive charting, and seamless portfolio tracking.",
      responsibilities: [
        "Implemented real-time WebSocket and Pusher data streams for live crypto price updates and order book synchronization.",
        "Developed secure authentication, wallet balance management, and instant buy/sell trade execution workflows.",
        "Optimized asynchronous network calls using Swift Concurrency (async/await) and URLSession."
      ],
      technologies: ["Swift", "SwiftUI", "WebSockets", "Pusher", "MVVM", "Combine", "REST APIs"],
      architecture: "Clean Architecture + MVVM with Repository Pattern and Dependency Injection.",
      keyChallenges: [
        "Handling high-frequency WebSocket data updates without blocking the main UI thread.",
        "Ensuring bulletproof error handling during volatile market fluctuations and network interruptions."
      ],
      impact: [
        "Delivered a stable, crash-free trading experience for thousands of active daily users.",
        "Achieved sub-100ms UI responsiveness for live order book updates."
      ],
      appStoreUrl: "https://apps.apple.com",
    ),
    ProjectItem(
      title: "Armup",
      subtitle: "Advanced Financial Trading & Asset Management",
      category: "Trading Applications",
      description:
          "An enterprise-level trading platform enabling users to monitor multi-asset portfolios, execute trades, and analyze historical market trends.",
      responsibilities: [
        "Engineered modular SwiftUI navigation and reusable charting components.",
        "Integrated secure Keychain storage for user credentials and session tokens.",
        "Implemented local caching using Core Data for offline portfolio inspection."
      ],
      technologies: ["Swift", "SwiftUI", "Core Data", "Keychain", "Alamofire", "GCD"],
      architecture: "MVVM with Service-Oriented Architecture.",
      keyChallenges: [
        "Synchronizing local SQLite/Core Data persistence with remote server state upon reconnection."
      ],
      impact: [
        "Improved app launch time by 30% through optimized lazy loading and background caching."
      ],
    ),
    ProjectItem(
      title: "Bitmet",
      subtitle: "Crypto Exchange & Instant Swap App",
      category: "Trading Applications",
      description:
          "A feature-rich cryptocurrency exchange application built for fast swaps, portfolio diversification, and real-time asset alerts.",
      responsibilities: [
        "Built responsive trading view controllers and custom SwiftUI charts.",
        "Integrated custom push notifications (APNs) for price threshold alerts and order fulfillment notices."
      ],
      technologies: ["Swift", "SwiftUI", "APNs", "Combine", "REST APIs"],
      architecture: "MVVM with Clean Data Layer.",
      keyChallenges: [
        "Managing complex state across asynchronous network transactions and background push notifications."
      ],
      impact: [
        "Successfully released on the App Store with 5-star user ratings for speed and intuitive UI."
      ],
    ),
    ProjectItem(
      title: "Tradyex",
      subtitle: "Professional Stock & Commodity Trading Terminal",
      category: "Trading Applications",
      description:
          "A sophisticated mobile trading terminal designed for active traders needing low-latency data feeds and robust risk management tools.",
      responsibilities: [
        "Developed high-performance watchlist tables and order execution forms with client-side input validation.",
        "Conducted memory profiling and leak detection using Xcode Instruments."
      ],
      technologies: ["Swift", "UIKit", "SwiftUI", "WebSockets", "Xcode Instruments"],
      architecture: "Clean Architecture with Modularized Frameworks.",
      keyChallenges: [
        "Eliminating memory leaks in long-running WebSocket subscription sessions."
      ],
      impact: [
        "Achieved a 25% reduction in crash rates through rigorous unit testing and memory management."
      ],
    ),
    ProjectItem(
      title: "Zeus Trader",
      subtitle: "Institutional-Grade Trading & Analytics Suite",
      category: "Trading Applications",
      description:
          "An elite trading suite offering advanced analytical tools, customizable dashboards, and lightning-fast trade routing.",
      responsibilities: [
        "Designed and implemented modular UI architecture supporting adaptive layouts for iPhone and iPad.",
        "Optimized rendering pipelines for heavy data tables and real-time indicator overlays."
      ],
      technologies: ["Swift", "SwiftUI", "Combine", "Swift Concurrency", "Core Animation"],
      architecture: "MVVM + Clean Architecture.",
      keyChallenges: [
        "Maintaining 60 FPS smooth scrolling while rendering extensive real-time price matrices."
      ],
      impact: [
        "Enhanced overall app responsiveness by 30% across resource-constrained devices."
      ],
    ),

    // Wallet & Affiliate Projects
    ProjectItem(
      title: "AffiliateX",
      subtitle: "Affiliate Marketing & Commission Tracking Platform",
      category: "Wallet & Affiliate",
      description:
          "A comprehensive mobile app for affiliate marketers to track referral links, monitor real-time commission earnings, and manage payout schedules.",
      responsibilities: [
        "Integrated Stripe payment gateway for seamless earnings withdrawal and payout disbursement.",
        "Implemented secure biometric authentication (Face ID / Touch ID) for sensitive financial operations."
      ],
      technologies: ["Swift", "SwiftUI", "Stripe SDK", "LocalAuthentication", "REST APIs"],
      architecture: "MVVM Architecture with Secure Keychain integration.",
      keyChallenges: [
        "Guaranteeing secure token exchange and encrypted local data storage."
      ],
      impact: [
        "Processed thousands of secure affiliate payout transactions without financial discrepancy."
      ],
    ),
    ProjectItem(
      title: "EasyWallet",
      subtitle: "Secure Digital Wallet & Payment Gateway",
      category: "Wallet & Affiliate",
      description:
          "A user-friendly digital wallet supporting peer-to-peer transfers, digital currency holding, and Sumsub KYC identity verification workflows.",
      responsibilities: [
        "Integrated Sumsub KYC SDK for automated identity verification and compliance checks.",
        "Built transaction history search, filtering, and PDF statement export features."
      ],
      technologies: ["Swift", "UIKit", "SwiftUI", "Sumsub KYC", "PDFKit", "Core Data"],
      architecture: "Clean Architecture with Modular Service Layers.",
      keyChallenges: [
        "Ensuring smooth multi-step onboarding flows with third-party KYC verification SDKs."
      ],
      impact: [
        "Streamlined user onboarding completion rate by 40% with frictionless identity verification."
      ],
    ),

    // AI & Computer Vision
    ProjectItem(
      title: "IntelliVision",
      subtitle: "Real-time Object Detection — CoreML + YOLOv8",
      category: "AI & Computer Vision",
      description:
          "An advanced on-device computer vision iOS application leveraging CoreML & YOLOv8 models for real-time camera stream object detection and bounding box rendering.",
      responsibilities: [
        "Integrated AVFoundation camera capture session with CoreML model inference pipelines.",
        "Implemented Non-Max Suppression (NMS) and confidence score filtering to refine detection outputs.",
        "Optimized rendering layers to draw real-time bounding boxes at 30+ FPS."
      ],
      technologies: ["Swift", "CoreML", "Vision Framework", "YOLOv8", "AVFoundation", "Core Graphics"],
      architecture: "Pipeline-based real-time processing architecture.",
      keyChallenges: [
        "Minimizing processing latency between camera frame capture and on-device neural network inference."
      ],
      impact: [
        "Achieved real-time on-device object detection running smoothly at 30 FPS without cloud dependency."
      ],
      // githubUrl: "https://github.com/fayith-ahamed",
    ),
  ];

  static const List<EducationItem> education = [
    EducationItem(
      degree: "Master of Computer Applications (MCA)",
      institution: "Madurai Kamaraj University",
      period: "2023 – 2025",
      description: "Advanced coursework in software engineering, distributed systems, algorithms, and mobile computing.",
    ),
    EducationItem(
      degree: "B.Sc Computer Science",
      institution: "Madurai Kamaraj University College",
      period: "2020 – 2023",
      description: "Foundational computer science curriculum covering data structures, object-oriented programming, and database management.",
    ),
  ];

  static const List<AchievementItem> achievements = [
    AchievementItem(
      title: "1st Place – OKR Performance",
      organization: "Pixel Web Solutions",
      description: "Recognized for exceptional performance, outstanding sprint delivery, and exceeding organizational Key Results (OKRs) for mobile application development.",
    ),
  ];
}
