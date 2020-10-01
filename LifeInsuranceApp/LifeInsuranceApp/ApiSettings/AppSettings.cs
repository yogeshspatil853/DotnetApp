using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LifeInsuranceApp.ApiSettings
{

    public class AppSettings
    {
        public static AppSettings Default { get; }
        public string ApiBaseUrl { get; }       

        protected AppSettings()
        {
        }

        static AppSettings()
        {
            Default = new AppSettings();
        }

        public bool IsDevelopment =>
            Environment.GetEnvironmentVariables()["ASPNETCORE_ENVIRONMENT"]?.ToString() == "Development";

    }

}
