# Icon Regenerate Instructions

## Flutter Logo Remove Karne Ke Liye:

1. **Icons Generate Karein:**
   ```bash
   cd frontend
   flutter pub run flutter_launcher_icons
   ```

2. **Agar command fail ho, to yeh try karein:**
   ```bash
   dart run flutter_launcher_icons
   ```

3. **App Clean Karein:**
   ```bash
   flutter clean
   ```

4. **Packages Reinstall Karein:**
   ```bash
   flutter pub get
   ```

5. **App Rebuild Karein:**
   ```bash
   flutter run
   ```

## Important:
- Icon file `The-Real-Islam.png` already `frontend/assets/icon/` mein hai
- Pubspec.yaml mein path sahi hai
- Icons generate hone ke baad app rebuild karna zaroori hai

## Android Icons Location:
After generation, icons will be in:
- `android/app/src/main/res/mipmap-*/ic_launcher.png`

## iOS Icons Location:
After generation, icons will be in:
- `ios/Runner/Assets.xcassets/AppIcon.appiconset/`



