<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Main.Master" AutoEventWireup="true" CodeBehind="TransactionDetailPage.aspx.cs" Inherits="KpopZtations.View.Main.TransactionDetailPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Style/Cart.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AuthForm" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <style>
        table {
            margin-top: 50px;
            margin-bottom: 50px;
            outline-color: gainsboro;
            outline-style: solid;
        }

        td {
            border-top: 1px solid gainsboro;
            border-bottom: 1px solid gainsboro;
            padding: 13px;
            background-color: whitesmoke;
            align-items: left;
        }


        th {
            border: none;
            background-color: rgb(186, 186, 186);
            padding-top: 20px;
            padding-bottom: 20px;
            padding-left: 35px;
            padding-right: 35px;
            align-items: left;
            text-align: left;
        }

        .test {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            margin-left: 80px;
            margin-right: 80px;
        }
    </style>
    <div class="test">
        <br>
        <h1 class="text-center">Transaction Details</h1>
        <table style="border-collapse: collapse">
            <thead>
                <tr>
                    <th>Transaction ID</th>
                    <th>Album Picture</th>
                    <th>Album Name</th>
                    <th>Album Quantity</th>
                    <th>Album Price</th>
                </tr>
            </thead>
            <tbody>
                <% foreach (var td in trdetail)
                    {%>
                <tr>
                    <td><%= td.TransactionID%></td>
                    <td>
                        <img class="book-pic-icon" src="../../Storage/Albums/<%= td.Album.AlbumImage%>" alt="Album Image" width="180px" height="180px" style="border-radius: 7px; margin-top: 18px; margin-bottom: 15px;">
                    </td>
                    <td><%= td.Album.AlbumName %></td>
                    <td><%= td.Qty %></td>
                    <td><%= td.Album.AlbumPrice %></td>
                </tr>
                <%} %>
            </tbody>
        </table>
    </div>
</asp:Content>
