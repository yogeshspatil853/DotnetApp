using System;
using System.Collections.Generic;
using System.Text;

namespace LifeInsurance.Model
{
    public class ResponseModel
    {
        public int StatusCode { get; set; }
        public object ResponseObject { get; set; }
        public string Message { get; set; }
    }
}
