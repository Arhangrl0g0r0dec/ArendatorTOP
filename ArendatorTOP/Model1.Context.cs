﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class ArendatorTOPEntities : DbContext
    {
        public ArendatorTOPEntities()
            : base("name=ArendatorTOPEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<ApplicationToReception> ApplicationToReception { get; set; }
        public virtual DbSet<Appointment> Appointment { get; set; }
        public virtual DbSet<Client> Client { get; set; }
        public virtual DbSet<DecommissionedMaterial> DecommissionedMaterial { get; set; }
        public virtual DbSet<Demonstration> Demonstration { get; set; }
        public virtual DbSet<Document> Document { get; set; }
        public virtual DbSet<Employee> Employee { get; set; }
        public virtual DbSet<FormOfPayment> FormOfPayment { get; set; }
        public virtual DbSet<Materials> Materials { get; set; }
        public virtual DbSet<ObjectRent> ObjectRent { get; set; }
        public virtual DbSet<PhotoOR> PhotoOR { get; set; }
        public virtual DbSet<Post> Post { get; set; }
        public virtual DbSet<Rent> Rent { get; set; }
        public virtual DbSet<Report> Report { get; set; }
        public virtual DbSet<SentMaterials> SentMaterials { get; set; }
        public virtual DbSet<Statement> Statement { get; set; }
        public virtual DbSet<Supplier> Supplier { get; set; }
        public virtual DbSet<Supply> Supply { get; set; }
        public virtual DbSet<TypeOfDocument> TypeOfDocument { get; set; }
        public virtual DbSet<TypeOfMaterial> TypeOfMaterial { get; set; }
        public virtual DbSet<TypeOfReport> TypeOfReport { get; set; }
        public virtual DbSet<User> User { get; set; }
        public virtual DbSet<Message> Message { get; set; }
        public virtual DbSet<SupplyMaterial> SupplyMaterial { get; set; }
    }
}
