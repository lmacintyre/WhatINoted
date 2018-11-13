﻿using System;
using System.Collections.Generic;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI.WebControls;
using WhatINoted.ConnectionManagers;
using WhatINoted.Models;

namespace WhatINoted
{
    /// <summary>
    /// A view from which the user can view, edit and delete their notes.
    /// </summary>
    public partial class NotesView : View
    {
        private string notebookID;

        protected void Page_Load(object sender, EventArgs e)
        {
            notebookID = Request.QueryString["notebookID"];

            if (notebookID == null || notebookID == "")
            {
                Response.Redirect("./Notebooks.aspx");
            }

            NotebookTitle.InnerText = GoogleFirestoreConnectionManager.GetNotebook(notebookID).Title;
        }

        [WebMethod, ScriptMethod]
        public void DeleteNotebook(object sender, EventArgs e) 
        {
            if (notebookID != null && notebookID != "") 
            {
                GoogleFirestoreConnectionManager.DeleteNotebook(notebookID);
                Response.Redirect("./Notebooks.aspx");
            }
        }

        /// <summary>
        /// Edits the note corresponding to the edit button that was clicked.
        /// </summary>
        [WebMethod, ScriptMethod]
        public void EditNote(object sender, EventArgs e)
        {
            Response.Redirect("NoteEditor.aspx?noteID=" + NoteID.Value, true);
        }

        /// <summary>
        /// Deletes the note corresponding to the delete button that was clicked.
        /// </summary>
        [WebMethod, ScriptMethod]
        public void DeleteNote(object sender, EventArgs e)
        {
            string noteID = NoteID.Value;
            if (noteID != null && noteID != "")
            {
                GoogleFirestoreConnectionManager.DeleteNote(noteID);
            }
        }

        [WebMethod, ScriptMethod]
        public void AddNote(object sender, EventArgs e)
        {
            Response.Redirect("NoteEditor.aspx?notebookID=" + notebookID, true);
        }

        [WebMethod, ScriptMethod]
        public void UpdateNotes(object sender, EventArgs e)
        {
            GenerateNoteRows(GoogleFirestoreConnectionManager.GetNotebookNotes(notebookID));
        }

        protected void GenerateNoteRows(List<Note> notes)
        {
            foreach (Note note in notes)
            {
                TableRow noteRow = new TableRow();
                TableCell textCell = new TableCell();
                textCell.Text = note.Text;
                TableCell editDeleteCell = new TableCell();
                editDeleteCell.HorizontalAlign = HorizontalAlign.Right;
                Button editButton = new Button();
                editButton.Text = "Edit";
                editButton.OnClientClick = "EditNote_Click(\"" + note.ID + "\")";
                Button deleteButton = new Button();
                deleteButton.Text = "Delete";
                deleteButton.OnClientClick = "DeleteNote_Click(\"" + note.ID + "\")";
                editDeleteCell.Controls.Add(editButton);
                editDeleteCell.Controls.Add(deleteButton);
                noteRow.Controls.Add(textCell);
                noteRow.Controls.Add(editDeleteCell);
                NotesTable.Controls.Add(noteRow);
            }
        }
    }
}