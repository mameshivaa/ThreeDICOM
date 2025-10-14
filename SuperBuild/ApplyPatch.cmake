cmake_minimum_required(VERSION 3.16)

if(NOT DEFINED patch)
  message(FATAL_ERROR "Variable 'patch' must be defined")
endif()
if(NOT DEFINED source)
  message(FATAL_ERROR "Variable 'source' must be defined")
endif()
if(NOT DEFINED PATCH_COMMAND)
  set(PATCH_COMMAND patch)
endif()
if(NOT EXISTS "${patch}")
  message(FATAL_ERROR "Patch file not found: ${patch}")
endif()
if(NOT EXISTS "${source}")
  message(FATAL_ERROR "Source directory not found: ${source}")
endif()

get_filename_component(_source_name "${source}" NAME)
set(_download_script "${source}-cmake/tmp/${_source_name}-gitclone.cmake")
if(EXISTS "${_download_script}")
  message(STATUS "Ensuring source ${_source_name} is cloned before patching")
  execute_process(
    COMMAND ${CMAKE_COMMAND} -DCMAKE_MESSAGE_LOG_LEVEL=VERBOSE -P "${_download_script}"
    WORKING_DIRECTORY "${source}"
    RESULT_VARIABLE _dl_res
    OUTPUT_VARIABLE _dl_out
    ERROR_VARIABLE _dl_err
  )
  if(NOT _dl_res EQUAL 0)
    message(FATAL_ERROR "Failed to prepare source using ${_download_script}:\n${_dl_out}\n${_dl_err}")
  endif()
endif()

message(STATUS "Applying patch ${patch} in ${source}")
execute_process(
  COMMAND ${PATCH_COMMAND} -p1 -N -i "${patch}"
  WORKING_DIRECTORY "${source}"
  RESULT_VARIABLE res
  OUTPUT_VARIABLE out
  ERROR_VARIABLE err
)
if(NOT res EQUAL 0)
  string(CONCAT _patch_log "${out}" "\n" "${err}")
  string(FIND "${_patch_log}" "Ignoring previously applied" _already)
  if(NOT _already EQUAL -1)
    file(GLOB _rej_files "${source}/*.rej")
    if(_rej_files)
      file(REMOVE ${_rej_files})
    endif()
    message(STATUS "Patch ${patch} already applied; skipping")
  else()
    message(FATAL_ERROR "Failed to apply patch ${patch}:\n${out}\n${err}")
  endif()
endif()

if(_source_name STREQUAL "PythonQt")
  file(GLOB _generated_dirs "${source}/generated_cpp_*")
  foreach(_dir IN LISTS _generated_dirs)
    if(EXISTS "${_dir}")
      message(STATUS "Removing pre-generated wrappers ${_dir}")
      file(REMOVE_RECURSE "${_dir}")
    endif()
  endforeach()
endif()
