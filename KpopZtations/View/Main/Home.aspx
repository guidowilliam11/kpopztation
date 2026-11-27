<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Main.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="KpopZtations.View.Main.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AuthForm" runat="server">
    <%-- The newest release leads, over its own cover blurred into a backdrop, as a music store's front page does. --%>
    <section class="relative overflow-hidden bg-dBlue" <%= Featured == null ? "style='display:none'" : "" %>>
        <img src="/Storage/Albums/<%= Featured?.AlbumImage %>" alt="" class="absolute inset-0 w-full h-full object-cover scale-125 blur-3xl opacity-70"/>
        <div class="absolute inset-0 bg-dBlue/60"></div>
        <div class="relative max-w-6xl mx-auto px-6 py-14 grid md:grid-cols-[280px_1fr] gap-10 items-center text-white">
            <a href="/View/Main/AlbumDetailsPage.aspx?id=<%= Featured?.AlbumID %>">
                <img src="/Storage/Albums/<%= Featured?.AlbumImage %>" alt="<%= Featured?.AlbumName %> cover" class="w-full max-w-[280px] aspect-square object-cover rounded-xl shadow-2xl"/>
            </a>
            <div>
                <p class="text-xs font-semibold tracking-[0.2em] text-lPink">NEW RELEASE · <%= Featured?.Kind.ToUpper() %></p>
                <h1 class="mt-2 text-5xl md:text-6xl font-bold tracking-tight"><%= Featured?.AlbumName %></h1>
                <p class="mt-2 text-xl text-white/85"><%= Featured?.ArtistName %></p>
                <p class="mt-1 text-sm text-white/65"><%= Featured?.Summary %> · <%= Featured?.ReleaseDate %></p>
                <div class="mt-7 flex flex-wrap items-center gap-3">
                    <a href="/View/Main/AlbumDetailsPage.aspx?id=<%= Featured?.AlbumID %>" class="inline-flex items-center gap-2 h-11 px-6 rounded-full bg-white text-dBlue font-semibold hover:bg-lPink">View album</a>
                    <span class="text-lg font-semibold tabular-nums"><%= Featured?.Price %></span>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <section class="mt-12">
        <div class="flex items-end justify-between mb-5">
            <div>
                <h2 class="text-2xl font-bold tracking-tight">New releases</h2>
                <p class="text-sm text-ink3 mt-1">Newest first, from every artist we stock.</p>
            </div>
            <div class="flex gap-2">
                <button type="button" class="swiper-prev w-9 h-9 grid place-items-center rounded-full border border-line hover:border-ink3" aria-label="Previous">&larr;</button>
                <button type="button" class="swiper-next w-9 h-9 grid place-items-center rounded-full border border-line hover:border-ink3" aria-label="Next">&rarr;</button>
            </div>
        </div>
        <div class="swiper album-swiper">
            <div class="swiper-wrapper">
                <asp:Repeater runat="server" ID="newAlbumsRepeater">
                    <ItemTemplate>
                    <div class="swiper-slide">
                        <a href="/View/Main/AlbumDetailsPage.aspx?id=<%# Eval("AlbumID") %>" class="group block">
                            <div class="relative aspect-square overflow-hidden rounded-lg bg-line shadow-sm">
                                <img src="/Storage/Albums/<%# Eval("AlbumImage") %>" alt="<%# Eval("AlbumName") %> cover" class="w-full h-full object-cover transition-transform duration-150 group-hover:scale-[1.03]"/>
                                <%# Eval("StockBadge") %>
                            </div>
                            <p class="mt-2 text-sm font-medium truncate"><%# Eval("AlbumName") %></p>
                            <p class="text-sm text-ink3 truncate"><%# Eval("ArtistName") %> · <%# Eval("Year") %></p>
                        </a>
                    </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>

    <%-- Ranked by copies sold, from the transaction details. Hidden until something has sold. --%>
    <section class="mt-14" <%= BestCount == 0 ? "style='display:none'" : "" %>>
        <h2 class="text-2xl font-bold tracking-tight">Best sellers</h2>
        <p class="text-sm text-ink3 mt-1">Most copies sold in the shop.</p>
        <ol class="mt-5 grid md:grid-cols-2 gap-x-10">
            <asp:Repeater runat="server" ID="bestRepeater">
                <ItemTemplate>
                    <li>
                        <a href="/View/Main/AlbumDetailsPage.aspx?id=<%# Eval("AlbumID") %>" class="group flex items-center gap-4 py-3 border-b border-line">
                            <span class="w-6 text-lg font-bold text-dPink tabular-nums"><%# Eval("Rank") %></span>
                            <img src="/Storage/Albums/<%# Eval("AlbumImage") %>" alt="" class="w-14 h-14 rounded-md object-cover bg-line"/>
                            <span class="min-w-0 flex-1">
                                <span class="block font-medium truncate group-hover:text-dPink"><%# Eval("AlbumName") %></span>
                                <span class="block text-sm text-ink3 truncate"><%# Eval("ArtistName") %> · <%# Eval("Kind") %></span>
                            </span>
                            <span class="text-sm text-ink3 tabular-nums whitespace-nowrap"><%# Eval("Sold") %> sold</span>
                        </a>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ol>
    </section>

    <section class="mt-14">
        <div class="flex items-end justify-between mb-6">
            <h2 class="text-2xl font-bold tracking-tight">Artists</h2>
            <asp:Button ID="insertArtist" runat="server" Text="Insert artist" class="text-sm text-white font-medium bg-dPink px-4 py-2 rounded-full hover:bg-dDPink cursor-pointer" OnClick="insertArtist_Click" Visible="<%#ShowElementByAdmin()%>"/>
        </div>
        <div class="grid grid-cols-2 sm:grid-cols-4 gap-6">
            <asp:Repeater runat="server" ID="artistRepeater">
                <ItemTemplate>
                    <div class="group text-center">
                        <a href="/View/Main/ArtistsDetailsPage.aspx?id=<%# Eval("ArtistID") %>" class="block">
                            <div class="mx-auto aspect-square w-full max-w-[200px] overflow-hidden rounded-full bg-line">
                                <img src="/Storage/Artists/<%# Eval("ArtistImage") %>" alt="<%# Eval("ArtistName") %>" class="w-full h-full object-cover object-top transition-transform duration-150 group-hover:scale-[1.04]"/>
                            </div>
                            <p class="mt-3 font-semibold group-hover:text-dPink"><%# Eval("ArtistName") %></p>
                        </a>
                        <div class="mt-2 flex justify-center gap-2" <%# ShowElementByAdmin() ? "" : "style='display: none;'" %>>
                            <a href="/View/Main/UpdateArtistPage.aspx?id=<%# Eval("ArtistID") %>" class="text-sm font-medium px-3 py-1 rounded-full border border-line hover:border-ink3">Update</a>
                            <a href="/View/DeleteArtistPage.aspx?id=<%# Eval("ArtistID") %>" class="text-sm font-medium px-3 py-1 rounded-full text-dPink hover:bg-lPink/60">Delete</a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </section>
</asp:Content>
