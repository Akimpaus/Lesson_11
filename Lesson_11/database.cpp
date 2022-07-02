#include "database.h"

#include <QDebug>
#include <QSqlError>
#include <QSqlQuery>
#include <QSqlTableModel>
#include <QLayout>

DataBase::DataBase(QObject *parent) :
    QObject(parent)
{
    m_database = QSqlDatabase::addDatabase("QSQLITE");


    m_database.setDatabaseName("D:/C++/Qt/Geekbriains/QtStart/Lesson_11/Lesson_11/res/data_base.db");


    if(m_database.open())
    {
        qDebug() << "Opened!";
    }
    else
    {
        qDebug() << m_database.lastError().text();
    }

}

void DataBase::insert(const QString &name, const QString &deadline)
{

    QSqlQuery query;
    query.prepare("INSERT INTO tasks (name, deadline)\
                   VALUES(:name, :deadline); ");

    query.bindValue(":name", name);
    query.bindValue(":deadline", deadline);

    if(!query.exec())
    {
        qDebug() << "error insert into ";
    }
}

int DataBase::getTotal() const
{
    QSqlQuery query(m_database);
    if(!query.exec("SELECT COUNT(*) FROM tasks"))
    {
        qDebug() << "Error of get total!";
        return 0;
    }
    query.first();
    return query.value(0).toInt();
}

void DataBase::show()
{
    QWidget* widget = new QWidget();
    widget->setFixedSize({300,300});
    QTableView* table_view = new QTableView(widget);
    table_view->setFixedSize({300,300});
    QSqlTableModel* model = new QSqlTableModel(table_view, m_database);


    table_view->setModel(model);
    model->setTable("tasks");
    model->select();

    widget->show();
}
