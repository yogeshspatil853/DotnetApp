using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using LifeInsurance.DAL;
using LifeInsuranceApp.ApiSettings;
using System.IO;

namespace LifeInsuranceApp.Controllers
{
       public class BaseApiController : ControllerBase
        {
            protected readonly DataContext _dataContext;
            protected readonly IWebHostEnvironment _env;
            protected readonly IConfiguration _IConfiguration;
            protected readonly FileSettings _fileSettings;
            protected string WebRootPath => _env?.WebRootPath;

            public BaseApiController(DataContext dataContext, IConfiguration config,  IWebHostEnvironment env = null) : base()
            {
                _dataContext = dataContext;
               
                _env = env;
                _IConfiguration = config;

            }
            protected void EnsureFolder(string path)
            {
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
            }
            protected string MapPath(string path)
            {
                return Path.Combine(WebRootPath, path);
            }
            protected string GetDirPath(string entityType)
            {
                var directoryPathMapping = _fileSettings[entityType];
                if (directoryPathMapping == null)
                {
                    return WebRootPath;
                }
                return directoryPathMapping.IsRelative ? MapPath(directoryPathMapping.Path) : directoryPathMapping.Path;
            }
            protected string GetFilePath(string entityType, string fileName)
            {
                return Path.Combine(GetDirPath(entityType), fileName);
            }
        }
 }
