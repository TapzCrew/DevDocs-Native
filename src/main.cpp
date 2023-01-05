#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>
#include <QtQuick/QQuickWindow>
#include <QtQuickControls2/QQuickStyle>

auto main(int argc, char *argv[]) -> int {
    auto app = QGuiApplication { argc, argv };

    QQuickStyle::setStyle("WinUI3Style");

    auto engine = QQmlApplicationEngine {};

    const auto url = QUrl { u"qrc:///qml/MainWindows.qml"_qs };

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl) QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);

    engine.load(url);

    return app.exec();
}