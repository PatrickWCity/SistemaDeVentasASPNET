﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MvcApplication1.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class SistemaVentaEntities : DbContext
    {
        public SistemaVentaEntities()
            : base("name=SistemaVentaEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Categoria> Categoria { get; set; }
        public DbSet<Cliente> Cliente { get; set; }
        public DbSet<DetalleVenta> DetalleVenta { get; set; }
        public DbSet<Factura> Factura { get; set; }
        public DbSet<ModoPago> ModoPago { get; set; }
        public DbSet<Producto> Producto { get; set; }
        public DbSet<Vendedor> Vendedor { get; set; }
        public DbSet<Venta> Venta { get; set; }
    }
}
