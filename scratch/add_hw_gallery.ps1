$path = "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Saurya_Rakshak\index.html"
$content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

# Add CSS for hardware gear showcase if not present
$cssToAdd = @"
    /* Physical Hardware Showcase Cards */
    .hw-gallery-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 1.25rem;
      margin-bottom: 2rem;
    }
    .hw-card-item {
      background: #ffffff;
      border: 1px solid var(--border-light);
      border-radius: 14px;
      padding: 1.25rem;
      box-shadow: var(--shadow-sm);
      display: flex;
      flex-direction: column;
      align-items: center;
      text-align: center;
      transition: transform 0.2s, box-shadow 0.2s;
    }
    .hw-card-item:hover {
      transform: translateY(-3px);
      box-shadow: var(--shadow-md);
      border-color: var(--brand-dark);
    }
    .hw-card-img-wrap {
      width: 100%;
      height: 180px;
      display: flex;
      align-items: center;
      justify-content: center;
      background: #0f172a;
      border-radius: 10px;
      margin-bottom: 1rem;
      padding: 10px;
    }
    .hw-card-img-wrap img {
      max-height: 100%;
      max-width: 100%;
      object-fit: contain;
    }
    .hw-card-title {
      font-size: 1.05rem;
      font-weight: 800;
      color: var(--text-primary);
      margin-bottom: 0.35rem;
    }
    .hw-card-tag {
      font-family: var(--font-mono);
      font-size: 0.72rem;
      font-weight: 700;
      color: #b45309;
      background: #fef3c7;
      padding: 0.2rem 0.6rem;
      border-radius: 20px;
      margin-bottom: 0.65rem;
      display: inline-block;
    }
    .hw-card-desc {
      font-size: 0.82rem;
      color: var(--text-secondary);
      line-height: 1.5;
    }
"@

if ($content -notmatch 'hw-gallery-grid') {
    $content = $content.Replace('</style>', "$cssToAdd`n  </style>")
}

# Add Hardware Gallery in View 5 (Prototype Suite)
$hwGalleryHtml = @"
      <!-- Physical Wearable Hardware Gallery -->
      <div class="hw-gallery-grid">
        <div class="hw-card-item">
          <div class="hw-card-img-wrap">
            <img src="/Saurya_Rakshak/assets/helmet.png" alt="Smart Tactical Helmet">
          </div>
          <div class="hw-card-title">Unit 1: Smart Tactical Helmet</div>
          <span class="hw-card-tag">IS 2925 + Auto-Darkening UV</span>
          <p class="hw-card-desc">
            Industrial impact shell with magnetic chin-strap Hall effect interlock, optical UV photodiode (&lt;15ms trip), 4K camera mount, and 95dB audible alert beacon.
          </p>
        </div>

        <div class="hw-card-item">
          <div class="hw-card-img-wrap">
            <img src="/Saurya_Rakshak/assets/gloves_pair.png" alt="Armored Sensing Gloves">
          </div>
          <div class="hw-card-title">Unit 2: Armored Sensing Gloves</div>
          <span class="hw-card-tag">ASTM D120 Class 0 (1000V)</span>
          <p class="hw-card-desc">
            Dual glove construction with flexible conductive cuff interlocks, capacitive non-contact high voltage (NCV) sensor, and 250Hz palm haptic vibration motor.
          </p>
        </div>

        <div class="hw-card-item">
          <div class="hw-card-img-wrap">
            <img src="/Saurya_Rakshak/assets/hazard_detector.png" alt="Multi-Hazard Detector Pod">
          </div>
          <div class="hw-card-title">Unit 3: Multi-Hazard Detector Pod</div>
          <span class="hw-card-tag">4-Gas Optical + 6-Axis IMU</span>
          <p class="hw-card-desc">
            Rugged chest/belt worn pod with autonomous gas chambers (CO, O₂, CH₄, H₂S), freefall/impact shock detection, single-press SOS distress button, and 100dB siren.
          </p>
        </div>
      </div>
"@

$targetStr = '<div class="proto-grid">'
if ($content -notmatch 'Physical Wearable Hardware Gallery') {
    $content = $content.Replace($targetStr, "$hwGalleryHtml`n      $targetStr")
}

[System.IO.File]::WriteAllText($path, $content, [System.Text.Encoding]::UTF8)
Write-Output "Added Physical Wearable Hardware Gallery to Saurya_Rakshak/index.html"
