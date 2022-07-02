#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QSqlDatabase>
#include <QTableView>
#include <QWidget>

class DataBase : public QObject
{
    Q_OBJECT
public:
    explicit DataBase(QObject *parent = nullptr);

public slots:

    void insert(const QString& name, const QString& deadline);

    int getTotal() const;

    void show();


private:

    QSqlDatabase m_database;

signals:

};

#endif // DATABASE_H
