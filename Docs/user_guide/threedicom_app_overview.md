# ThreeDICOM Application Overview

ThreeDICOM is a customized distribution of 3D Slicer that focuses on efficient review of DICOM image studies and rapid preparation of quantitative results. This page summarizes the major capabilities that ship with the application so new team members can orient themselves quickly.

## Data management

- **Study browser**: launch the integrated DICOM browser from the welcome screen to import local folders or query/retrieve from remote PACS servers using the CTK implementation of the DICOM networking services.
- **Scene templates**: load, save, and share Slicer scene files (.mrml) that capture 2D/3D views, segmentations, and markups associated with a case.
- **Multi-format import**: in addition to DICOM, the application accepts NRRD, NIfTI, STL, OBJ, and other common medical imaging or surface formats via the standard "Add Data" dialog.

## Visualization

- **Linked viewers**: orthogonal slice views and a linked 3D view allow synchronized scrolling, window/level adjustment, and crosshair navigation across volumes.
- **Volume rendering presets**: preset collections are provided for CT bone, CT angiography, and MR-based visualization. Users can create and store custom presets in the application settings.
- **Annotations and measurements**: markups (lines, angles, ROI boxes, fiducials) capture quantitative measurements that remain synchronized with the underlying image geometry.

## Segmentation and quantitative analysis

- **Segment Editor workflows**: core Segment Editor effects (threshold, grow from seeds, scissors, erase, smoothing, logical operations) are enabled by default to rapidly generate volumetric label maps.
- **Dynamic Modeler**: surface-based editing tools (cut, hollow, wrap, margin) operate directly on segmentation-derived meshes for surgical planning or printing.
- **Terminology support**: the Terminologies module is bundled to label segments using standardized anatomical/NCI codes, ensuring traceable results for downstream analytics.

## Registration and fusion

- **Transform hierarchy**: rigid, similarity, and B-spline transforms can be created, edited, and chained to align multimodal studies. The hierarchy view exposes transform relationships at a glance.
- **Registration tools**: the General Registration (BRAINS) CLI and Landmark Registration modules are pre-installed, allowing intensity-based or fiducial-based alignment between studies.
- **Multi-volume fusion**: users can overlay registered volumes with adjustable opacity or link them to synchronized slice viewers for side-by-side comparison.

## Automation and extensibility

- **Python console and scripting**: the embedded PythonSlicer interpreter provides full access to MRML nodes, VTK, and Qt APIs for interactive prototyping or scripted pipelines. The console output is captured in the application log for reproducibility.
- **Extension support**: the Extension Manager remains available so custom modules or third-party packages can be installed across users while keeping the ThreeDICOM base environment consistent.
- **Launcher options**: ThreeDICOM.exe exposes command-line switches such as --python-script, --disable-module, and --additional-module-path to run headless jobs or integrate with automation servers.

## Default configuration

- **Organization branding**: application metadata (organization name, splash screen, desktop icon) is customized for ThreeDICOM deployments, and shared settings are stored under %LOCALAPPDATA%\ThreeDICOMOrg.
- **Home & favorite modules**: the default home module is "Welcome", and the favorite list includes Data, Volumes, Models, Transforms, Markups, and Segment Editor for rapid access to the most common workflows.
- **Testing disabled**: the superbuild ships without the Slicer testing targets to reduce build time and binary size, while production diagnostics remain available through the log viewers.

## Getting started

1. Launch ThreeDICOM.exe and open the DICOM browser to import a study.
2. Load the required series into the patient MRML scene, then explore them in the slice and 3D viewers.
3. Use the Markups or Segment Editor modules to capture measurements and structural annotations.
4. Export results via the DICOM exporter, scene packages, or by saving individual models/label maps.

For deeper module-specific information, continue with the rest of the user guide or the developer documentation under Docs/developer_guide.