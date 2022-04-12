using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebPizza.Models;

namespace WebPizza.Controllers
{
    public class GioHangController : Controller
    {
        // GET: GioHang
        DataClasses1DataContext data = new DataClasses1DataContext();
        public ActionResult Index()
        {
            return View();
        }


        public List<GioHang> Laygiohang()
        {
            List<GioHang> lstGiohang = Session["GioHang"] as List<GioHang>;
            if (lstGiohang == null)
            {
                lstGiohang = new List<GioHang>();
                Session["GioHang"] = lstGiohang;
            }
            return lstGiohang;
        }

        public ActionResult ThemGioHang(string id, string type = "Normal")
        {
            List<GioHang> listGiohang = Laygiohang();
            GioHang sanpham = listGiohang.Find(n => n.mabanh == id);
            sanpham = new GioHang(id);
            listGiohang.Add(sanpham);
            return RedirectToAction("GioHang");
        }

        private int TongSoLuong()
        {
            int tsl = 0;
            List<GioHang> lstGiohang = Session["GioHang"] as List<GioHang>;
            if (lstGiohang != null)
            {
                tsl = lstGiohang.Sum(n => n.soluong);
            }
            return tsl;
        }
        private int TongSoLuongSanPham()
        {
            int tsl = 0;
            List<GioHang> lstGiohang = Session["GioHang"] as List<GioHang>;
            if (lstGiohang != null)
            {
                tsl = lstGiohang.Count;
            }
            return tsl;
        }
        private double TongTien()
        {
            double tt = 0;
            List<GioHang> lstGiohang = Session["GioHang"] as List<GioHang>;
            if (lstGiohang != null)
            {
                tt = lstGiohang.Sum(n => n.thanhtien);
            }
            return tt;
        }
        public ActionResult GioHang()
        {
            List<GioHang> lstGiohang = Laygiohang();
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            ViewBag.Tongsoluongsanpham = TongSoLuongSanPham();
            ViewBag.Message = Session["Message"];
            ViewBag.AlertStatus = Session["AlertStatus"];
            Session.Remove("Message");
            Session.Remove("AlertStatus");
            return View(lstGiohang);
        }

        public ActionResult GioHangPartial()
        {
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            ViewBag.Tongsoluongsanpham = TongSoLuongSanPham();
            return PartialView();
        }
        public ActionResult XoaGiohang(int id)
        {
            List<GioHang> lstGiohang = Laygiohang();
            GioHang sanpham = null;
            for (int i = 0; i < lstGiohang.Count; i++)
            {
                if (i == id)
                {
                    sanpham = lstGiohang[i];
                    break;
                }
            }
            if (sanpham != null)
            {
                lstGiohang.Remove(sanpham);
            }
            return RedirectToAction("GioHang");
        }
        public ActionResult CapnhatGiohang(int id, FormCollection collection)
        {
            List<GioHang> lstGiohang = Laygiohang();
            GioHang sanpham = null;
            for (int i = 0; i < lstGiohang.Count; i++)
            {
                if (i == id)
                {
                    Size size = data.Sizes.FirstOrDefault(n => n.MaS == collection["size"]);
                    LoaiVien vien = data.LoaiViens.FirstOrDefault(n => n.MaV == collection["vien"]);
                    LoaiDe de = data.LoaiDes.FirstOrDefault(n => n.MaD == collection["de"]);
                    PhanThem them = data.PhanThems.FirstOrDefault(n => n.MaPT == collection["them"]);
                    int soluong = int.Parse(collection["txtSolg"].ToString());
                    double giasize = double.Parse(size.GTS.ToString());
                    double giavien = double.Parse(vien.GTV.ToString());
                    double giathem = double.Parse(them.GTPhanThem.ToString());
                    lstGiohang[i].soluong = soluong;
                    lstGiohang[i].Giasize = giasize;
                    lstGiohang[i].Giaphanthem = giathem;
                    lstGiohang[i].Giavien = giavien;
                    lstGiohang[i].size = size;
                    lstGiohang[i].vien = vien;
                    lstGiohang[i].de = de;
                    lstGiohang[i].phanthem = them;
                    break;
                }
            }
            return RedirectToAction("GioHang");
        }
        public ActionResult XoaTatCaGioHang()
        {
            List<GioHang> lstGiohang = Laygiohang();
            lstGiohang.Clear();
            return RedirectToAction("GioHang");
        }

