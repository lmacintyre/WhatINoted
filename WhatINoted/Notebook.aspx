﻿<%@ Page Title="Notes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Notebook.aspx.cs" Inherits="WhatINoted.NotesView" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="LoginUpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div runat="server">
                <h2 runat="server" id="NotebookTitle">Notebook Title</h2>
                
                <asp:Table runat="server" ID="NotesTable"></asp:Table>
                <asp:HiddenField runat="server" ID="NoteID" Value="" />
                <asp:Button runat="server" class="editNoteTrigger hidden" OnClick="EditNote" />
            </div>
            <div runat="server" class="footer_2_columns fixed">
                <asp:Button runat="server" class="deleteNotebookTrigger hidden" OnClick="DeleteNotebook" />
                <div runat="server" id="DeleteNotebookButton" class="footer_2_columns_left button" visible="false" onclick="DeleteNotebook_Click();">
                    Delete Notebook
                </div>
                <asp:Button runat="server" class="addNoteTrigger hidden" OnClick="AddNote" />
                <div runat="server" class="footer_2_columns_right button" onclick="NewNote_Click();">
                    New Note
                </div>
            </div>

            <asp:HiddenField runat="server" ID="HandleLoginUserID" Value="" />
            <asp:Button runat="server" class="handleLoginTrigger hidden" OnClick="ValidateUser"/>

        </ContentTemplate>
    </asp:UpdatePanel>

    <script>
        window.addEventListener('load', handleLoginForContentPage);
        function NewNote_Click() {
            let triggerButton = document.getElementsByClassName('addNoteTrigger')[0];
            triggerButton.click();
        }
        function EditNote_Click(noteID) {
            window.location.href = "NoteEditor.aspx?noteID=" + noteID;
        }
        function DeleteNote_Click(noteID) {
            if (confirm("Are you sure you want to delete this Note?")) {
                let hiddenField = document.getElementById('<%= NoteID.ClientID %>');
                hiddenField.value = noteID;
                var data = JSON.stringify({ noteID: noteID });
                callCSMethod("Notebook.aspx/DeleteNote", data, function () {
                    window.location.reload(true);
                });
            }
        }
        function DeleteNotebook_Click() {
            let title = document.getElementById('<%= NotebookTitle.ClientID %>').innerText;
            if (confirm("Are you sure you want to delete " + title + "?")) {
                let triggerButton = document.getElementsByClassName('deleteNotebookTrigger')[0];
                triggerButton.click();
            }
        }
    </script>
</asp:Content>
