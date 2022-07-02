import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0

Window
{
    width: 640
    height: 480
    visible: true
    title: qsTr("Task manager")

    Component.onCompleted:
    {
        text_count.total = data_base.getTotal()
    }

    PopupAdd
    {
        id: popup_add
        anchors.centerIn: parent

        onApplyClicked:
        {
            var name = getName()
            var deadline = getDeadline()

            if(!name || !deadline)
            {
                return
            }

            data_base.insert(getName(), getDeadline())
            text_count.total = data_base.getTotal()
            close()
        }
    }

    Rectangle
    {
        id: rect_back
        anchors
        {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        height: 40
        color: "dark gray"
    }

    Button
    {
        id: button_add
        text: "Add"
        width: 100
        anchors
        {
            right: rect_back.right
            top: rect_back.top
            bottom: rect_back.bottom

            topMargin: 5
            bottomMargin: 5
            rightMargin: 10
        }

        onClicked:
        {
            popup_add.open()
        }
    }

    Button
    {
        id: button_show
        text: "Show"
        width: 100
        anchors
        {
            right: button_add.left
            top: rect_back.top
            bottom: rect_back.bottom

            topMargin: 5
            bottomMargin: 5
            rightMargin: 10
        }

        onClicked:
        {
            data_base.show();
        }
    }

    Text
    {
        id: text_count
        property int total: 0;
        text: "Total: " + total

        font.pixelSize: 20

        anchors
        {
            left: rect_back.left
            top: rect_back.top
            bottom: rect_back.bottom

            topMargin: 5
            bottomMargin: 5
            leftMargin: 10
        }
    }
}
