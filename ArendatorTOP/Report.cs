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
    
    public partial class Report
    {
        public int Id { get; set; }
        public int IdEmployee { get; set; }
        public int IdTypeReport { get; set; }
        public System.DateTime DateCreated { get; set; }
        public System.TimeSpan TimeCreated { get; set; }
        public string PathToReport { get; set; }
    
        public virtual Employee Employee { get; set; }
        public virtual TypeOfReport TypeOfReport { get; set; }
    }
}