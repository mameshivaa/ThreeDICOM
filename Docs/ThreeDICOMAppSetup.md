# ThreeDICOM Studio Development Setup

This guide describes how to build and run the custom ThreeDICOM Studio application that ships inside this fork of 3D Slicer.

## 1. Configure The SuperBuild

```bash
mkdir -p ../ThreeDICOM-sb
cmake -S . -B ../ThreeDICOM-sb -C ThreeDICOMApp.cmake -DSlicer_MAIN_PROJECT=ThreeDICOMApp
```

- The `ThreeDICOMApp.cmake` cache script presets organizational defaults.
- `Slicer_MAIN_PROJECT` points the build at the `Applications/ThreeDICOMApp` directory.

## 2. Build The Application

```bash
cmake --build ../ThreeDICOM-sb --config Release --target ThreeDICOMApp
```

- The build generates the custom launcher plus supporting command line tools and Python environment.
- macOS app bundles live under `../ThreeDICOM-sb/Slicer-build/bin` (adjust for your platform).

## 3. Verify The Result

```bash
../ThreeDICOM-sb/Slicer-build/bin/ThreeDICOMApp --no-splash --help
```

- Replace icon and splash screen assets in `Applications/ThreeDICOMApp/Resources` before shipping.
- Update `Applications/ThreeDICOMApp/qSlicerAppMainWindow.*` to rebrand help links and text.

## 4. GitHub Actions (macOS Runner)

This repository ships a ready-to-use workflow at `.github/workflows/build-macos.yml`. It builds ThreeDICOM on GitHub's macOS runners and publishes the generated `.dmg` through the job artifacts.

Steps:

1. Ensure the repository is hosted on GitHub (public or private). No additional secrets are required.
2. Open the **Actions** tab and trigger **Build ThreeDICOM (macOS)** via `Run workflow`.
3. Wait for the job (3–5 hours depending on queue load). The workflow builds dependencies (Qt, ITK, SimpleITK, VTK) and packages `ThreeDICOMApp`.
4. Download the artifact named `ThreeDICOMApp-macos`—it contains both the `.dmg` installer and a tarball of the build tree for further inspection.

Tips:

- macOS runners provide ~58 GB of writable space under the workspace, which is sufficient for the SuperBuild configured above.
- If you do not need SimpleITK you can set `-DSlicer_BUILD_SimpleITK=OFF` in the configure step to shorten build time and reduce disk consumption.
