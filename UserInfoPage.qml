//import QtQuick 2.7
//import QtQuick.Controls 2.0
//import QtQuick.Layouts 1.1

import "backend.js" as Backend
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtQml.Models 2.2

import iproapps.besttodolist 1.0//access to backend

MainPageForm {

     property string userName: ""

    ToolBar {
       width:parent.width
       anchors.bottomMargin: 40
       anchors.right:parent.right


       ToolButton {
                     id: control
                     anchors.left: parent.left
                     anchors.leftMargin: 40
                     anchors.verticalCenter: parent.verticalCenter
                     font.family: "fontawesome"
                      text: qsTr("\uf08b")
                      font.pointSize: 20
                      rightPadding: 10
                      contentItem: Text {
                         text: control.text
                          font: control.font
                          opacity: enabled ? 1.0 : 0.3
                          color: mainTextColor
                          horizontalAlignment: Text.AlignHCenter
                          verticalAlignment: Text.AlignVCenter
                          elide: Text.ElideRight
                      }
                     onClicked: logoutSession()
                  }


         Rectangle{

             id:userId
             anchors.right: parent.right
             anchors.rightMargin: 40
             anchors.verticalCenter: parent.verticalCenter

             width:welcometext.width

             Text {
             id: welcometext
             text: "Welcome, " + userName
             anchors.centerIn: parent
             font.pointSize: 12
             color: "#000000"
         }

      }
}


    toolButton.onClicked: {
        newTaskInputRowId.visible = true;
        toDoTextField.enabled = true;
        toolButton.visible = false;
        toDoTextField.forceActiveFocus();
        button.visible = true;

    }

    button.onClicked: {
        newTaskInputRowId.visible = false;
        toDoTextField.enabled = false;
        toolButton.visible = true;

        button.visible = false;

    }



    TaskListDelegateModel {
        id: delegateModelId
        visualModel.model: backend.newTaskModel
        listView: parent.listView
    }


    listView.model: delegateModelId.visualModel
    listView.spacing: 4



    createTaskButtonId.onClicked: {
        var textValue = toDoTextField.text.trim();
        if (textValue === "")
            return;

        toDoTextField.enabled = false;
        toDoTextField.text = "";
        newTaskInputRowId.visible = false;
        toolButton.visible = true;

        Qt.inputMethod.hide()
        backend.newTask(textValue, colorPickerId.selectedColor);
        listView.positionViewAtBeginning();

    }

    Rectangle{

        color:"#ffffff"
        anchors{
            bottom:parent.bottom
            bottomMargin: 0
            leftMargin: 0
            rightMargin: 0
            right:parent.right
            left:parent.left

        }
        width:600
        height:200

        Text{
            text:"Done tasks"
            font.pixelSize: 15
            font.bold:true
            leftPadding: 25
            anchors{
                bottom:parent.top
                bottomMargin: 20
                left:parent.left
                //leftMargin: 20
            }
            color:"#000000"
        }

        DonePageForm {
            TaskListDelegateModel {
                id: delegateModelId1
                visualModel.model: backend.doneTaskModel
                listView: parent.doneListView
            }

            anchors{
                left:parent.left
                right:parent.right
            }

            doneListView.model: delegateModelId1.visualModel
            doneListView.spacing: 4
        }
    }

}



