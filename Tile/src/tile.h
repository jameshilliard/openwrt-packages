#ifndef TILE_H
#define TILE_H

#include <QMainWindow>
#include <QDebug>
#include <QPushButton>
#include <QTime>
#include <QMessageBox>
#include <QKeyEvent>

extern bool isRunning;
extern int Moves;

namespace Ui {
    class Tile;
}

class Tile : public QMainWindow {
    Q_OBJECT
public:
    Tile(QWidget *parent = 0);
    ~Tile();

public slots:
    void checkNeighbours();
    QPushButton* idtoButton(int id);
    void swapButtons(QPushButton *button, QPushButton *button_neighbour);
    void Reset();
    void Quit();
    void Shuffle();
    int randInt(int low, int high);
    bool isSolvable();
    void Help();
    void keyPressEvent(QKeyEvent *event);
    bool eventFilter(QObject *obj, QEvent *event);
    void keyUp(QPushButton *button);
    void keyDown(QPushButton *button);
    bool isSolved();
    void updateMoves();

protected:
    void changeEvent(QEvent *e);

private:
    Ui::Tile *ui;
};

#endif // TILE_H
