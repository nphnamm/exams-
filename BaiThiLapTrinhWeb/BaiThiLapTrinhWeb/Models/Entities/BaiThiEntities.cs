using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace BaiThiLapTrinhWeb.Models.Entities
{
    public partial class BaiThiEntities : DbContext
    {
        public BaiThiEntities()
            : base("name=BaiThiEntities")
        {
        }

        public virtual DbSet<AnhChiTietSP> AnhChiTietSPs { get; set; }
        public virtual DbSet<ChiTietSPBan> ChiTietSPBans { get; set; }
        public virtual DbSet<DonHang> DonHangs { get; set; }
        public virtual DbSet<MauSac> MauSacs { get; set; }
        public virtual DbSet<NguoiDung> NguoiDungs { get; set; }
        public virtual DbSet<PhanLoai> PhanLoais { get; set; }
        public virtual DbSet<PhanLoaiPhu> PhanLoaiPhus { get; set; }
        public virtual DbSet<SanPham> SanPhams { get; set; }
        public virtual DbSet<SPtheoMau> SPtheoMaus { get; set; }
        public virtual DbSet<ChiTietDH> ChiTietDHs { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ChiTietSPBan>()
                .HasMany(e => e.ChiTietDHs)
                .WithRequired(e => e.ChiTietSPBan)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<DonHang>()
                .Property(e => e.PTThanhToan)
                .IsFixedLength();

            modelBuilder.Entity<DonHang>()
                .HasMany(e => e.ChiTietDHs)
                .WithRequired(e => e.DonHang)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<MauSac>()
                .HasMany(e => e.SPtheoMaus)
                .WithRequired(e => e.MauSac)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NguoiDung>()
                .HasMany(e => e.DonHangs)
                .WithRequired(e => e.NguoiDung)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PhanLoai>()
                .HasMany(e => e.SanPhams)
                .WithRequired(e => e.PhanLoai)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PhanLoaiPhu>()
                .HasMany(e => e.SanPhams)
                .WithRequired(e => e.PhanLoaiPhu)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<SanPham>()
                .HasMany(e => e.SPtheoMaus)
                .WithRequired(e => e.SanPham)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<SPtheoMau>()
                .HasMany(e => e.ChiTietSPBans)
                .WithRequired(e => e.SPtheoMau)
                .WillCascadeOnDelete(false);
        }
    }
}
