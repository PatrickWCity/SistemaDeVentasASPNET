//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class ModoPago
    {
        public ModoPago()
        {
            this.Factura = new HashSet<Factura>();
        }
    
        public int numPago { get; set; }
        public string nombre { get; set; }
        public string otroDetalles { get; set; }
    
        public virtual ICollection<Factura> Factura { get; set; }
    }
}
