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
