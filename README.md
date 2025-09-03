# 🚌 Bus Stop Tracker (MVP)

A simple Flutter app built with **GetX** and **MVC pattern**, submitted as part of the **Evide Take-Home Assignment**.  
The app demonstrates list/detail UI, local persistence, and search functionality.

---

## 📱 Features

- **Bus Stop Model (`BusStop`)**
    - name, latitude, longitude, and time difference
- **Local Persistence**
    - JSON mock data (`assets/mock/stops.json`)
- **State Management**
    - GetX Controller (`StopController`)
- **Views**
    - `HomeView` → List of bus stops
    - `DetailsView` → Individual stop details
- **Search**
    - Filter bus stops by name
- **Reusable Widgets**
    - `StopTile` for consistent UI

---

## 📂 Folder Structure (MVC)

