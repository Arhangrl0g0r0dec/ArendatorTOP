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
    
    public partial class ObjectRent
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ObjectRent()
        {
            this.Demonstration = new HashSet<Demonstration>();
            this.PhotoOR = new HashSet<PhotoOR>();
            this.Rent = new HashSet<Rent>();
            this.SentMaterials = new HashSet<SentMaterials>();
        }
    
        public int Id { get; set; }
        public int IdAppointment { get; set; }
        public double Square { get; set; }
        public decimal PriceForOneMeter { get; set; }
        public int Floor { get; set; }
        public int IdStatement { get; set; }
        public Nullable<bool> Del { get; set; }
    
        public virtual Appointment Appointment { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Demonstration> Demonstration { get; set; }
        public virtual Statement Statement { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PhotoOR> PhotoOR { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Rent> Rent { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SentMaterials> SentMaterials { get; set; }
    }
}
