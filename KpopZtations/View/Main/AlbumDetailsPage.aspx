<%@ Page Title="" Language="C#" MasterPageFile="~/View/Master/Main.Master" AutoEventWireup="true" CodeBehind="AlbumDetailsPage.aspx.cs" Inherits="KpopZtations.View.Main.AlbumDetailsPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AuthForm" runat="server">
    <%-- Header over the album's own cover, blurred and washed out, so each album page takes its colour. --%>
    <section class="relative overflow-hidden">
        <img src="/Storage/Albums/<%= Current.AlbumImage %>" alt="" class="absolute inset-0 w-full h-full object-cover scale-125 blur-3xl opacity-50"/>
        <div class="absolute inset-0 bg-canvas/60"></div>
        <div class="relative max-w-6xl mx-auto px-6 py-10 grid md:grid-cols-[300px_1fr] gap-10 items-end">
            <img src="/Storage/Albums/<%= Current.AlbumImage %>" alt="<%= Current.AlbumName %> cover" class="w-full max-w-[300px] aspect-square object-cover rounded-xl shadow-2xl"/>
            <div>
                <p class="text-xs font-semibold tracking-[0.2em] text-ink3"><%= Current.Kind.ToUpper() %></p>
                <h1 class="mt-1 text-5xl font-bold tracking-tight"><%= Current.AlbumName %></h1>
                <a href="/View/Main/ArtistsDetailsPage.aspx?id=<%= Current.ArtistID %>" class="mt-1 inline-block text-2xl text-dPink hover:text-dDPink"><%= Current.ArtistName %></a>
                <p class="mt-1 text-sm text-ink3"><%= Current.Info.genre %> · <%= Current.Year %></p>
                <div class="mt-6 flex flex-wrap items-center gap-3">
                    <button type="button" class="js-play-first inline-flex items-center gap-2 h-11 px-6 rounded-full bg-dPink text-white font-semibold hover:bg-dDPink" <%= Current.Info.tracks.Count == 0 ? "style='display:none'" : "" %>>&#9654; Preview</button>
                    <asp:TextBox ID="qtyTb" runat="server" TextMode="Number" Text="1" min="1" aria-label="Quantity" CssClass="w-20 h-11 px-3 rounded-full border border-line bg-white text-base text-center focus:border-dPink focus:ring-dPink" Visible="<%# ShowElementByCustomer() %>"></asp:TextBox>
                    <asp:Button ID="addToCartBtn" runat="server" Text="Add to cart" OnClick="addToCartBtn_Click" CssClass="h-11 px-6 rounded-full border border-dBlue text-dBlue font-semibold hover:bg-dBlue hover:text-white cursor-pointer" Visible="<%# ShowElementByCustomer() %>"/>
                </div>
                <p class="mt-4"><span class="text-2xl font-semibold tabular-nums"><%= Current.Price %></span>
                    <span class="ml-2 text-sm <%= Current.Stock < 10 ? "text-dDPink font-medium" : "text-ink3" %>"><%= Current.StockText %></span></p>
                <asp:Label ID="lblError" runat="server" Text="" CssClass="block mt-3 text-sm text-dDPink"></asp:Label>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <%-- Tracklist. Each row plays its 30-second preview; the playing row shows bars instead of its number. --%>
    <section class="mt-8" <%= Current.Info.tracks.Count == 0 ? "style='display:none'" : "" %>>
        <ol class="divide-y divide-line">
            <asp:Repeater runat="server" ID="tracksRepeater">
                <ItemTemplate>
                    <li>
                        <button type="button" class="js-track group w-full grid grid-cols-[2.5rem_1fr_auto] items-center gap-3 px-3 h-12 rounded-md text-left hover:bg-lPink/40" data-preview="<%# Eval("Preview") %>">
                            <span class="text-sm text-ink3 tabular-nums text-center">
                                <span class="js-num group-hover:hidden"><%# Eval("Number") %></span>
                                <span class="js-hover hidden group-hover:inline text-dPink">&#9654;</span>
                                <span class="js-bars hidden items-end justify-center gap-[2px] h-3"><i class="w-[3px] h-full bg-dPink"></i><i class="w-[3px] h-2/3 bg-dPink"></i><i class="w-[3px] h-1/3 bg-dPink"></i></span>
                            </span>
                            <span class="truncate"><%# Eval("Title") %></span>
                            <span class="text-sm text-ink3 tabular-nums"><%# Eval("Duration") %></span>
                        </button>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ol>
        <p class="mt-5 px-3 text-sm text-ink3 leading-relaxed"><%= Current.ReleaseDate %><br/><%= Current.Summary %><br/><%= Current.Info.copyright %></p>
    </section>

    <section class="mt-14" <%= MoreCount == 0 ? "style='display:none'" : "" %>>
        <div class="flex items-end justify-between mb-5">
            <h2 class="text-2xl font-bold tracking-tight">More by <%= Current.ArtistName %></h2>
            <div class="flex gap-2">
                <button type="button" class="swiper-prev w-9 h-9 grid place-items-center rounded-full border border-line hover:border-ink3" aria-label="Previous">&larr;</button>
                <button type="button" class="swiper-next w-9 h-9 grid place-items-center rounded-full border border-line hover:border-ink3" aria-label="Next">&rarr;</button>
            </div>
        </div>
        <div class="swiper album-swiper">
            <div class="swiper-wrapper">
                <asp:Repeater runat="server" ID="moreRepeater">
                    <ItemTemplate>
                    <div class="swiper-slide">
                        <a href="/View/Main/AlbumDetailsPage.aspx?id=<%# Eval("AlbumID") %>" class="group block">
                            <div class="relative aspect-square overflow-hidden rounded-lg bg-line shadow-sm">
                                <img src="/Storage/Albums/<%# Eval("AlbumImage") %>" alt="<%# Eval("AlbumName") %> cover" class="w-full h-full object-cover transition-transform duration-150 group-hover:scale-[1.03]"/>
                                <%# Eval("StockBadge") %>
                            </div>
                            <p class="mt-2 text-sm font-medium truncate"><%# Eval("AlbumName") %></p>
                            <p class="text-sm text-ink3 truncate"><%# Eval("Kind") %> · <%# Eval("Year") %></p>
                        </a>
                    </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>

    <audio class="js-audio" preload="none"></audio>
    <script>
        // One audio element for the page. Clicking a row plays its preview; clicking it again pauses.
        (function () {
            var audio = document.querySelector('.js-audio'), rows = document.querySelectorAll('.js-track'), current = null;
            function mark(row, on) {
                row.querySelector('.js-num').classList.toggle('hidden', on);
                row.querySelector('.js-hover').classList.toggle('group-hover:inline', !on);
                row.querySelector('.js-bars').classList.toggle('hidden', !on);
                row.querySelector('.js-bars').classList.toggle('flex', on);
                row.classList.toggle('text-dPink', on);
            }
            function play(row) {
                var same = current === row && !audio.paused;
                if (current) mark(current, false);
                if (same) { audio.pause(); current = null; return; }
                current = row; audio.src = row.dataset.preview; audio.play(); mark(row, true);
            }
            rows.forEach(function (r) { if (r.dataset.preview) r.addEventListener('click', function () { play(r); }); });
            audio.addEventListener('ended', function () { if (current) mark(current, false); current = null; });
            var first = document.querySelector('.js-play-first');
            if (first && rows.length) first.addEventListener('click', function () { play(rows[0]); });
        })();
    </script>
</asp:Content>
