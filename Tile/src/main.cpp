#include <QtGui/QApplication>
#include "tile.h"


#if defined(Q_WS_QWS)
#include <QtGui/QWSServer>
#endif

bool isRunning = 0;
int Moves = 0;

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    Tile w;
    #if defined(Q_WS_QWS)
        QWSServer::setCursorVisible(false);
    #endif
    w.show();
    return a.exec();
}
