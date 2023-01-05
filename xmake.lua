set_xmakever("2.7.4")
set_project("DevDocs-Native")

add_rules("mode.debug", "mode.release", "mode.asan")
set_allowedmodes("debug", "release", "asan")
set_allowedplats("windows", "linux", "macOS")
set_allowedarchs("windows|x64", "linux|x86_64", "macOS|arm64", "macOS|x86_64")

add_repositories("repo repo")
add_requires("QtQuickControls2-WinUI3-theme")

target("DevDocs-Native")
    set_kind("binary")
    add_rules("qt.quickapp")
    set_languages("cxxlatest", "clatest")

    set_license("GPLv3")

    if is_mode("debug") then
        set_symbols("debug", "hidden")
        add_defines("QT_QML_DEBUG")
    else
        set_symbols("hidden")
    end


    if is_plat("windows") then
        if is_mode("debug") then
            set_runtimes("MDd")
        else
            set_runtimes("MD")
        end
    end

    add_files("src/*.cpp")
    add_files("*.qrc")

    add_frameworks("QtCore",
                   "QtGui",
                   "QtQml",
                   "QtQuick",
                   "QtQuickControls2")

    set_values("qt.deploy.qmldir", "qml/")
    set_values("qt.deploy.flags", "--no-translations", "--no-virtualkeyboard")
    set_policy("build.c++.modules", true)