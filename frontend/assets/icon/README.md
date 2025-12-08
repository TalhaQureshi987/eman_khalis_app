# App Icon Setup Instructions

## 📱 App Icon Requirements

Aapko yahan ek **1024x1024 pixels** ki PNG image file chahiye jo app ka icon hogi.

## 🎨 Image Requirements:
- **Size**: 1024x1024 pixels (square)
- **Format**: PNG (with transparency support)
- **File Name**: `app_icon.png`
- **Background**: Black background with white text (as per your design)

## 📝 Steps:

1. **Apni icon image ko yahan place karein:**
   - File name: `app_icon.png`
   - Location: `frontend/assets/icon/The-Real-Islam.png`

2. **Flutter packages install karein:**
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

## 🎯 Icon Design (Based on your description):
- Black background
- Arabic text: "الدين الخالص" (top)
- Arabic text: "واعبدوا الله ولا تشركوا به شيئا" (middle)
- English text: "THE REAL ISLAM" (bottom)
- Open book icon (top right)

## ⚠️ Important:
- Icon image **1024x1024** honi chahiye
- PNG format with transparency
- High quality image use karein



