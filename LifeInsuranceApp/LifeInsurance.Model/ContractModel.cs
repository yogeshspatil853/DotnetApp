using System;

namespace LifeInsurance.Model
{

    public class ContractEntityModel
    {
        public int Id { get; set; }
        public string CustomerName { get; set; }
        public string CustomerAddress { get; set; }
        public string CustomerGender { get; set; }
        public string CustomerCountry { get; set; }
        public DateTime DateofBirth { get; set; }
        public DateTime SaleDate { get; set; }
        public string CoveragePlan { get; set; }
        public decimal NetPrice { get; set; }
    }

    public class CoveragePlanModel
    {
        public string CoveragePlan { get; set; }
        public string customerAge { get; set; }
        public decimal NetPrice { get; set; }
    }
    public class ContractModel
    {
        public int Id { get; set; }
        public string CustomerName { get; set; }
        public string CustomerGender { get; set; }
        public string CustomerAddress { get; set; }
        public DateTime DateofBirth { get; set; }
        public DateTime SaleDate { get; set; }
        public string CustomerCountry { get; set; }
    }

    public class ContractListModel
    {
        public int Id { get; set; }
        public string CustomerName { get; set; }
        public string CustomerAddress { get; set; }
        public string CustomerGender { get; set; }
        public string CustomerCountry { get; set; }
        public DateTime DateofBirth { get; set; }
        public DateTime SaleDate { get; set; }
        public string CoveragePlan { get; set; }
        public decimal NetPrice { get; set; }
        public DateTime AddedDate { get; set; }

    }
}
