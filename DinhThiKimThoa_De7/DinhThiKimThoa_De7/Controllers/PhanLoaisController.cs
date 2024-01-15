using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using DinhThiKimThoa_De7.Models;

namespace DinhThiKimThoa_De7.Controllers
{
    public class PhanLoaisController : Controller
    {
        private QLBanChauCanhEntities db = new QLBanChauCanhEntities();

        // GET: PhanLoais
        public async Task <ActionResult> Index()
        {
            
            var sanpham = await db.SanPhams.ToListAsync();
            ViewBag.sanpham = sanpham;
            return View(await db.PhanLoais.ToListAsync());
        }

        // GET: PhanLoais/Details/5
        public ActionResult Details(string id)
        {
            
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhanLoai phanLoai = db.PhanLoais.Find(id);
            if (phanLoai == null)
            {
                return HttpNotFound();
            }
            return View(phanLoai);
        }

        // GET: PhanLoais/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: PhanLoais/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaPhanLoai,PhanLoaiChinh")] PhanLoai phanLoai)
        {
            if (ModelState.IsValid)
            {
                db.PhanLoais.Add(phanLoai);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(phanLoai);
        }

        // GET: PhanLoais/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhanLoai phanLoai = db.PhanLoais.Find(id);
            if (phanLoai == null)
            {
                return HttpNotFound();
            }
            return View(phanLoai);
        }

        // POST: PhanLoais/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaPhanLoai,PhanLoaiChinh")] PhanLoai phanLoai)
        {
            if (ModelState.IsValid)
            {
                db.Entry(phanLoai).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(phanLoai);
        }

        // GET: PhanLoais/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhanLoai phanLoai = db.PhanLoais.Find(id);
            if (phanLoai == null)
            {
                return HttpNotFound();
            }
            return View(phanLoai);
        }

        // POST: PhanLoais/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            PhanLoai phanLoai = db.PhanLoais.Find(id);
            db.PhanLoais.Remove(phanLoai);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        public ActionResult GetProductByCategory(string phanloai)
        {

            var sanPham = db.SanPhams
                .Where(sp => sp.PhanLoai.PhanLoaiChinh == phanloai)
                .ToList();

            var _sanPham = sanPham
                .Select(sp => new SanPham
                {
                    MaSanPham = sp.MaSanPham,
                    TenSanPham = sp.TenSanPham,
                    AnhDaiDien = sp.AnhDaiDien,
                    DonGiaBanNhoNhat = sp.DonGiaBanNhoNhat,
                }).ToList();

            return Json(new { sanPham = _sanPham }, JsonRequestBehavior.AllowGet);
        }
    }
}
