using demot.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace demot.Controllers
{
    public class HomeController : Controller
    {
        private QLBanHangQuanAoEntities db = new QLBanHangQuanAoEntities();
        public ActionResult Index()
        {
            var Phanloai = db.PhanLoais.ToList();
            ViewBag.Phanloai = Phanloai;
            var Sanpham = db.SanPhams.ToList();
            ViewBag.Sanpham = Sanpham;
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult GetProductByCategory(string phanloai)
        {
            if (phanloai == "Tất cả sản phẩm")
            {
                var sanPham1 = db.SanPhams.ToList();

                var _sanPham1 = sanPham1
                .Select(sp => new SanPham
                {
                    MaSanPham = sp.MaSanPham,
                    TenSanPham = sp.TenSanPham,
                    DonGiaBanNhoNhat = sp.DonGiaBanNhoNhat,
                    DonGiaBanLonNhat = sp.DonGiaBanLonNhat,
                    TrangThai = sp.TrangThai,
                    MoTaNgan = sp.MoTaNgan,
                    AnhDaiDien = sp.AnhDaiDien,
                    NoiBat = sp.NoiBat,
                    MaPhanLoaiPhu = sp.MaPhanLoaiPhu,
                    MaPhanLoai = sp.MaPhanLoai,
                    GiaNhap = sp.GiaNhap
                }).ToList();
                return Json(new { sanPham = _sanPham1 }, JsonRequestBehavior.AllowGet);
            }
            var sanPham = db.SanPhams
                .Where(sp => sp.PhanLoai.PhanLoaiChinh == phanloai)
                .ToList();

            // tạo danh sách mới chỉ lấy các thuộc tính
            // không lấy các đối tượng tham chiếu
            var _sanPham = sanPham
                .Select(sp => new SanPham
                {
                    MaSanPham = sp.MaSanPham,
                    TenSanPham = sp.TenSanPham,
                    GiaNhap = sp.GiaNhap,
                    AnhDaiDien = sp.AnhDaiDien

                }).ToList();

            return Json(new { sanPham = _sanPham }, JsonRequestBehavior.AllowGet);
        }

    }
}