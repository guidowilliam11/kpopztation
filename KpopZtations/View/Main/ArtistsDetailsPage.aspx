<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Main.Master" AutoEventWireup="true" CodeBehind="ArtistsDetailsPage.aspx.cs" Inherits="KpopZtations.View.Main.ArtistsDetailsPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AuthForm" runat="server">
    <%-- The artist's photo, blurred, is the backdrop; a sharp round portrait sits on it. The source photos are
         small, so the page never stretches one across the screen. --%>
    <section class="relative overflow-hidden bg-dBlue">
        <img src="/Storage/Artists/<%= CurrentArtist.ArtistImage %>" alt="" class="absolute inset-0 w-full h-full object-cover scale-125 blur-3xl opacity-80"/>
        <div class="absolute inset-0 bg-dBlue/55"></div>
        <div class="relative max-w-6xl mx-auto px-6 py-12 flex flex-col sm:flex-row sm:items-end gap-8 text-white">
            <img src="/Storage/Artists/<%= CurrentArtist.ArtistImage %>" alt="<%= CurrentArtist.ArtistName %>" class="w-48 h-48 rounded-full object-cover object-top ring-4 ring-white/20 shadow-2xl"/>
            <div class="pb-2">
                <a href="/View/Main/Home.aspx" class="text-sm text-white/75 hover:text-white">&larr; All artists</a>
                <h1 class="mt-2 text-6xl font-bold tracking-tight"><asp:Label ID="artistNameLbl" runat="server" Text="Label"></asp:Label></h1>
                <p class="mt-2 text-white/80"><%= Releases.Count %> releases in stock</p>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="mt-10 grid lg:grid-cols-[minmax(0,380px)_1fr] gap-10" <%= Latest == null ? "style='display:none'" : "" %>>
        <section>
            <h2 class="text-xl font-bold tracking-tight">Latest release</h2>
            <a href="/View/Main/AlbumDetailsPage.aspx?id=<%= Latest?.AlbumID %>" class="group mt-4 flex gap-4 items-center">
                <img src="/Storage/Albums/<%= Latest?.AlbumImage %>" alt="<%= Latest?.AlbumName %> cover" class="w-36 h-36 rounded-lg object-cover shadow-md"/>
                <div class="min-w-0">
                    <p class="text-xs font-semibold tracking-widest text-ink3"><%= Latest?.ReleaseDate.ToUpper() %></p>
                    <p class="mt-1 text-lg font-semibold group-hover:text-dPink"><%= Latest?.AlbumName %></p>
                    <p class="text-sm text-ink3"><%= Latest?.Summary %></p>
                    <p class="mt-2 font-semibold tabular-nums"><%= Latest?.Price %></p>
                </div>
            </a>
        </section>
        <section>
            <div class="flex items-end justify-between">
                <h2 class="text-xl font-bold tracking-tight">Albums</h2>
                <asp:Button ID="insertAlbum" runat="server" Text="Insert album" class="text-sm text-white font-medium bg-dPink px-4 py-2 rounded-full hover:bg-dDPink cursor-pointer" OnClick="insertAlbum_Click" Visible="<%#ShowElementByAdmin() %>" />
            </div>
            <div class="mt-4 grid grid-cols-2 sm:grid-cols-4 gap-x-5 gap-y-7">
                <asp:Repeater runat="server" ID="albumRepeater">
                    <ItemTemplate>
                        <div>
                            <a href="/View/Main/AlbumDetailsPage.aspx?id=<%# Eval("AlbumID")%>" class="group block">
                                <div class="relative aspect-square overflow-hidden rounded-lg bg-line shadow-sm">
                                    <img src="/Storage/Albums/<%# Eval("AlbumImage") %>" alt="<%# Eval("AlbumName") %> cover" class="w-full h-full object-cover transition-transform duration-150 group-hover:scale-[1.03]"/>
                                    <%# Eval("StockBadge") %>
                                </div>
                                <p class="mt-2 text-sm font-medium truncate group-hover:text-dPink"><%# Eval("AlbumName") %></p>
                                <p class="text-sm text-ink3"><%# Eval("Kind") %> · <%# Eval("Year") %></p>
                            </a>
                            <div class="mt-2 flex gap-2" <%# ShowElementByAdmin() ? "" : "style='display: none;'" %>>
                                <a href="/View/Main/UpdateAlbumsPage.aspx?id=<%# Eval("AlbumID") %>" class="text-sm font-medium px-3 py-1 rounded-full border border-line hover:border-ink3">Update</a>
                                <a href="/View/DeleteAlbumsPage.aspx?id=<%# Eval("AlbumID") %>" class="text-sm font-medium px-3 py-1 rounded-full text-dPink hover:bg-lPink/60">Delete</a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </section>
    </div>
</asp:Content>
