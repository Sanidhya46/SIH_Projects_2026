# Smart India Hackathon Innovation Hub
## Dual Solution Workspace: Neer Kavach (PS 26257) & Saurya Rakshak

This repository houses two complete, production-ready SIH project portals with full isolation, interactive simulations, research citations, and prototype hardware engineering specifications.

---

### 🌐 Live Local Server Endpoints
The local web server is currently running:
- **Master Dual Portal:** [http://localhost:5000/](http://localhost:5000/)
- **Neer Kavach Isolated View:** [http://localhost:5000/#neer-kavach](http://localhost:5000/#neer-kavach)
- **Saurya Rakshak Isolated View:** [http://localhost:5000/#saurya-rakshak](http://localhost:5000/#saurya-rakshak)
- **Neer Kavach 3D Simulation (Standalone):** [http://localhost:5000/Neer_kavach/simulation.html](http://localhost:5000/Neer_kavach/simulation.html)
- **Saurya Rakshak 12-Scene Simulation (Standalone):** [http://localhost:5000/Saurya_Rakshak/simulation.html](http://localhost:5000/Saurya_Rakshak/simulation.html)
- **Neer Kavach Dedicated Hub:** [http://localhost:5000/Neer_kavach/index.html](http://localhost:5000/Neer_kavach/index.html)
- **Saurya Rakshak Dedicated Hub:** [http://localhost:5000/Saurya_Rakshak/index.html](http://localhost:5000/Saurya_Rakshak/index.html)

> To re-launch the server at any time on Windows, simply double-click `run_local_server.bat` or run `powershell -ExecutionPolicy Bypass -NoProfile -File ./serve.ps1 -Port 5000`.

---

### 🚀 Deploying to Vercel (Free & Instant)
This repository is configured with zero-config static hosting (`vercel.json`):
1. **Option A: Vercel CLI**
   ```bash
   vercel deploy --prod
   ```
2. **Option B: Push to GitHub / GitLab / Bitbucket**
   - Push this directory to your repository.
   - Go to [vercel.com](https://vercel.com) -> "Add New Project" -> Select repository -> Click **Deploy**.
   - Vercel automatically deploys `index.html` as the root entry point. All relative asset links, simulations, and hash routing (`#neer-kavach` and `#saurya-rakshak`) work out-of-the-box freely anywhere in the world!

---

### 📂 File Structure
```
SIH_Projects/
│
├── index.html                  # Master Switcher Portal (Executive UI, Pill Toggle, Deep-Linking)
├── vercel.json                 # Vercel Deployment & Security Headers Configuration
├── package.json                # Project Metadata & NPM Script Manifest
├── serve.ps1                   # Native Windows HTTP Server Script (.NET HttpListener)
├── run_local_server.bat        # One-Click Windows Batch Launcher
├── README.md                   # Complete Documentation
│
├── Neer_kavach/
│   ├── index.html              # Dedicated Neer Kavach SIH Submission Dashboard
│   └── simulation.html         # Interactive 3D Three.js Wastewater Simulation (With Voice & HUD)
│
└── Saurya_Rakshak/
    ├── index.html              # Dedicated Saurya Rakshak Industrial Safety Dashboard
    └── simulation.html         # 12-Scene Industrial Hazard Digital Twin (Voice, FX & Alarms)
```
