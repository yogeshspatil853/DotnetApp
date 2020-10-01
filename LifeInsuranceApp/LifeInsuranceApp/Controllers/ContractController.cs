using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;

using Microsoft.AspNetCore.Mvc;

using System.Linq;
using LifeInsuranceApp.ApiSettings;
using LifeInsurance.DAL;
using LifeInsurance.Model;
using Microsoft.EntityFrameworkCore;
using System;

namespace LifeInsuranceApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ContractController : BaseApiController
    {
        public ContractController(DataContext dataContext, IConfiguration config, Microsoft.AspNetCore.Hosting.IWebHostEnvironment env) :
           base(dataContext, config, env)
        {
        }

        [HttpGet]
        [Route("GetInsuranceContractListByRequest")]
        public async Task<ActionResult<ResponseModel>> GetInsuranceContractListByRequest(string search, string sortCol, string sortDir, int skip, int take)
        {

            search = string.IsNullOrEmpty(search) ? string.Empty : search;
            sortCol = string.IsNullOrEmpty(sortCol) ? "Id" : sortCol;
            sortDir = string.IsNullOrEmpty(sortDir) ? "desc" : sortDir;
            var model = new ResponseModel();
            var data = await _dataContext.GetInsuranceContractList(search, sortCol, sortDir, skip, take).ToListAsync();
            if (data != null)
            {
                model.ResponseObject = data;
                model.StatusCode = 200;
                model.Message = "success";
            }
            else
            {
                model.StatusCode = 404;
                model.Message = "no data found";
            }

            return model;
        }

        [HttpPost]
        [Route("AddUpdateInsuranceContract")]
        public async Task<ActionResult<ResponseModel>> AddUpdateInsuranceContract(ContractModel model)
        {
            var result = new ResponseModel();

            // Calculate the age.
            var age = DateTime.Today.Year - model.DateofBirth.Year;
            var objCoverageResponse = _dataContext.GetCoveragePlan(model.CustomerCountry, model.CustomerGender, model.SaleDate, age).ToList();

            if (objCoverageResponse != null && objCoverageResponse.Any())
            {
                var contract = new ContractEntityModel()
                {
                    Id = model.Id,
                    CustomerName = model.CustomerName,
                    CustomerAddress = model.CustomerAddress,
                    CustomerGender = model.CustomerGender,
                    CustomerCountry = model.CustomerCountry,
                    DateofBirth = model.DateofBirth,
                    SaleDate = model.SaleDate,
                    CoveragePlan = objCoverageResponse.FirstOrDefault()?.CoveragePlan,
                    NetPrice = objCoverageResponse.FirstOrDefault()?.NetPrice ?? 0
                };

                var data = new DbStatusResult();

                if (model.Id > 0)
                {
                    data = await _dataContext.UpdateInsuranseContractDetail(contract);
                }
                else
                {
                    data = await _dataContext.AddInsuranseContractDetail(contract);
                }

                if (!data.Status)
                {
                    result.StatusCode = 404;
                    result.Message = result.Message;
                }
                else
                {
                    result.StatusCode = 200;
                    result.Message = "success";
                }
            }
            else
            {
                result.StatusCode = 404;
                result.Message = "Coverage plan or Net Price not found according criteria so operation has been rollback";
            }

            return result;
        }

        [HttpGet]
        [Route("DeleteInsuranceContractInfo/{id}")]
        public async Task<ActionResult<ResponseModel>> DeleteFoodInfo(int id)
        {
            var model = new ResponseModel();
            var result = await _dataContext.DeleteInsuranseContractDetail(id);

            if (!result.Status)
            {
                model.StatusCode = 404;
                model.Message = result.Message;
            }
            else
            {
                model.StatusCode = 200;
            }
            return model;
        }
    }
}
