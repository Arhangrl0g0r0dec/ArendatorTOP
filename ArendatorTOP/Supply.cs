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
    
    public partial class Supply
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Supply()
        {
            this.SupplyMaterial = new HashSet<SupplyMaterial>();
        }
    
        public int Id { get; set; }
        public int IdSuppler { get; set; }
        public int IdApplicationOnReciption { get; set; }
        public bool Formed { get; set; }
        public string PathToDocument { get; set; }
    
        public virtual ApplicationToReception ApplicationToReception { get; set; }
        public virtual Supplier Supplier { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SupplyMaterial> SupplyMaterial { get; set; }
    }
}
