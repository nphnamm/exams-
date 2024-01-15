namespace BaiThiLapTrinhWeb.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("MauSac")]
    public partial class MauSac
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public MauSac()
        {
            SPtheoMaus = new HashSet<SPtheoMau>();
        }

        [Key]
        [StringLength(50)]
        public string MaMau { get; set; }

        [Required]
        [StringLength(50)]
        public string TenMau { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SPtheoMau> SPtheoMaus { get; set; }
    }
}
