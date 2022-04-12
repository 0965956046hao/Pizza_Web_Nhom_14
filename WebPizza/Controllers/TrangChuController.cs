using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebPizza.Models;
namespace WebPizza.Controllers
{
    public class TrangChuController : Controller
    {
        // GET: TrangChu
        DataClasses1DataContext data = new DataClasses1DataContext();
        public ActionResult Index()
        {
            var all_pizza = from web in data.BanhPizzas select web;
            return View(all_pizza);
        }


    }
}