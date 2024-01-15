namespace BaiThiLapTrinhWeb.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SPtheoMau")]
    public partial class SPtheoMau
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SPtheoMau()
        {
            ChiTietSPBans = new HashSet<ChiTietSPBan>();
        }

        [Key]
        [StringLength(50)]
        public string MaSPTheoMau { get; set; }

        [Required]
        [StringLength(50)]
        public string MaSanPham { get; set; }

        [Required]
        [StringLength(50)]
        public string MaMau { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietSPBan> ChiTietSPBans { get; set; }

        public virtual MauSac MauSac { get; set; }

        public virtual SanPham SanPham { get; set; }
    }
}
