# Fayith Ahamed — iOS Developer Portfolio

A production-quality, responsive single-page personal portfolio website built with **Flutter Web**, featuring a dark-first modern design inspired by Apple, Linear, and Vercel.

---

## Professional Overview

* **Name:** Fayith Ahamed
* **Role:** iOS Developer | SwiftUI | Swift | Modern iOS Architecture
* **Experience:** 3+ Years Professional Experience (Pixel Web Solutions)
* **Domain Expertise:** Real-Time Trading Systems, Crypto Exchanges, Financial Wallets, Secure Payment Gateways (Stripe, Sumsub KYC), and On-Device Machine Learning (CoreML + YOLOv8).

---

## Getting Started & Running Locally

### Prerequisites
* [Flutter SDK](https://docs.flutter.dev/get-started/install) (^3.5.4 or later)
* Chrome browser

### Setup & Run

1. Clone or open the repository.
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the application in Chrome:
   ```bash
   flutter run -d chrome
   ```

---

## Production Release & Build

To generate an optimized release build for deployment:

```bash
flutter build web --release
```

The output files will be located in `build/web/`.

---

## Deployment Instructions

### 1. GitHub Pages
1. Build the web app:
   ```bash
   flutter build web --release --base-href "/my_portfolio/"
   ```
2. Deploy the `build/web` directory to your GitHub repository's `gh-pages` branch.

### 2. Vercel
1. Install Vercel CLI or connect your GitHub repository to Vercel.
2. Build Command: `flutter build web --release`
3. Output Directory: `build/web`

### 3. Firebase Hosting
1. Initialize Firebase:
   ```bash
   firebase init hosting
   ```
2. Set public directory to `build/web`.
3. Deploy:
   ```bash
   flutter build web --release
   firebase deploy
   ```

---

## Project Structure

```text
lib/
├── main.dart
├── theme/
│   └── app_theme.dart
├── models/
│   └── portfolio_model.dart
├── data/
│   └── portfolio_data.dart
├── widgets/
│   ├── nav_bar.dart
│   ├── footer.dart
│   └── project_detail_modal.dart
└── sections/
    ├── hero_section.dart
    ├── metrics_section.dart
    ├── about_section.dart
    ├── skills_section.dart
    ├── experience_section.dart
    ├── projects_section.dart
    ├── architecture_section.dart
    ├── achievements_education_section.dart
    ├── github_section.dart
    └── contact_section.dart
```

