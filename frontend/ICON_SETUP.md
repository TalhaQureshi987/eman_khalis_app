# App Icon Setup Guide

## 🚀 Quick Setup

1. **Apni icon image ko place karein:**
   - `frontend/assets/icon/app_icon.png` (1024x1024 PNG)

2. **Packages install karein:**
   ```bash
   cd frontend
   flutter pub get
   ```

3. **Icons generate karein:**
   ```bash
   flutter pub run flutter_launcher_icons
   ```

4. **App rebuild karein:**
   ```bash
   flutter clean
   flutter pub get
   flutter run
   ```

## 📋 Requirements

- **Image Size**: 1024x1024 pixels
- **Format**: PNG
- **Location**: `frontend/assets/icon/app_icon.png`

Yeh package automatically saari required sizes generate kar dega:
- Android (mdpi, hdpi, xhdpi, xxhdpi, xxxhdpi)
- iOS (all required sizes)
- Web icons
- Windows & macOS icons

## 🎨 Your Icon Design

Based on your description, icon mein yeh elements hain:
- Black background
- Arabic: "الدين الخالص" (top, large)
- Arabic: "واعبدوا الله ولا تشركوا به شيئا" (middle)
- English: "THE REAL ISLAM" (bottom)
- Open book icon (top right)

Apni 1024x1024 PNG image ko `frontend/assets/icon/app_icon.png` mein place karein aur upar diye gaye commands run karein.