        [HttpGet]
        public ActionResult DatHang()
        {
            if (Session["TaiKhoan"] == null || Session["TaiKhoan"].ToString() == "")
            {
                return RedirectToAction("DangNhap", "KhachHang");
            }
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "TrangChu");
            }
            List<GioHang> IstGiohang = Laygiohang();
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            ViewBag.Tongsoluongsanpham = TongSoLuongSanPham();
            return View(IstGiohang);
        }
        public ActionResult DatHang(FormCollection collection)
        {
            HoaDon dh = new HoaDon();
            DangNhap kh = (DangNhap)Session["Taikhoan"]; 
            List<GioHang> gh = Laygiohang();
            List<HoaDon> listhoadon = data.HoaDons.ToList();
            int count = listhoadon.Count();
            dh.MaHD = (count + 1).ToString();
            dh.MaKH = kh.KhachHang.MaKH; 
            dh.NgayLap = DateTime.Now;
            dh.ThanhToan = false;
            dh.TongTien = (decimal)TongTien();
            data.HoaDons.InsertOnSubmit(dh);
            data.SubmitChanges();
            foreach (var item in gh)
            {
                ChiTietHoaDon ctdh = new ChiTietHoaDon();
                ctdh.MaHD = (count + 1).ToString();
                ctdh.MaBanh = item.mabanh;
                ctdh.MaV = item.vien.MaV;
                ctdh.MaS = item.size.MaS;
                ctdh.MaD = item.de.MaD;
                ctdh.MaPT = item.phanthem.MaPT;
                ctdh.TongGia = (decimal)item.thanhtien;
                ctdh.SoLuong = item.soluong;
                data.ChiTietHoaDons.InsertOnSubmit(ctdh);
            }
            data.SubmitChanges();
            Session["Giohang"] = null;
            return RedirectToAction("XacNhanDonHang", "Giohang");
        }

        public ActionResult XacNhanDonHang()
        {
            return View();
        }
        public ActionResult TheoDoiDonHang()
        {
            DataClasses1DataContext data = new DataClasses1DataContext();
            DangNhap kh = (DangNhap)Session["Taikhoan"];
            List<HoaDon> listhd = data.HoaDons.Where(p => p.MaKH == kh.MaKH).ToList();
            Session["CTHD"] = data.ChiTietHoaDons.ToList();
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            ViewBag.Tongsoluongsanpham = TongSoLuongSanPham();
            return View(listhd);
        }

        public ActionResult ChiTietHD(string id)
        {
            DataClasses1DataContext data = new DataClasses1DataContext();
            List<ChiTietHoaDon> listcthd = data.ChiTietHoaDons.Where(p => p.MaHD == id).ToList();
            return View(listcthd);
        }

        public ActionResult ThanhToan()
        {
            

            string endpoint = "https://test-payment.momo.vn/v2/gateway/api/create";
            string partnerCode = "MOMO5RGX20191128";
            string accessKey = "M8brj9K6E22vXoDB";
            string serectkey = "nqQiVSgDMy809JoPF6OzP5OdBUB550Y4";
            string orderInfo = "DH" + DateTime.Now.ToString("ddMMyyyHHmmss");
            string redirectUrl = "https://localhost:44377/GioHang/ReturnUrl";
            string ipnUrl = "https://localhost:44377/GioHang/Notifyurl";
            string requestType = "captureWallet";

            string amount = TongTien().ToString();
            string orderId = Guid.NewGuid().ToString();
            string requestId = Guid.NewGuid().ToString();
            string extraData = "";

            //Before sign HMAC SHA256 signature
            string rawHash = "accessKey=" + accessKey +
                "&amount=" + amount +
                "&extraData=" + extraData +
                "&ipnUrl=" + ipnUrl +
                "&orderId=" + orderId +
                "&orderInfo=" + orderInfo +
                "&partnerCode=" + partnerCode +
                "&redirectUrl=" + redirectUrl +
                "&requestId=" + requestId +
                "&requestType=" + requestType
                ;

            MoMoSecurity crypto = new MoMoSecurity();
            //sign signature SHA256
            string signature = crypto.signSHA256(rawHash, serectkey);

            //build body json request
            JObject message = new JObject
            {
                { "partnerCode", partnerCode },
                { "partnerName", "Test" },
                { "storeId", "MomoTestStore" },
                { "requestId", requestId },
                { "amount", amount },
                { "orderId", orderId },
                { "orderInfo", orderInfo },
                { "redirectUrl", redirectUrl },
                { "ipnUrl", ipnUrl },
                { "lang", "en" },
                { "extraData", extraData },
                { "requestType", requestType },
                { "signature", signature }

            };

            string responseFromMomo = PaymentRequest.sendPaymentRequest(endpoint, message.ToString());

            JObject jmessage = JObject.Parse(responseFromMomo);
            return Redirect(jmessage.GetValue("payUrl").ToString());
        }

        public ActionResult ReturnUrl()
        {
            if (!Request.QueryString["resultCode"].Equals("0"))
            {
                return RedirectToAction("DatHang", "Giohang");
            }
            else
            {
                HoaDon dh = new HoaDon();
                DangNhap kh = (DangNhap)Session["Taikhoan"];
                List<GioHang> gh = Laygiohang();
                List<HoaDon> listhoadon = data.HoaDons.ToList();
                int count = listhoadon.Count();
                dh.MaHD = (count + 1).ToString();
                dh.MaKH = kh.KhachHang.MaKH;
                dh.NgayLap = DateTime.Now;
                dh.ThanhToan = true;
                dh.TongTien = (decimal)TongTien();
                data.HoaDons.InsertOnSubmit(dh);
                data.SubmitChanges();
                foreach (var item in gh)
                {
                    ChiTietHoaDon ctdh = new ChiTietHoaDon();
                    ctdh.MaHD = (count + 1).ToString();
                    ctdh.MaBanh = item.mabanh;
                    ctdh.MaV = item.vien.MaV;
                    ctdh.MaS = item.size.MaS;
                    ctdh.MaD = item.de.MaD;
                    ctdh.MaPT = item.phanthem.MaPT;
                    ctdh.TongGia = (decimal)item.thanhtien;
                    ctdh.SoLuong = item.soluong;
                    data.ChiTietHoaDons.InsertOnSubmit(ctdh);
                }
                data.SubmitChanges();
                Session["Giohang"] = null;
                return RedirectToAction("XacNhanDonHang", "Giohang");
            }
        }

        public JsonResult Notifyurl()
        {
            string status_code = Request["status_code"].ToString();
            if((status_code != "0"))
            {
            }  
            else
            {
                
            }
            return Json("", JsonRequestBehavior.AllowGet);
        }
    }

}
