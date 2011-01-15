#include "tile.h"
#include "ui_tile.h"

Tile::Tile(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::Tile)
{
    ui->setupUi(this);
    ui->pushButton_16->hide();
    ui->pushButton->setProperty("id","1");
    ui->pushButton_2->setProperty("id","2");
    ui->pushButton_3->setProperty("id","3");
    ui->pushButton_4->setProperty("id","4");
    ui->pushButton_5->setProperty("id","5");
    ui->pushButton_6->setProperty("id","6");
    ui->pushButton_7->setProperty("id","7");
    ui->pushButton_8->setProperty("id","8");
    ui->pushButton_9->setProperty("id","9");
    ui->pushButton_10->setProperty("id","10");
    ui->pushButton_11->setProperty("id","11");
    ui->pushButton_12->setProperty("id","12");
    ui->pushButton_13->setProperty("id","13");
    ui->pushButton_14->setProperty("id","14");
    ui->pushButton_15->setProperty("id","15");
    ui->pushButton_16->setProperty("id","16");
    /*ui->pushButton_Reset->setProperty("id","Reset");
    ui->pushButton_Shuffle->setProperty("id","Shuffle");
    ui->pushButton_Help->setProperty("id","Help");
    ui->pushButton_Quit->setProperty("id","Quit");*/
    /*
    ui->pushButton->setAccessibleDescription("1");
    ui->pushButton_2->setAccessibleDescription("2");
    ui->pushButton_3->setAccessibleDescription("3");
    ui->pushButton_4->setAccessibleDescription("4");
    ui->pushButton_5->setAccessibleDescription("5");
    ui->pushButton_6->setAccessibleDescription("6");
    ui->pushButton_7->setAccessibleDescription("7");
    ui->pushButton_8->setAccessibleDescription("8");
    ui->pushButton_9->setAccessibleDescription("9");
    ui->pushButton_10->setAccessibleDescription("10");
    ui->pushButton_11->setAccessibleDescription("11");
    ui->pushButton_12->setAccessibleDescription("12");
    ui->pushButton_13->setAccessibleDescription("13");
    ui->pushButton_14->setAccessibleDescription("14");
    ui->pushButton_15->setAccessibleDescription("15");
    ui->pushButton_16->setAccessibleDescription("16");
    */
    // Create seed for the random
    // That is needed only once on application startup
    QTime time = QTime::currentTime();
    qsrand((uint)time.msec());

    qApp->installEventFilter(this);
    //ui->pushButton->installEventFilter(this);
}

Tile::~Tile()
{
    delete ui;
}

void Tile::changeEvent(QEvent *e)
{
    QMainWindow::changeEvent(e);
    switch (e->type()) {
    case QEvent::LanguageChange:
        ui->retranslateUi(this);
        break;
    default:
        break;
    }
}

void Tile::checkNeighbours()
{
    QPushButton *button = qobject_cast< QPushButton* >(QObject::sender());
    //int id = button->accessibleDescription().toInt();
    int id = button->property("id").toInt();
    //check button to the right
    if (id != 16 && id != 12 && id != 8 && id != 4) {
        QPushButton *button_neighbour = idtoButton(id+1);
        if (button_neighbour->text() == "16" && button_neighbour->isHidden()) {
            swapButtons(button, button_neighbour);
            return;
        }
    }
    //check button to the left
    if (id != 13 && id != 9 && id != 5 && id != 1) {
        QPushButton *button_neighbour = idtoButton(id-1);
        if (button_neighbour->text() == "16" && button_neighbour->isHidden()) {
            swapButtons(button, button_neighbour);
            return;
        }
    }
    //check button to the bottom
    if (id != 16 && id != 15 && id != 14 && id != 13) {
        QPushButton *button_neighbour = idtoButton(id+4);
        if (button_neighbour->text() == "16" && button_neighbour->isHidden()) {
            swapButtons(button, button_neighbour);
            return;
        }
    }
    //check button to the up
    if (id != 4 && id != 3 && id != 2 && id != 1) {
        QPushButton *button_neighbour = idtoButton(id-4);
        if (button_neighbour->text() == "16" && button_neighbour->isHidden()) {
            swapButtons(button, button_neighbour);
            return;
        }
    }
    //qDebug() << "No swap candidates...";
    return;
}

QPushButton* Tile::idtoButton(int id)
{
    switch (id) {
    case 1:
        return ui->pushButton;
    case 2:
        return ui->pushButton_2;
    case 3:
        return ui->pushButton_3;
    case 4:
        return ui->pushButton_4;
    case 5:
        return ui->pushButton_5;
    case 6:
        return ui->pushButton_6;
    case 7:
        return ui->pushButton_7;
    case 8:
        return ui->pushButton_8;
    case 9:
        return ui->pushButton_9;
    case 10:
        return ui->pushButton_10;
    case 11:
        return ui->pushButton_11;
    case 12:
        return ui->pushButton_12;
    case 13:
        return ui->pushButton_13;
    case 14:
        return ui->pushButton_14;
    case 15:
        return ui->pushButton_15;
    case 16:
        return ui->pushButton_16;
    default:
        break;
    }
    return NULL;
}

void Tile::swapButtons(QPushButton *button, QPushButton *button_neighbour) {
    button->hide();
    button_neighbour->setText(button->text());
    button->setText("16");
    button_neighbour->show();
    button_neighbour->setFocus();
    if (isRunning) {
        Moves++;
        updateMoves();
    }
    if (isRunning && isSolved()) {
        isRunning = 0;
        switch (QMessageBox::information(this,
                                 "Solved!",
                                 "Hooray, you solved it!\nShuffle again?",
                                 "&Yes","&No"))
        {
        case 0:
            Shuffle();
        default:
            break;
        }
    }
}

