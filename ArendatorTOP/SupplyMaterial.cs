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
    
    public partial class SupplyMaterial
    {
        public int Id { get; set; }
        public int IdSupply { get; set; }
        public int IdMaterial { get; set; }
        public decimal Price { get; set; }
        public int Count { get; set; }
    
        public virtual Materials Materials { get; set; }
        public virtual Supply Supply { get; set; }
    }
}
