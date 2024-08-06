using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Customer
{
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string EmailAddress { get; set; }
    public string Phone { get; set; }
    public string Address { get; set; }
    public string City { get; set; }
    public string Province { get; set; }
    public string Zip { get; set; }
  
    public bool NewProductsInfo { get; set; }
    public bool NewRevisionsInfo { get; set; }
    public bool SpecialPromosInfo { get; set; }
    public bool LocalEventsInfo { get; set; }
    public string ContactVia { get; set; }
}
