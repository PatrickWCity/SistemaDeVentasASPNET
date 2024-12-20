﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcApplication1.Models;

namespace MvcApplication1.Controllers
{
   

    public class LoginController : Controller
    {
        private SistemaVentaEntities db = new SistemaVentaEntities();
        //
        // GET: /Login/

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CrearSesion(string email, string pass) {
            var usuar = db.Usuarios.Where(x => x.email == email && x.password == pass).FirstOrDefault();
            if (usuar != null)
            {
                Session["usuario"] = usuar;
                return RedirectToAction("index","Home");
            }
            else {
                ViewBag.error = "Usuario y contraseña no existen";
                return View("Index");
            }
        }


        [HttpGet]
        public JsonResult Iniciar(string email, string pass)
        {
            var usuar = db.Usuarios.Where(x => x.email == email && x.password == pass).FirstOrDefault();
            if (usuar != null)
            {
                Session["usuario"] = usuar;
                return Json(new { respuesta = "ok" }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                ViewBag.error = "Usuario y contraseña no existen";
                return Json(new { respuesta = "Usuario y contraseña no existen" }, JsonRequestBehavior.AllowGet);
            }
        }
        [HttpPost]
        public ActionResult CerrarSesion()
        {

                Session["usuario"] = null;
                return RedirectToAction("index", "Home");
        }
    }
}
