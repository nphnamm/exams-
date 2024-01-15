namespace BaiThiLapTrinhWeb.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("AnhChiTietSP")]
    public partial class AnhChiTietSP
    {
        [Key]
        [StringLength(50)]
        public string MaAnh { get; set; }

        [Required]
        [StringLength(50)]
        public string MaSPTheoMau { get; set; }

        [Required]
        [StringLength(50)]
        public string TenFileAnh { get; set; }
    }
}
