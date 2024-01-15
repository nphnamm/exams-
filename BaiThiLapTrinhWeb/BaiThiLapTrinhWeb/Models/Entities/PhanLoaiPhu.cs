namespace BaiThiLapTrinhWeb.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PhanLoaiPhu")]
    public partial class PhanLoaiPhu
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PhanLoaiPhu()
        {
            SanPhams = new HashSet<SanPham>();
        }

        [Key]
        [StringLength(50)]
        public string MaPhanLoaiPhu { get; set; }

        [Required]
        [StringLength(50)]
        public string TenPhanLoaiPhu { get; set; }

        [Required]
        [StringLength(50)]
        public string MaPhanLoai { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SanPham> SanPhams { get; set; }
    }
}
