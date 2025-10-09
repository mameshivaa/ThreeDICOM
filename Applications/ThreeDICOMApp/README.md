# ThreeDICOM Studio Application

This directory hosts the ThreeDICOM Studio desktop application, a branded fork of 3D Slicer.

## Customize The Branding

- Replace the icon assets under `Applications/ThreeDICOMApp/Resources/Icons` and `Resources/Images`.
- Update the Qt resource collection file `Applications/ThreeDICOMApp/Resources/ThreeDICOMApp.qrc` if you rename assets.
- Adjust the main window implementation in `Applications/ThreeDICOMApp/qSlicerAppMainWindow.*`.

## Build Entry Point

Enabling this folder in the top-level `Applications/CMakeLists.txt` builds the `ThreeDICOMApp` executable. Configure and build Slicer as usual via the SuperBuild, then launch the generated ThreeDICOM Studio application.

