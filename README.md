# finch
 
# 💸 Flutter Payment App

A mobile application built using **Flutter**, implementing **BLoC** for state management and **Supabase** for authentication & data handling.  
Follows a clean dark-themed UI with animations and smooth transitions.

---

## 🚀 Features

- 🔐 Supabase Authentication (Login / Register / Logout)
- 🎯 Fully responsive UI
- ⚙️ BLoC pattern for state management
- ✅ Form validations
- 🌀 Clean animations (success pulse, screen transitions)
- 📱 Adaptive design for different screen sizes

---

## 📂 Screens Implemented

### 1. Splash Screen
- Auto-navigates based on authentication status:
  - ✅ If logged in → Home
  - ❌ If not → Login screen

### 2. Register / Login
- Custom input fields with validations
- Toggle between register/login
- Button transitions with gradient styles

### 3. Home Screen
- Shows wallet amount and payment UI
- **ℹ️ Tap on top-right info icon to logout**
- Custom gradient buttons
- Dark theme with clean layout

### 4. Payment Flow
- **Tap on "Explore Now" to open payment screen**
- Enter amount → validation check
- Navigate to:
  - "In Process" animation screen
  - Then "Success" screen with animated pulse effect

---

## 🔁 Navigation Flow

```text
Splash → (if logged in) → Home → Payment → Process → Success  
                   ↘ (else) → Login/Register
