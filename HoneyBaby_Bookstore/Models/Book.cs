using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HoneyBaby_Bookstore.Models
{
    public class Book
    {
        public string BookID { get; set; }
        public string Title { get; set; }
        public string ShortDescription { get; set; }
        public string LongDescription { get; set; }
        public decimal UnitPrice { get; set; }
        public string ImageFile { get; set; }
    }
}