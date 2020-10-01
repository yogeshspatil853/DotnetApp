using System;

namespace LifeInsurance.DAL.Attributes
{
    [AttributeUsage(AttributeTargets.Property, Inherited = true)]
    public class DbParamNotMappedAttribute : Attribute
    {

    }
}
