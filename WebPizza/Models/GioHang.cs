using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using WebPizza.Models;

namespace WebPizza.Models
{
    public class GioHang
    {
        DataClasses1DataContext data = new DataClasses1DataContext();
        public string mabanh { get; set; }

        [Display(Name = "Ten banh")]
        public string tenbanh { get; set; }

        [Display(Name = "Anh bia")]
        public string hinh { get; set; }

        [Display(Name = "Gia ban")]
        public double giaban { get; set; }

        [Display(Name = "So luong")]
        public int soluong { get; set; }

        [Display(Name = "Thanh tien")]
        public double thanhtien
        {
            get { return soluong * (giaban + Giavien + Giasize + Giaphanthem); }
        }

        [Display(Name = "Size")]
        public Size size { get; set; }
        public double Giasize { get; set; }
        public String tensize { get; set; }

        [Display(Name = "Vien")]
        public LoaiVien vien { get; set; }
        public double Giavien { get; set; }
        public String tenvien { get; set; }

        [Display(Name = "De")]
        public LoaiDe de { get; set; }
        public String tende { get; set; }

        [Display(Name = "Phan them")]
        public PhanThem phanthem { get; set; }
        public double Giaphanthem { get; set; }
        public String tenphanthem { get; set; }

        public bool? thanhtoan { get; set; }

    public GioHang(string id)
        {
            mabanh = id;
            BanhPizza pizza = data.BanhPizzas.Single(n => n.MaBanh == mabanh);
            LoaiVien Vien = data.LoaiViens.Single(n => n.MaV == "V0");
            LoaiDe De = data.LoaiDes.Single(n => n.MaD == "D1");
            Size Size = data.Sizes.Single(n => n.MaS == "S");
            PhanThem them = data.PhanThems.Single(n => n.MaPT == "5");
            thanhtoan = false;
            tenbanh = pizza.TenBanh;
            hinh = pizza.Image;
            giaban = double.Parse(pizza.DonGia.ToString());
            soluong = 1;
            size = Size;
            Giasize = double.Parse(Size.GTS.ToString());
            vien = Vien;
            Giavien = double.Parse(Vien.GTV.ToString());
            phanthem = them;
            Giaphanthem = double.Parse(them.GTPhanThem.ToString());
            de = De;
            ListSize = data.Sizes.ToList();
            ListDe = data.LoaiDes.ToList();
            ListVien = data.LoaiViens.ToList();
            ListThem = data.PhanThems.ToList();
        }

        public List<Size> ListSize = new List<Size>();
        public List<LoaiDe> ListDe = new List<LoaiDe>();
        public List<LoaiVien> ListVien = new List<LoaiVien>();
        public List<PhanThem> ListThem = new List<PhanThem>();

    }
}