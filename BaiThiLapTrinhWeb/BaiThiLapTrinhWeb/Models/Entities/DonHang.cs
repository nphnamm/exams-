namespace BaiThiLapTrinhWeb.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DonHang")]
    public partial class DonHang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DonHang()
        {
            ChiTietDHs = new HashSet<ChiTietDH>();
        }

        [Key]
        [StringLength(50)]
        public string MaDonHang { get; set; }

        public DateTime NgayDatHang { get; set; }

        [Required]
        [StringLength(50)]
        public string MaNguoiDung { get; set; }

        [Required]
        [StringLength(50)]
        public string DiaChiGiaoHang { get; set; }

        [Required]
        [StringLength(10)]
        public string PTThanhToan { get; set; }

        [Required]
        [StringLength(50)]
        public string TinhTrang { get; set; }

        [Required]
        [StringLength(50)]
        public string TenNguoiNhanHang { get; set; }

        [Required]
        [StringLength(50)]
        public string SoDienThoaiNhanHang { get; set; }

        public int TongTien { get; set; }

        public int GiamGia { get; set; }

        [Required]
        [StringLength(50)]
        public string GhiChu { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietDH> ChiTietDHs { get; set; }

        public virtual NguoiDung NguoiDung { get; set; }
    }
}
