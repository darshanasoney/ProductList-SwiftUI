# ProductList-SwiftUI
# 🏍 Product Catalogue App

A demo iOS app built using **SwiftUI**, **MVVM**, and **async/await**. It showcases a product catalogue with a persistent shopping cart system.

---

## ✅ Features

- 🔍 Product grid layout (UICollectionView-like)
- 📄 Product detail screen with image, description, rating
- 🛒 Add to Cart with quantity stepper (+ / −)
- 🚹 Clear Cart functionality
- 📀 Persistent Cart using UserDefaults
- 🔄 async/await hybrid for API/data flow
- 🔮 Unit, UI Testing
- 📱 Adaptive SwiftUI UI

---

## 🫠 Architecture

### MVVM + Dependency Injection

```
├── Models/
│   └── Product.swift, CartItem.swift
├── ViewModels/
│   └── ProductListViewModel.swift
├── Views/
│   ├── ProductListView.swift
│   ├── ProductDetailView.swift
│   ├── ProductGridItemView.swift
│   └── CartView.swift
├── Services/
│   └── ProductService.swift (protocol-based DI)
├── Manager/
│   └── CartManager.swift (shared @StateObject)
```

## 📎 Assumptions

- Local-only cart with UserDefaults (no backend sync)
- Placeholder/mock API for product list

---

## ⏱ Time Taken

| Task                          | Duration            |
| ----------------------------- | ------------------- |
| Basic UI & grid layout        | 1.5 hours           |
| MVVM + async/await            | 1 hour              |
| Cart + quantity logic         | 1.5 hours           |
| Persistence with UserDefaults | 0.5 hour            |
| Testing (unit, UI)            | 1.5 hours           |
| Polish, navigation, README    | 1 hour              |
| **Total**                     | **7 hours** approx. |

---

## 🎥 App Demo

>  [Link to Demo](https://drive.google.com/file/d/1tRmgRuJpTCMJNFp19mTbXX87w65L-09J/view?usp=sharing) 

---

## 💪 Testing

### Unit Tests

- `Xiteb_mCommerceTests.swift`: add/remove, total, quantity, persistence for cart

### UI Tests

- `Xiteb_mCommerceUITests.swift`: simulate tapping on Add to Cart and validate CartView navigation

### Contact Info
- Phone: 9723728796
- Email: darshana111soney@gmail.com

