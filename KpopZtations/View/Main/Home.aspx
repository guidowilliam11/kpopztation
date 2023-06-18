<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Main.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="KpopZtations.View.Main.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AuthForm" runat="server">
    <div class="flex justify-center items-center w-screen h-auto">
        <img src="../../../Storage/Additional/background.jpg" class="w-full h-full object-cover"/>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <h1 class="text-4xl font-bold text-dBlue text-center mt-10">Our Artist</h1>
    
    <div class="flex flex-wrap justify-between gap-y-[50px] my-10 px-10">
        <asp:Repeater runat="server" ID="artistRepeater">
            <ItemTemplate>
                <div class="flex flex-col gap-3 justify-center items-center">
                    <a href="/View/Main/ArtistsDetailsPage.aspx?id=<%# Eval("ArtistID") %>" class="relative w-[350px] h-[350px] flex flex-col items-center justify-end">
                        <img src="../../../Storage/Artists/<%# Eval("ArtistImage") %>" alt="Artist Image" class="absolute z-40 rounded-[5px] w-full h-full object-cover hover:hidden"/>
                        <div class="absolute -z-10 rounded-[5px] w-full h-full bg-black opacity-[50%]"></div>
                        <img src="../../../Storage/Artists/<%# Eval("ArtistImage") %>" alt="Artist Image" class="absolute -z-20 rounded-[5px] w-full h-full object-cover"/>
                        <div class="text-center z-10 text-white font-bold text-3xl w-full"><%# Eval("ArtistName") %></div>
                        <div class="text-center z-10 text-white font-bold text-sm w-full border-b-2 border-transparent mb-5 w-max hover:border-white">see more</div>
                    </a>
                    <a href="/View/Main/UpdateArtistPage.aspx?id=<%# Eval("ArtistID") %>" class="w-2/3 text-center text-dPink font-medium border-2 border-dPink px-6 py-2 rounded-full hover:bg-dPink hover:text-white" <%# ShowElementByAdmin() ? "" : "style='display: none;'" %>>Update Artist</a>
                    <a href="/View/DeleteArtistPage.aspx?id=<%# Eval("ArtistID") %>" class="w-2/3 text-center text-white font-medium bg-dPink border-2 border-dPink px-6 py-2 rounded-full hover:bg-dDPink hover:border-dDPink" <%# ShowElementByAdmin() ? "" : "style='display: none;'" %>>Delete Artist</a>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <div class="h-[1px] w-[350px] bg-transparant"></div>
        <div class="h-[1px] w-[350px] bg-transparant"></div>
        <div class="h-[1px] w-[350px] bg-transparant"></div>
        <div class="h-[1px] w-[350px] bg-transparant"></div>
        <div class="mt-4 mb-10 flex justify-center items-center w-full">
            <asp:Button ID="insertArtist" runat="server" Text="Insert Artist" class="w-full text-center text-white font-medium bg-dBlue border-2 border-dBlue px-6 py-2 rounded-full hover:bg-lBlue hover:border-lBlue" OnClick="insertArtist_Click" Visible="<%#ShowElementByAdmin()%>"/>
        </div>
    </div>

</asp:Content>
