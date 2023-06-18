<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Main.Master" AutoEventWireup="true" CodeBehind="ArtistsDetailsPage.aspx.cs" Inherits="KpopZtations.View.Main.ArtistsDetailsPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AuthForm" runat="server">
    <div class="mt-10 flex flex-col gap-5 justify-center items-center w-screen h-auto">
        <h1 class="text-dPink font-bold text-6xl"><asp:Label ID="artistNameLbl" runat="server" Text="Label"></asp:Label>'s Details Page</h1>
        <h1 class="text-dBlue font-medium text-base">You can see our discography on the album!</h1>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <h1 class="text-4xl font-bold text-dBlue text-center mt-10">Our Albums</h1>
        <div class="flex flex-wrap justify-between gap-y-[50px] my-10 px-10">
            <asp:Repeater runat="server" ID="albumRepeater">
                <ItemTemplate>
                <div class="flex flex-col gap-3 justify-between items-center shadow rounded-[5px] h-[650px]">
                        <a href ="/View/AlbumDetailsPage.aspx?id=<%# Eval("AlbumID")%>" class="w-[350px] flex flex-col items-center ">
                            <div class="w-full h-[350px]">
                                <img src="../../Storage/Albums/<%# Eval("AlbumImage") %>" alt="Albums Image" class="rounded-[5px] w-full h-full object-cover"/>
                            </div>
                            <div class="flex flex-col gap-5 p-3 w-full">
                                <h2 class="text-left text-dPink font-bold text-4xl w-full"><%# Eval("AlbumName") %></h2>
                                <h2 class="text-left text-dBlue font-bold text-xl w-full">Rp. <%# Eval("AlbumPrice") %></h2>
                                <h4 class="text-left text-dBlue font-medium text-base w-full"><%# Eval("AlbumDescription") %></h4>
                            </div>
                        </a>
                        <div class="w-full flex justify-between items-center p-3">
                            <a href="/View/Main/UpdateAlbumsPage.aspx?id=<%# Eval("AlbumID") %>" class="w-1/2 text-center text-white font-medium bg-dPink border-2 border-dPink px-3 py-2 rounded-full hover:bg-dDPink hover:border-dDPink" <%# ShowElementByAdmin() ? "" : "style='display: none;'" %>>Update Album</a>
                            <a href="/View/DeleteAlbumsPage.aspx?id=<%# Eval("AlbumID") %>" class="mr-3 border-b-2 border-transparent text-dPink hover:border-dPink" <%# ShowElementByAdmin() ? "" : "style='display: none;'" %>>Delete Album</a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div class="h-[1px] w-[350px] bg-transparant"></div>
            <div class="h-[1px] w-[350px] bg-transparant"></div>
            <div class="h-[1px] w-[350px] bg-transparant"></div>
            <div class="h-[1px] w-[350px] bg-transparant"></div>
        <div class="mt-4 mb-10 flex justify-center items-center w-full">
            <asp:Button ID="insertAlbum" runat="server" Text="Insert Album" class="w-full text-center text-white font-medium bg-dBlue border-2 border-dBlue px-6 py-2 rounded-full hover:bg-lBlue hover:border-lBlue" OnClick="insertAlbum_Click" Visible="<%#ShowElementByAdmin() %>" />
        </div>
    </div>
</asp:Content>