void Tile::Reset()
{
    isRunning = 0;
    Moves=0;
    updateMoves();
    for (int i = 1; i < 16; i++) {
        QPushButton *button = idtoButton(i);
        QString str;
        button->show();
        button->setText(str.setNum(i));
    }
    QPushButton *button = idtoButton(16);
    button->hide();
    button->setText("16");
}

void Tile::Quit()
{
    switch (QMessageBox::information(this,
                             "Confirm Quit",
                             "Are you sure to quit?",
                             "&Quit","&Cancel"))
    {
    case 0:
        qApp->quit();
    default:
        break;
    }
}

void Tile::Shuffle()
{
    Reset();
    for (int i = 1; i < 16; i++) {
        //get random number 1..15
        int id = randInt(1,15);
        //swap it
        QPushButton *button_1 = idtoButton(i);
        QPushButton *button_2 = idtoButton(id);
        QString str = button_1->text();
        button_1->setText(button_2->text());
        button_2->setText(str);
    }
    if (!isSolvable()) {
        Shuffle();
    } else {
        isRunning = 1;
    }
}

int Tile::randInt(int low, int high)
{
    // Random number between low and high
    return qrand() % ((high + 1) - low) + low;
}

bool Tile::isSolvable()
{
    //http://mathworld.wolfram.com/15Puzzle.html
    //accumulator
    int acc = 0;
    //iterate through all tiles
    for (int i = 1; i < 17; i++) {
        //get button from id
        QPushButton *button = idtoButton(i);
        //get the number on tile
        int num = button->text().toInt();
        if (num == 16) {
            //get row of empty tile
            if (i < 5) {
                acc = acc + 1;
            } else if (i < 9) {
                acc = acc + 2;
            } else if (i < 13) {
                acc = acc + 3;
            } else {
                acc = acc + 4;
            }
            continue;
        }
        //iterate though the rest of tiles
        for (int j = i+1; j < 17; j++) {
            //get next button
            QPushButton *button_next = idtoButton(j);
            //get the number of next tile
            int num_next = button_next->text().toInt();
            //compare and increment accumulator
            if (num_next < num) {
                acc++;
            }
        }
    }
    //qDebug() << acc;
    if (acc%2 == 0) {
        return 1;
    } else {
        return 0;
    }
}

void Tile::Help()
{
    QMessageBox::about(this,
            "15 Puzzle",
            "\
This is the famous 15 Puzzle game.\n\
The object of the puzzle is to place the\n\
tiles in order by making sliding moves\n\
that use the empty space.\n\
\n\
\"Reset\" (Alt+R): reset the puzzle to solved position\n\
\"Shuffle\" (Alt+S): shuffle the puzzle. Note that this\n\
always produces solvable positions, don\'t give up\n\
\"Help\" (Alt+H): show this help\n\
\"Quit\" (Alt+Q): quit the app");
}

void Tile::keyPressEvent(QKeyEvent *event)
{
   if (event->key() == Qt::Key_Escape || event->key() == Qt::Key_Q) {
       Quit();
   } else if (event->key() == Qt::Key_Up) {
       //focusNextChild();
       //qDebug() << qApp->focusWidget();
       QPushButton *button = qobject_cast< QPushButton* >(qApp->focusWidget());
       keyUp(button);
   } else if (event->key() == Qt::Key_Down) {
       //focusPreviousChild();
       //qDebug() << qApp->focusWidget();
       QPushButton *button = qobject_cast< QPushButton* >(qApp->focusWidget());
       keyDown(button);
   } else {
       return;
   }
}

bool Tile::eventFilter(QObject *obj, QEvent *event)
{
    QKeyEvent *keyEvent = NULL;//event data, if this is a keystroke event
    bool result = false;//return true to consume the keystroke

    if (event->type() == QEvent::KeyPress)
    {
         keyEvent = dynamic_cast<QKeyEvent*>(event);
         //override Key Up and Key Down only
         if (keyEvent->key() == Qt::Key_Up || keyEvent->key() == Qt::Key_Down) {
            this->keyPressEvent(keyEvent);
            result = true;
        } else {
            result = QObject::eventFilter(obj, event);
        }
    }//if type()

    /*else if (event->type() == QEvent::KeyRelease)
    {
        keyEvent = dynamic_cast<QKeyEvent*>(event);
        this->keyReleaseEvent(keyEvent);
        result = true;
    }*///else if type()

    //### Standard event processing ###
    else
        result = QObject::eventFilter(obj, event);

    return result;
}//eventFilter

void Tile::keyUp(QPushButton *button)
{
    int id = button->property("id").toInt();
    QPushButton *button_up;
    if (id < 5) {
        button_up = idtoButton(id+12);
    } else {
        button_up = idtoButton(id-4);
    }
    if (button_up->isHidden()) {
        keyUp(button_up);
    } else {
        button_up->setFocus();
    }
}

void Tile::keyDown(QPushButton *button)
{
    int id = button->property("id").toInt();
    QPushButton *button_down;
    if (id > 12) {
        button_down = idtoButton(id-12);
    } else {
        button_down = idtoButton(id+4);
    }
    if (button_down->isHidden()) {
        keyDown(button_down);
    } else {
        button_down->setFocus();
    }
}

bool Tile::isSolved()
{
    QPushButton *button;
    for (int i = 1; i < 17; i++) {
        button = idtoButton(i);
        if (button->text() != button->property("id")) {
            return 0;
        }
    }
    return 1;
}

void Tile::updateMoves()
{
    QString mooves;
    ui->moves->setText("Moves:\n"+mooves.setNum(Moves));
}
