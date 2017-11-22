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
    
    public partial class Producto
    {
        public Producto()
        {
            this.DetalleVenta = new HashSet<DetalleVenta>();
        }
    
        public int idProducto { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public int precioUnitario { get; set; }
        public string url_imagen { get; set; }
        public Nullable<int> idCategoria { get; set; }
    
        public virtual Categoria Categoria { get; set; }
        public virtual ICollection<DetalleVenta> DetalleVenta { get; set; }
    }
}
