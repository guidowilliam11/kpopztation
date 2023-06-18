using KpopZtations.Handler;
using KpopZtations.Model;
using System;
using System.Collections.Generic;
using System.Web;

namespace KpopZtations.Controller
{
    public class CartController
    {
        private CartHandler ch = new CartHandler();
        private AlbumHandler ah = new AlbumHandler();
        private TransactionHeaderHandler thh = new TransactionHeaderHandler();
        private TransactionDetailHandler tdh = new TransactionDetailHandler();

        public String validateQty(int qty, int albumId)
        {
            String errorMsg = null;
            Album a = new Album();
            a = ah.searchAlbum(albumId);

            if (qty == -1)
            {
                errorMsg = "Quantity must be filled!";
            }
            else if (qty > a.AlbumStock)
            {
                errorMsg = "Quantity must be below than current album stock!" + "(" + a.AlbumStock + ")";
            }
            return errorMsg;
        }

        public String doInsert(int userId, int albumId, int qty)
        {
            String errorMsg = validateQty(qty, albumId);

            if (errorMsg == null)
            {
                errorMsg = null;

                if (ch.findSameAlbum(userId, albumId) == null)
                {
                    ch.insertCart(userId, albumId, qty);
                }
                else
                {
                    int newQty = ch.getCartQty(userId, albumId) + qty;
                    ch.updateQty(userId, albumId, newQty);
                }
            }
            return errorMsg;
        }

        public bool checkCart()
        {
            int userId = Convert.ToInt32(HttpContext.Current.Session["userId"].ToString());

            List<Cart> carts = ch.getUserCart(userId);

            if (carts == null)
            {
                return true;
            }

            return false;
        }

        public String checkOut()
        {
            int userId = Convert.ToInt32(HttpContext.Current.Session["userId"].ToString());

            List<Cart> carts = ch.getUserCart(userId);

            if (carts == null)
            {
                return "Carts are empty!";
            }

            DateTime currentDate = DateTime.Now;
            String dateFormat = currentDate.ToString("yyyy-MM-dd HH:mm:ss");

            thh.insertTh(dateFormat, userId);

            int lastId = tdh.getLatestThId();

            for (int i = 0; i < carts.Count; i++)
            {
                tdh.insert(lastId, carts[i].AlbumID, (int)carts[i].Qty);
            }

            ch.clearCart(userId);

            return "";
        }
    }
}