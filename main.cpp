#include "client/linux/handler/exception_handler.h"
#include "crash_handler.h"
#include <QCoreApplication>
#include <QDebug>
#include <QStandardPaths>

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    Breakpad::CrashHandler::instance()->Init(QStandardPaths::writableLocation(QStandardPaths::HomeLocation));

    int arr[100] = {0};
    arr[1000] = 7;
    qDebug() << "Hello World" << arr[10000];

    return a.exec();
}
