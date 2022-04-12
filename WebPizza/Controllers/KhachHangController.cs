using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebPizza.Models;

namespace WebPizza.Controllers
{
    public class KhachHangController : Controller
    {
        DataClasses1DataContext data = new DataClasses1DataContext();
        [HttpGet]
        public ActionResult DangKy()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Dangky(FormCollection collection, KhachHang kh,DangNhap ac)
        {
            var tenkh = collection["TenKH"];
            var diachi = collection["DiaChi"];
            var sdt = collection["SDT"];
            var taikhoa = collection["DangNhap.UseName"];
            var matkhau = collection["DangNhap.Password"];
            var MatKhauXacNhan = collection["MatKhauXacNhan"];

            if (string.IsNullOrEmpty(tenkh))
            {
                ViewData["Loi1"] = "Họ Tên Không Để Trống";
            }
            if (string.IsNullOrEmpty(diachi))
            {
                ViewData["Loi2"] = "Địa Chỉ Không Để Trống";
            }

            if (string.IsNullOrEmpty(sdt))
            {
                ViewData["Loi3"] = "Số Điên Thoại Không Để Trống";
            }

            if (string.IsNullOrEmpty(taikhoa))
            {
                ViewData["Loi4"] = "Tài Khoản Không Để Trống";
            }

            if (string.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi5"] = "Mật Khẩu Không Để Trống";
            }
            if (string.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi6"] = "Mật Khẩu Xác Nhận Không Để Trống";
            }
            if (sdt.Length > 10 || sdt.Length < 9)
            {
                ViewData["Loi7"] = "Số Điên Thoại không hợp lệ";
            }
            else
            {
                if (!matkhau.Equals(MatKhauXacNhan))
                {
                    ViewData["MatKhauGiongNhau"] = "Mật Khẩu Và Mật Khẩu Xác Nhận Phải Giống";
                }
                else
                {
                    List<KhachHang> listkh = data.KhachHangs.ToList();
                    int count = int.Parse(listkh.Count.ToString());
                    kh.MaKH = (count + 1).ToString();
                    kh.TenKH = tenkh;
                    kh.DiaChi= diachi;
                    kh.SDT = sdt;
                    kh.DangNhap.UseName = taikhoa;
                    kh.DangNhap.Password = matkhau; 
                    data.KhachHangs.InsertOnSubmit(kh);
                    data.SubmitChanges();

                    return RedirectToAction("DangNhap");
                }
            }

            return this.DangKy();
        }

        public ActionResult DangNhap()
        {
            ViewBag.Message = Session["Message"];
            ViewBag.AlertStatus = Session["AlertStatus"];
            Session.Remove("Message");
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection collection)
        {
            var tendangnhap = collection["UseName"];
            var matkhau = collection["Password"];

            DangNhap kh = data.DangNhaps.SingleOrDefault(n => n.UseName == tendangnhap && n.Password == matkhau);
            if (kh != null)
            {
                Session["TaiKhoan"] = kh;
                return RedirectToAction("Index", "TrangChu");
            }
            else
            {
                ViewData["erro"] = "Tài Khoản Mật Khẩu Không Đúng";
                return this.DangNhap();
            }
        }

        public ActionResult info()
        {
            DataClasses1DataContext data = new DataClasses1DataContext();
            DangNhap kh = (DangNhap)Session["Taikhoan"];
            return View(kh);
        }

        public ActionResult EditInfo(string id)
        {
            var kh = data.KhachHangs.First(p => p.MaKH == id);
            return View(kh);
        }
        [HttpPost]
        public ActionResult EditInfo(FormCollection collection,string id)
        {
            var kh = data.KhachHangs.First(p => p.MaKH == id);
            var tenkh = collection["TenKH"];
            var diachi = collection["DiaChi"];
            var sdt = collection["SDT"];
            kh.MaKH = id;
            if (sdt.Length > 10 || sdt.Length < 9)
            {
                ViewData["Loi7"] = "Số Điên Thoại không hợp lệ";
            }
            else
            {
                    kh.TenKH = tenkh;
                    kh.DiaChi = diachi;
                    kh.SDT = sdt;
                    UpdateModel(kh);
                    data.SubmitChanges();
                    Session["TaiKhoan"] = kh.DangNhap;
                    return RedirectToAction("info");
            }
            return this.EditInfo(id);
        }

        public ActionResult logout()
        {
            Session["TaiKhoan"] = null;
            return RedirectToAction("Index", "TrangChu");
        }
    }
}