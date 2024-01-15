namespace BaiThiLapTrinhWeb.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietSPBan")]
    public partial class ChiTietSPBan
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ChiTietSPBan()
        {
            ChiTietDHs = new HashSet<ChiTietDH>();
        }

        [Key]
        [StringLength(50)]
        public string MaChiTietSP { get; set; }

        [Required]
        [StringLength(50)]
        public string MaSPTheoMau { get; set; }

        [Required]
        [StringLength(50)]
        public string KichCo { get; set; }

        public int SoLuong { get; set; }

        public int DonGiaBan { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietDH> ChiTietDHs { get; set; }

        public virtual SPtheoMau SPtheoMau { get; set; }
    }
}
