<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Main.Master" AutoEventWireup="true" CodeBehind="TransactionHistoryPage.aspx.cs" Inherits="KpopZtations.View.Main.TransactionHistoryPage" %>

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
        <h1 class="text-center">Transaction History</h1>
        <table style="border-collapse: collapse">
            <thead>
                <tr>
                    <th>Transaction ID</th>
                    <th>Transacttion Date</th>
                    <th>Customer Name</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% foreach (var th in trheader)
                    {%>
                <tr>
                    <td><%= th.TransactionID%></td>
                    <td><%= th.TransactionDate %></td>
                    <td><%= th.Customer.CustomerName%></td>
                    <td>
                        <div class="remove-cart">
                            <a href="TransactionDetailPage.aspx?id=<%= th.TransactionID %>" style="color:red;">Details</a>
                        </div>
                    </td>
                </tr>
                <%} %>
            </tbody>
        </table>
    </div>
</asp:Content>
