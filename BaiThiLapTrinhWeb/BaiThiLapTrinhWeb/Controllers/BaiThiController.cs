using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BaiThiLapTrinhWeb.Models.Entities;

namespace BaiThiLapTrinhWeb.Controllers
{
    public class BaiThiController : Controller
    {
        // GET: BaiThi
        BaiThiEntities db = new BaiThiEntities();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult RenderPhanLoaiPhu() 
        {

            List<PhanLoaiPhu> PhanLoaiPhu = db.PhanLoaiPhus.ToList();

            return PartialView("_PhanLoaiPhu", PhanLoaiPhu);
        
        }
        public ActionResult RenderSanPham()
        {

            List<SanPham> SanPham = db.SanPhams.ToList();

            return PartialView("_SanPham", SanPham);

        }

        public ActionResult RenderSanPhamBangPhanLoaiPhu(string maPhanLoaiPhu)
        {

            List<SanPham> SanPham = db.SanPhams.Where(x=> x.MaPhanLoaiPhu.Equals(maPhanLoaiPhu)).ToList();

            return PartialView("_SanPham", SanPham);

        }
        public ActionResult SuaSanPham(string maSanPham)
        {
            SanPham sanPham = db.SanPhams.Where(x => x.MaSanPham.Equals(maSanPham)).FirstOrDefault();

            ViewBag.MaPhanLoaiPhu = new SelectList(db.PhanLoaiPhus, "MaPhanLoaiPhu", "TenPhanLoaiPhu","MaPhanLoai");
            ViewBag.MaPhanLoai = new SelectList(db.PhanLoais, "MaPhanLoai", "PhanLoaiChinh");
            ViewBag.SPTheoMau = new SelectList(db.SPtheoMaus, "MaSPTheoMau", "MaSanPham","MaMau");

            return View(sanPham);
        }
        [HttpPost]
        public ActionResult SuaSanPham(string maSanPham,SanPham sp)
        {

            SanPham SanPhamHienTai = db.SanPhams.Where(x => x.MaSanPham.Equals(maSanPham)).FirstOrDefault();

            if (ModelState.IsValid)
            {
                SanPhamHienTai.MaSanPham = sp.MaSanPham;
                SanPhamHienTai.TenSanPham= sp.TenSanPham;
                SanPhamHienTai.GiaNhap = sp.GiaNhap;
                SanPhamHienTai.DonGiaBanNhoNhat = sp.DonGiaBanNhoNhat;
                SanPhamHienTai.DonGiaBanLonNhat = sp.DonGiaBanLonNhat;
                SanPhamHienTai.MoTaNgan =sp.MoTaNgan;
                SanPhamHienTai.NoiBat =sp.NoiBat; 
                SanPhamHienTai.MaPhanLoai =sp.MaPhanLoai;
                SanPhamHienTai.TrangThai =sp.TrangThai;
                SanPhamHienTai.AnhDaiDien =sp.AnhDaiDien;
                SanPhamHienTai.MaPhanLoaiPhu =sp.MaPhanLoaiPhu;

                db.SaveChanges();
            }

            return RedirectToAction("Index");
        }


    }
}