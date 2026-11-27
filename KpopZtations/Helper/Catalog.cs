using KpopZtations.Model;
using KpopZtations.Repository;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace KpopZtations.Helper
{
    // One song on an album, as listed in Storage/AlbumInfo/<album>.json.
    public class TrackInfo
    {
        public int n { get; set; }
        public string title { get; set; }
        public int ms { get; set; }
        public string preview { get; set; }

        public int Number { get { return n; } }
        public string Title { get { return title; } }
        public string Preview { get { return preview ?? ""; } }
        public string Duration { get { return TimeSpan.FromMilliseconds(ms).ToString(@"m\:ss"); } }
    }

    // What the shop knows about an album beyond the Album table: kind, release date, label line and
    // tracklist. Kept as one JSON file per album so the database and the EF model stay as they are.
    public class AlbumInfo
    {
        public string kind { get; set; }
        public string released { get; set; }
        public string genre { get; set; }
        public string copyright { get; set; }
        public List<TrackInfo> tracks { get; set; } = new List<TrackInfo>();

        public DateTime ReleasedOn
        {
            get { DateTime d; return DateTime.TryParse(released, CultureInfo.InvariantCulture, DateTimeStyles.None, out d) ? d : DateTime.MinValue; }
        }
        public int Minutes { get { return (int)Math.Round(tracks.Sum(t => t.ms) / 60000.0); } }

        public static string Slug(string name)
        {
            var chars = (name ?? "").ToLowerInvariant().Select(c => char.IsLetterOrDigit(c) ? c : '-').ToArray();
            return string.Join("-", new string(chars).Split(new[] { '-' }, StringSplitOptions.RemoveEmptyEntries));
        }

        public static AlbumInfo For(string albumName)
        {
            var path = HttpContext.Current.Server.MapPath("~/Storage/AlbumInfo/" + Slug(albumName) + ".json");
            if (!File.Exists(path)) return new AlbumInfo { kind = "Album" };
            return new JavaScriptSerializer().Deserialize<AlbumInfo>(File.ReadAllText(path)) ?? new AlbumInfo();
        }
    }

    // An album ready for a page: the row, its info file and its artist, with display text worked out.
    public class AlbumView
    {
        private static readonly CultureInfo Id = new CultureInfo("id-ID");

        public Album Album { get; private set; }
        public AlbumInfo Info { get; private set; }
        public string ArtistName { get; private set; }
        public int Rank { get; set; }
        public int Sold { get; set; }

        public AlbumView(Album album, string artistName)
        {
            Album = album;
            Info = AlbumInfo.For(album.AlbumName);
            ArtistName = artistName;
        }

        public int AlbumID { get { return Album.AlbumID; } }
        public int ArtistID { get { return Album.ArtistID; } }
        public string AlbumName { get { return Album.AlbumName; } }
        public string AlbumImage { get { return Album.AlbumImage; } }
        public string Description { get { return Album.AlbumDescription; } }
        public int Stock { get { return Album.AlbumStock ?? 0; } }
        public string Price { get { return string.Format(Id, "Rp {0:N0}", Album.AlbumPrice ?? 0); } }
        public string Kind { get { return Info.kind ?? "Album"; } }
        public string Year { get { return Info.ReleasedOn == DateTime.MinValue ? "" : Info.ReleasedOn.Year.ToString(); } }
        public string ReleaseDate { get { return Info.ReleasedOn == DateTime.MinValue ? "" : Info.ReleasedOn.ToString("MMMM d, yyyy", CultureInfo.InvariantCulture); } }
        public string Summary
        {
            get
            {
                var n = Info.tracks.Count;
                return n == 0 ? Kind : n + (n == 1 ? " song" : " songs") + ", " + Info.Minutes + " minutes";
            }
        }
        // Shown on the cover only when it matters.
        public string StockBadge
        {
            get
            {
                if (Stock == 0) return "<span class='absolute top-2 left-2 text-xs font-semibold px-2 py-0.5 rounded bg-dBlue text-white'>Sold out</span>";
                if (Stock < 10) return "<span class='absolute top-2 left-2 text-xs font-semibold px-2 py-0.5 rounded bg-lPink text-dDPink'>Only " + Stock + " left</span>";
                return "";
            }
        }
        public string StockText
        {
            get { return Stock == 0 ? "Sold out" : Stock < 10 ? "Only " + Stock + " left" : Stock + " in stock"; }
        }
    }

    public static class Catalog
    {
        private static Dictionary<int, string> ArtistNames()
        {
            return new ArtistRepository().fetchAll().ToDictionary(a => a.ArtistID, a => a.ArtistName);
        }

        private static List<AlbumView> Views(IEnumerable<Album> albums)
        {
            var names = ArtistNames();
            return albums.Select(a => new AlbumView(a, names.ContainsKey(a.ArtistID) ? names[a.ArtistID] : "")).ToList();
        }

        // Newest release first; albums without an info file go last.
        public static List<AlbumView> NewReleases(int count)
        {
            return Views(new AlbumRepository().fetchAll()).OrderByDescending(v => v.Info.ReleasedOn).ThenByDescending(v => v.AlbumID).Take(count).ToList();
        }

        public static List<AlbumView> ByArtist(int artistId)
        {
            return Views(new AlbumRepository().fetchByArtist(artistId)).OrderByDescending(v => v.Info.ReleasedOn).ToList();
        }

        public static AlbumView One(int albumId)
        {
            var album = new AlbumRepository().search(albumId);
            return album == null ? null : Views(new[] { album }).First();
        }

        // Albums ranked by copies sold across all transactions.
        public static List<AlbumView> BestSellers(int count)
        {
            var sold = new TransactionDetailRepository().fetchAll()
                .GroupBy(d => d.AlbumID)
                .Select(g => new { AlbumID = g.Key, Qty = g.Sum(d => d.Qty ?? 0) })
                .OrderByDescending(x => x.Qty).Take(count).ToList();
            var albums = Views(new AlbumRepository().fetchAll()).ToDictionary(v => v.AlbumID);
            var rank = 1;
            return sold.Where(s => albums.ContainsKey(s.AlbumID))
                .Select(s => { var v = albums[s.AlbumID]; v.Sold = s.Qty; v.Rank = rank++; return v; }).ToList();
        }
    }
}
