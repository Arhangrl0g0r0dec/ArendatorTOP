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
    
    public partial class Document
    {
        public int Id { get; set; }
        public int IdTypeOfDocument { get; set; }
        public int NumDocument { get; set; }
        public int IdRent { get; set; }
        public string PathToDocument { get; set; }
    
        public virtual Rent Rent { get; set; }
        public virtual TypeOfDocument TypeOfDocument { get; set; }
    }
}
