# Configure cache defaults for building the ThreeDICOM Studio application

set(Slicer_MAIN_PROJECT ThreeDICOMApp CACHE STRING "Main project name" FORCE)

# Optional organization metadata – update to match your deployment
set(Slicer_ORGANIZATION_DOMAIN three.dicom CACHE STRING "Organization domain" FORCE)
set(Slicer_ORGANIZATION_NAME "ThreeDICOM" CACHE STRING "Organization name" FORCE)

# Example launcher customizations
set(Slicer_DEFAULT_HOME_MODULE "Data" CACHE STRING "Default home module" FORCE)
set(Slicer_DEFAULT_FAVORITE_MODULES "Data;Volumes;Models;DICOM" CACHE STRING "Default quick-access modules" FORCE)

