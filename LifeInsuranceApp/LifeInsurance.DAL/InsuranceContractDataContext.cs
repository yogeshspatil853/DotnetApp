using LifeInsurance.Model;
using Microsoft.Data.SqlClient;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace LifeInsurance.DAL
{
    public partial class DataContext
    {
        public IQueryable<CoveragePlanModel> GetCoveragePlan(string country, string gender, DateTime saleDate,int age)
        {
            try
            {
                SqlParameter[] parameter = {
                    new SqlParameter("@country", country),
                    new SqlParameter("@gender", gender),
                    new SqlParameter("@saleDate", saleDate) ,
                     new SqlParameter("@age", age)
                };
                return FromSQLRAWWithParams<CoveragePlanModel>("[DBO].[spGetCoveragePlan]", parameter);
            }
            catch (Exception e)
            {
                throw;
            }
        }


        public IQueryable<ContractListModel> GetInsuranceContractList(string search, string sortCol, string sortDir, int skip, int take)
        {
            try
            {
                SqlParameter[] parameter = {
                    new SqlParameter("@search", search),
                    new SqlParameter("@sortCol", sortCol),
                    new SqlParameter("@sortDir", sortDir),
                    new SqlParameter("@skip", skip),
                    new SqlParameter("@take", take)
                };
                return FromSQLRAWWithParams<ContractListModel>("[DBO].[spGetInsuranceContractLst]", parameter);
            }
            catch (Exception e)
            {
                throw;
            }
        }
        public async Task<DbStatusResult> AddInsuranseContractDetail(ContractEntityModel entity)
        {
            var cmd = new DbStatusCommand();
            await ExecuteSQLWithParams("[dbo].[spAddContractInfo]",
                  GetJsonParam("@contractInfo", entity),
                  cmd.IdParam,
                  cmd.StatusParam,
                  cmd.MessageParam);
            return cmd.StatusResult;
        }
        public async Task<DbStatusResult> UpdateInsuranseContractDetail(ContractEntityModel entity)
        {
            var cmd = new DbStatusCommand();
            await ExecuteSQLWithParams("[dbo].[spUpdateContractInfo]",
                  GetJsonParam("@contractInfo", entity),
                  cmd.IdParam,
                  cmd.StatusParam,
                  cmd.MessageParam);
            return cmd.StatusResult;
        }
        public async Task<DbStatusResult> DeleteInsuranseContractDetail(int id)
        {
            var cmd = new DbStatusCommand();
            await ExecuteSQLWithParams("[dbo].spDeleteInsuranseContract",
                  new SqlParameter("@contractId", id),
                  cmd.IdParam,
                  cmd.StatusParam,
                  cmd.MessageParam);

            return cmd.StatusResult;
        }
    }
}