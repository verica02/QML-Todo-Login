import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1

import iproapps.besttodolist 1.0

Item {
    id: rootId
    property alias listView: listView
    property alias button: cancelButton//cancelButton is the id for here, button is the item/component for .qml where is the connection
    property alias toolButton: addToDoButton
    property alias toDoTextField: toDoTextField
    property alias newTaskInputRowId: newTaskInputRowId
    property alias createTaskButtonId: createTaskButtonId
    property alias colorPickerId: colorPickerId


    property int colorPickerLeftMargin: 50
    property alias doneListView1: doneListView1



    ColumnLayout {
        id: columnLayout
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.bottomMargin: 103

        anchors.topMargin: 100
        spacing: 30



        Text {
            id: blankListTextId
            anchors.centerIn: parent
            text: qsTr("Good job! Your To-Do list is blank.")
            visible: !listView.count
        }


        ListView {
            id: listView
            anchors {left: parent.left; right: parent.right}
            Layout.fillHeight: true
            boundsBehavior: Flickable.StopAtBounds
            highlightRangeMode: ListView.NoHighlightRange
        }




    }


    RowLayout {
        id: newTaskInputRowId
        x: 8
        y: 46
        visible: false
        anchors.leftMargin: 10
        z: 1
        TextArea {
            id: toDoTextField
            enabled: false
            wrapMode: TextEdit.WordWrap
            Layout.maximumWidth: rootId.width - colorPickerId.width - colorPickerLeftMargin - createTaskButtonId.width
            placeholderText: qsTr("Type new TO DO here...")
        }

        ColorPicker {
            id: colorPickerId
            anchors.leftMargin: colorPickerLeftMargin
            z: 1
        }

        ToolButton {
            id: createTaskButtonId
            text: qsTr("\uE109")
            font.family: "Segoe MDL2 Assets"
            width: 25
            height: 25
            anchors.verticalCenter: parent.verticalCenter
        }

        Button {
            id: cancelButton
            text: qsTr("Cancel")
            anchors{
                right:parent.right


            }
            visible:false
        }

    }

    Rectangle{

        anchors.bottom:parent.bottom
        anchors {left: parent.left; right: parent.right}
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        ListView {
            id: doneListView1
            y: -215
            height: 215
            anchors {left: parent.left; right: parent.right}
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            highlightRangeMode: ListView.NoHighlightRange
            Layout.fillHeight: true
            Layout.fillWidth: true
            boundsBehavior: Flickable.StopAtBounds

        }

    }

    ToolButton {
        anchors.leftMargin: 20
        id: addToDoButton
        x: 8
        y: 46
        text: qsTr("+ New To Do")
        font.bold: true
        font.pixelSize: 15
    }


}



