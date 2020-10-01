using System.Collections.Generic;
using System.Linq;

namespace LifeInsuranceApp.ApiSettings
{
    public class FileSettings
    {
        public string SiteUrl { get; set; }
        public List<DirectoryMapping> DirectoryMappings { get; set; }
        public decimal AvailableCalories { get; set; }
        public DirectoryMapping this[string key]
        {
            get
            {
                if (DirectoryMappings == null)
                    return null;
                return DirectoryMappings.FirstOrDefault(q => q.Key == key);
            }
        }
   
    
    }
}
