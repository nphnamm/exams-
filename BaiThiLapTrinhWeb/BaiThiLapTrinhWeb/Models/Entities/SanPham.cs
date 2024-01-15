namespace BaiThiLapTrinhWeb.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SanPham")]
    public partial class SanPham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SanPham()
        {
            SPtheoMaus = new HashSet<SPtheoMau>();
        }

        [Key]
        [StringLength(50)]
        public string MaSanPham { get; set; }

        [Required]
        [StringLength(50)]
        [RegularExpression(@"^[A-Za-z]*[A-Za-z][A-Za-z0-9-. _]*$", ErrorMessage = "Ten san pham phai bat dau bang 1 ky tu chu cai")]

        public string TenSanPham { get; set; }

        [Required]
        [StringLength(50)]
        public string MaPhanLoai { get; set; }

        public int GiaNhap { get; set; }

        public int DonGiaBanNhoNhat { get; set; }

        public int DonGiaBanLonNhat { get; set; }

        [Required]
        [StringLength(50)]
        public string TrangThai { get; set; }

        [Required]
        [StringLength(50)]
        [RegularExpression(@"^[A-Za-z]*[A-Za-z][A-Za-z0-9-. _]*$", ErrorMessage = "Mo ta ngan phai bat dau bang 1 ky tu chu cai")]

        public string MoTaNgan { get; set; }

        [Required]
        [StringLength(50)]
        [RegularExpression(@"\.jpg$", ErrorMessage ="File anh chi co duoi mo rong la jpg")]
        public string AnhDaiDien { get; set; }

        [Required]
        [StringLength(50)]
        public string NoiBat { get; set; }

        [Required]
        [StringLength(50)]
        public string MaPhanLoaiPhu { get; set; }

        public virtual PhanLoai PhanLoai { get; set; }

        public virtual PhanLoaiPhu PhanLoaiPhu { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SPtheoMau> SPtheoMaus { get; set; }
    }
}
