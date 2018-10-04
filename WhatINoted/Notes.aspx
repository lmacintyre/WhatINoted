﻿<%@ Page Title="Notes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Notes.aspx.cs" Inherits="WhatINoted.Notes" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="LoginUpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div runat="server">
                <h2>Notebook Title</h2>
                <asp:Table runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            Note Text ...
                            <br>
                            Many empty lines ...
                            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                            A second line of text ...
                        </asp:TableCell>
                        <asp:TableCell HorizontalAlign="Right">
                            <asp:Button runat="server" Text="Edit"></asp:Button>
                            <asp:Button runat="server" Text="Delete"></asp:Button>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Note text 2 ...</asp:TableCell>
                        <asp:TableCell HorizontalAlign="Right">
                            <asp:Button runat="server" Text="Edit"></asp:Button>
                            <asp:Button runat="server" Text="Delete"></asp:Button>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>Note text 3 ...</asp:TableCell>
                        <asp:TableCell HorizontalAlign="Right">
                            <asp:Button runat="server" Text="Edit"></asp:Button>
                            <asp:Button runat="server" Text="Delete"></asp:Button>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
            <div runat="server" class="footer_1_column fixed">
                <div runat="server" class="footer_1_column_middle button">
                    New Note
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>