import QtQuick 2.15
import QtQuick.Controls 2.0

Popup
{
    modal: true
    focus: true
    width: parent.width / 3
    height: parent.height / 3


    function getName()
    {
        return task_name.text
    }

    function getDeadline()
    {
        return deadline.text
    }

    function clear()
    {
        task_name.text = ""
        deadline.text = ""
    }

    Column
    {
        width: parent.width
        anchors.centerIn: parent
        spacing: 10
        TextField
        {
            id: task_name
            width: parent.width
            placeholderText: "Task name"
        }

        TextField
        {
            id: deadline
            width: parent.width
            placeholderText: "Deadline"
            validator: RegularExpressionValidator {regularExpression: /^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]|(?:Jan|Mar|May|Jul|Aug|Oct|Dec)))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2]|(?:Jan|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec))\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)(?:0?2|(?:Feb))\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9]|(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep))|(?:1[0-2]|(?:Oct|Nov|Dec)))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$/}

        }

        Button
        {
            text: "Apply"
            id: button_apply
            width: parent.width
            onClicked:
            {
                applyClicked()
            }
        }
        Button
        {
            text: "Cancel"
            id: button_cancel
            width: parent.width

            onClicked:
            {
                close()
            }
        }
    }


    signal applyClicked()

}
