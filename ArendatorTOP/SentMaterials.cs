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
    
    public partial class SentMaterials
    {
        public int Id { get; set; }
        public int IdMaterial { get; set; }
        public int IdObjectRent { get; set; }
        public int IdEmployee { get; set; }
        public string PathToDocument13 { get; set; }
        public int Count { get; set; }
        public System.DateTime DateSent { get; set; }
    
        public virtual Employee Employee { get; set; }
        public virtual Materials Materials { get; set; }
        public virtual ObjectRent ObjectRent { get; set; }
    }
}
