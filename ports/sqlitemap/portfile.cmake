set(VCPKG_BUILD_TYPE release) # header-only

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bw-hro/sqlitemap
    REF "v${VERSION}"
    SHA512 8554d3bf3628517e395168dad339eeff92a6c1bbeb95ef19bcf29bbf57aaac3ef80bc481398fdeb577094749da9bab1d85612e2cc529b9a710dd7b1be362f682
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -SM_BUILD_EXAMPLES=OFF
        -SM_BUILD_TESTS=OFF
        -SM_ENABLE_COVERAGE=OFF
)

vcpkg_cmake_install()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
