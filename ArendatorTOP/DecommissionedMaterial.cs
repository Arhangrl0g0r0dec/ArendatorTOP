//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ArendatorTOP
{
    using System;
    using System.Collections.Generic;
    
    public partial class DecommissionedMaterial
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DecommissionedMaterial()
        {
            this.DecommissionedMat_Material = new HashSet<DecommissionedMat_Material>();
        }
    
        public int Id { get; set; }
        public int IdEmployee { get; set; }
        public string PathToDocument16 { get; set; }
        public Nullable<System.DateTime> DateDecommission { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DecommissionedMat_Material> DecommissionedMat_Material { get; set; }
        public virtual Employee Employee { get; set; }
    }
}
