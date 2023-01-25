cmake_minimum_required(VERSION 3.13)

set(PICO_BOARD pico_w)
include($ENV{PICO_SDK_PATH}/external/pico_sdk_import.cmake)

set(target_project pico_midi_host)
project(${target_project} C CXX ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

pico_sdk_init()

add_executable(${target_project})

target_sources(${target_project} PUBLIC
    main.c
)

target_include_directories(${target_project} PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}
)

# Import pico_stdlib which imports commonly used features
target_link_libraries(${target_project} PUBLIC
    pico_stdlib
    pico_cyw43_arch_none
    tinyusb_host
    tinyusb_board
    ring_buffer_lib
)

# Create map/bin/hex file etc.
pico_add_extra_outputs(${target_project})
