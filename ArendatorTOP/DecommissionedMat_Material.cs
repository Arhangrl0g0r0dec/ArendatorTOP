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
    
    public partial class DecommissionedMat_Material
    {
        public int Id { get; set; }
        public Nullable<int> IdMaterial { get; set; }
        public Nullable<int> IdObjectRent { get; set; }
        public Nullable<int> IdDecommissioned { get; set; }
        public string Count { get; set; }
    
        public virtual DecommissionedMaterial DecommissionedMaterial { get; set; }
        public virtual Materials Materials { get; set; }
        public virtual ObjectRent ObjectRent { get; set; }
    }
}
