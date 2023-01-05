package("QtQuickControls2-WinUI3-theme")
    set_license("GPLv3")

    set_urls("https://github.com/TapzCrew/QtQuickControls2-WinUI3-theme.git")
    add_versions("01-05-2023", "28e438ee67e5e0e96960bdc50266aa5a4ae6959d")

    on_install(function(package)
        local configs = {}
        if package:mode() then
            configs.mode = package:mode()
        end
        import("package.tools.xmake").install(package, configs)
    end)