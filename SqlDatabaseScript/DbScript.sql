USE [LifeInsuranceDb]
GO
/****** Object:  UserDefinedFunction [dbo].[fnMapContractInfo]    Script Date: 01-Oct-20 7:41:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Function [dbo].[fnMapContractInfo]
(
	@json nvarchar(max)
)
Returns Table
as
Return(
	 select * from OpenJson(@json)
	 with
	 (
	Id int,
	CustomerName nvarchar(200),
	CustomerAddress nvarchar(200),
	CustomerGender nvarchar(10),
	CustomerCountry nvarchar(100),
	DateofBirth datetime,
	SaleDate datetime,
	CoveragePlan nvarchar(100),
	NetPrice decimal(18, 0),	
	AddedDate datetime,
	ModifiedDate datetime ,
	Isdeleted bit 	
	 )
)
GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 01-Oct-20 7:41:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contracts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](200) NOT NULL,
	[CustomerAddress] [nvarchar](200) NOT NULL,
	[CustomerGender] [nvarchar](10) NOT NULL,
	[CustomerCountry] [nvarchar](100) NOT NULL,
	[DateofBirth] [datetime] NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[CoveragePlan] [nvarchar](100) NOT NULL,
	[NetPrice] [decimal](18, 0) NOT NULL,
	[AddedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Contracts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CoveragePlan]    Script Date: 01-Oct-20 7:41:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoveragePlan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CoveragePlan] [nvarchar](100) NOT NULL,
	[EligibilityDateFrom] [datetime] NOT NULL,
	[EligibilityDateTo] [datetime] NOT NULL,
	[EligibilityCountry] [nvarchar](50) NOT NULL,
	[AddedDate] [datetime] NOT NULL,
	[Modifieddate] [datetime] NULL,
	[Isdeleted] [bit] NOT NULL,
 CONSTRAINT [PK_CoveragePlan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RateChart]    Script Date: 01-Oct-20 7:41:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RateChart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CoveragePlanId] [int] NOT NULL,
	[CustomerGender] [nvarchar](50) NOT NULL,
	[CustomerAge] [nvarchar](50) NOT NULL,
	[NetPrice] [decimal](18, 0) NOT NULL,
	[AddedDate] [datetime] NOT NULL,
	[Modifieddate] [datetime] NULL,
	[Isdeleted] [bit] NOT NULL,
 CONSTRAINT [PK_RateChart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET IDENTITY_INSERT [dbo].[Contracts] ON 
GO
INSERT [dbo].[Contracts] ([Id], [CustomerName], [CustomerAddress], [CustomerGender], [CustomerCountry], [DateofBirth], [SaleDate], [CoveragePlan], [NetPrice], [AddedDate], [ModifiedDate], [IsDeleted]) VALUES (1, N'dev', N'USA', N'M', N' USA', CAST(N'2010-10-01T12:34:16.603' AS DateTime), CAST(N'2020-10-01T12:34:16.603' AS DateTime), N'Gold', CAST(0 AS Decimal(18, 0)), CAST(N'2020-10-01T12:38:22.533' AS DateTime), CAST(N'2020-10-01T06:39:27.803' AS DateTime), 0)
GO
INSERT [dbo].[Contracts] ([Id], [CustomerName], [CustomerAddress], [CustomerGender], [CustomerCountry], [DateofBirth], [SaleDate], [CoveragePlan], [NetPrice], [AddedDate], [ModifiedDate], [IsDeleted]) VALUES (2, N'Deepak Soni', N'2/43 Pratap Nager', N'F', N' USA', CAST(N'1970-10-01T13:40:26.077' AS DateTime), CAST(N'2020-10-01T13:40:26.077' AS DateTime), N'Platinum', CAST(2800 AS Decimal(18, 0)), CAST(N'2020-10-01T13:41:10.890' AS DateTime), CAST(N'2020-10-01T07:51:23.753' AS DateTime), 0)
GO
INSERT [dbo].[Contracts] ([Id], [CustomerName], [CustomerAddress], [CustomerGender], [CustomerCountry], [DateofBirth], [SaleDate], [CoveragePlan], [NetPrice], [AddedDate], [ModifiedDate], [IsDeleted]) VALUES (3, N'Ronit Sharma', N'2/43 Pratap Nager', N'F', N'IND', CAST(N'1990-10-01T13:40:26.077' AS DateTime), CAST(N'2020-10-01T13:40:26.077' AS DateTime), N'Gold', CAST(1200 AS Decimal(18, 0)), CAST(N'2020-10-01T14:08:11.893' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Contracts] ([Id], [CustomerName], [CustomerAddress], [CustomerGender], [CustomerCountry], [DateofBirth], [SaleDate], [CoveragePlan], [NetPrice], [AddedDate], [ModifiedDate], [IsDeleted]) VALUES (4, N'Vikas Sharma', N'2/43 Pratap Nager', N'F', N'IND', CAST(N'1990-10-01T13:40:26.077' AS DateTime), CAST(N'2020-10-01T13:40:26.077' AS DateTime), N'Silver', CAST(2100 AS Decimal(18, 0)), CAST(N'2020-10-01T14:09:54.947' AS DateTime), NULL, 0)
GO

SET IDENTITY_INSERT [dbo].[Contracts] OFF
GO
SET IDENTITY_INSERT [dbo].[CoveragePlan] ON 
GO
INSERT [dbo].[CoveragePlan] ([Id], [CoveragePlan], [EligibilityDateFrom], [EligibilityDateTo], [EligibilityCountry], [AddedDate], [Modifieddate], [Isdeleted]) VALUES (1, N'Gold', CAST(N'2009-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-01T00:00:00.000' AS DateTime), N'USA', CAST(N'2020-10-01T00:00:00.000' AS DateTime), NULL, 0)
GO
INSERT [dbo].[CoveragePlan] ([Id], [CoveragePlan], [EligibilityDateFrom], [EligibilityDateTo], [EligibilityCountry], [AddedDate], [Modifieddate], [Isdeleted]) VALUES (2, N'Platinum', CAST(N'2005-01-01T00:00:00.000' AS DateTime), CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'CAN', CAST(N'2020-10-01T00:00:00.000' AS DateTime), NULL, 0)
GO
INSERT [dbo].[CoveragePlan] ([Id], [CoveragePlan], [EligibilityDateFrom], [EligibilityDateTo], [EligibilityCountry], [AddedDate], [Modifieddate], [Isdeleted]) VALUES (3, N'Silver', CAST(N'2001-01-01T00:00:00.000' AS DateTime), CAST(N'2026-01-01T00:00:00.000' AS DateTime), N'*', CAST(N'2020-10-01T00:00:00.000' AS DateTime), NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[CoveragePlan] OFF
GO
SET IDENTITY_INSERT [dbo].[RateChart] ON 
GO
INSERT [dbo].[RateChart] ([Id], [CoveragePlanId], [CustomerGender], [CustomerAge], [NetPrice], [AddedDate], [Modifieddate], [Isdeleted]) VALUES (1, 1, N'M', N'<=40', CAST(1000 AS Decimal(18, 0)), CAST(N'2020-10-01T00:00:00.000' AS DateTime), NULL, 0)
GO
INSERT [dbo].[RateChart] ([Id], [CoveragePlanId], [CustomerGender], [CustomerAge], [NetPrice], [AddedDate], [Modifieddate], [Isdeleted]) VALUES (2, 1, N'M', N'>40', CAST(2000 AS Decimal(18, 0)), CAST(N'2020-10-01T00:00:00.000' AS DateTime), NULL, 0)
GO
INSERT [dbo].[RateChart] ([Id], [CoveragePlanId], [CustomerGender], [CustomerAge], [NetPrice], [AddedDate], [Modifieddate], [Isdeleted]) VALUES (3, 1, N'F', N'<=40', CAST(1200 AS Decimal(18, 0)), CAST(N'2020-10-01T00:00:00.000' AS DateTime), NULL, 0)
GO
INSERT [dbo].[RateChart] ([Id], [CoveragePlanId], [CustomerGender], [CustomerAge], [NetPrice], [AddedDate], [Modifieddate], [Isdeleted]) VALUES (4, 1, N'F', N'>40 ', CAST(2500 AS Decimal(18, 0)), CAST(N'2020-10-01T00:00:00.000' AS DateTime), NULL, 0)
GO
INSERT [dbo].[RateChart] ([Id], [CoveragePlanId], [CustomerGender], [CustomerAge], [NetPrice], [AddedDate], [Modifieddate], [Isdeleted]) VALUES (5, 2, N'M', N'<=40  ', CAST(1500 AS Decimal(18, 0)), CAST(N'2020-10-01T00:00:00.000' AS DateTime), NULL, 0)
GO
INSERT [dbo].[RateChart] ([Id], [CoveragePlanId], [CustomerGender], [CustomerAge], [NetPrice], [AddedDate], [Modifieddate], [Isdeleted]) VALUES (6, 2, N'M', N'>40 ', CAST(2600 AS Decimal(18, 0)), CAST(N'2020-10-01T00:00:00.000' AS DateTime), NULL, 0)
GO
INSERT [dbo].[RateChart] ([Id], [CoveragePlanId], [CustomerGender], [CustomerAge], [NetPrice], [AddedDate], [Modifieddate], [Isdeleted]) VALUES (7, 2, N'F', N'<=40  ', CAST(1900 AS Decimal(18, 0)), CAST(N'2020-10-01T00:00:00.000' AS DateTime), NULL, 0)
GO
INSERT [dbo].[RateChart] ([Id], [CoveragePlanId], [CustomerGender], [CustomerAge], [NetPrice], [AddedDate], [Modifieddate], [Isdeleted]) VALUES (8, 2, N'F', N'>40 ', CAST(2800 AS Decimal(18, 0)), CAST(N'2020-10-01T00:00:00.000' AS DateTime), NULL, 0)
GO
INSERT [dbo].[RateChart] ([Id], [CoveragePlanId], [CustomerGender], [CustomerAge], [NetPrice], [AddedDate], [Modifieddate], [Isdeleted]) VALUES (9, 3, N'M', N'<=40  ', CAST(1900 AS Decimal(18, 0)), CAST(N'2020-10-01T00:00:00.000' AS DateTime), NULL, 0)
GO
INSERT [dbo].[RateChart] ([Id], [CoveragePlanId], [CustomerGender], [CustomerAge], [NetPrice], [AddedDate], [Modifieddate], [Isdeleted]) VALUES (10, 3, N'M', N'>40 ', CAST(2900 AS Decimal(18, 0)), CAST(N'2020-10-01T00:00:00.000' AS DateTime), NULL, 0)
GO
INSERT [dbo].[RateChart] ([Id], [CoveragePlanId], [CustomerGender], [CustomerAge], [NetPrice], [AddedDate], [Modifieddate], [Isdeleted]) VALUES (11, 3, N'F', N'<=40  ', CAST(2100 AS Decimal(18, 0)), CAST(N'2020-10-01T00:00:00.000' AS DateTime), NULL, 0)
GO
INSERT [dbo].[RateChart] ([Id], [CoveragePlanId], [CustomerGender], [CustomerAge], [NetPrice], [AddedDate], [Modifieddate], [Isdeleted]) VALUES (12, 3, N'F', N'>40 ', CAST(3200 AS Decimal(18, 0)), CAST(N'2020-10-01T00:00:00.000' AS DateTime), NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[RateChart] OFF
GO
/****** Object:  StoredProcedure [dbo].[spAddContractInfo]    Script Date: 01-Oct-20 7:41:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[spAddContractInfo] @contractInfo nvarchar(max),@id int output, @status bit output, @message nvarchar(max) output
as
begin
	BEGIN TRY
		BEGIN TRAN	

			--get mst(malaysian) -------------------------------------
			--declare @AddedUtcDateTime datetime
			--SELECT @AddedUtcDateTime= SWITCHOFFSET(GETUTCDATE(), '+03:00')
			---------------------------------------------
	
			insert into [dbo].[Contracts](CustomerName,CustomerAddress,CustomerGender,CustomerCountry,DateofBirth,SaleDate ,CoveragePlan,NetPrice,AddedDate,ModifiedDate,IsDeleted) 		
			select CustomerName,CustomerAddress,CustomerGender,CustomerCountry,DateofBirth,SaleDate ,CoveragePlan,NetPrice,GETUTCDATE(),null,0  from [dbo].[fnMapContractInfo](@contractInfo)
			set @id=scope_identity();
			set @status=1;

		COMMIT TRAN
	END TRY
	BEGIN CATCH
		set @status=0;
		IF(@@TRANCOUNT > 0)
			ROLLBACK TRAN;
		set @message=ERROR_MESSAGE()
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[spDeleteInsuranseContract]    Script Date: 01-Oct-20 7:41:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROCEDURE [dbo].[spDeleteInsuranseContract] @contractId int, @id int output, @status bit output, @message nvarchar(max) output
as
begin
	BEGIN TRY
		BEGIN TRAN
			update contracts set Isdeleted =1 where Id=@contractId	
			set @status=1
		
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		set @status=0;
		set @id=0
		IF(@@TRANCOUNT > 0)
			ROLLBACK TRAN;
		set @message=ERROR_MESSAGE()
	END CATCH
end 
GO
/****** Object:  StoredProcedure [dbo].[spGetCoveragePlan]    Script Date: 01-Oct-20 7:41:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spGetCoveragePlan] @country varchar(100),@gender varchar(20), @saleDate datetime,@age int
as
	begin			
			select c.CoveragePlan,r.customerAge,r.netPrice from CoveragePlan c 
			join  RateChart r on c.Id=r.coveragePlanId 
			where r.Customergender=@gender and EligibilityCountry=@country and  @saleDate  between c.EligibilityDateFrom and c.EligibilityDateTo 			
			and (@age = CASE 
						WHEN CustomerAge like '<=%' and  @age <= Cast(REPLACE(CustomerAge,'<=','') as int) THEN @age						
					END 
			or @age = CASE 
						WHEN CustomerAge like '>%' and @age > Cast(REPLACE(CustomerAge,'>','') as int) THEN @age						
					END
			or @age = CASE 
						WHEN CustomerAge like '>=%' and @age >= Cast(REPLACE(CustomerAge,'>=','') as int) THEN @age						
					END 			
					)
    end

	-- spGetCoveragePlan 'Can','M','2012-10-01 00:00:00',50

	
GO
/****** Object:  StoredProcedure [dbo].[spGetInsuranceContractLst]    Script Date: 01-Oct-20 7:41:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spGetInsuranceContractLst] @search varchar(100),@sortCol varchar(20),@sortDir varchar(20), @skip int, @take int
as
	begin	
 select Id,CustomerName,CustomerAddress,CustomerGender,CustomerCountry,DateofBirth,SaleDate ,CoveragePlan,NetPrice,AddedDate ,TotalCount = COUNT(*) OVER() from Contracts 
    	
		where (@search ='' or CustomerName Like '%'+@search+'%') and IsDeleted=0 
		order by 
		 CASE WHEN @SortCol = 'Id' AND @SortDir = 'ASC' 
            THEN Id END ASC, 
		 CASE WHEN @SortCol = 'Id' AND @SortDir = 'DESC' 
            THEN Id END DESC,

		 CASE WHEN @SortCol = 'CustomerName' AND @SortDir = 'ASC' 
            THEN CustomerName END ASC, 
		 CASE WHEN @SortCol = 'CustomerName' AND @SortDir = 'DESC' 
            THEN CustomerName END DESC,
		
		CASE WHEN @SortCol = 'CustomerGender' AND @SortDir = 'ASC' 
            THEN CustomerGender END ASC,
		 CASE WHEN @SortCol = 'CustomerGender' AND @SortDir = 'DESC' 
            THEN CustomerGender END DESC,

		CASE WHEN @SortCol = 'CustomerCountry' AND @SortDir = 'ASC' 
            THEN CustomerCountry END ASC,
		 CASE WHEN @SortCol = 'CustomerCountry' AND @SortDir = 'DESC' 
            THEN CustomerCountry END DESC,

			CASE WHEN @SortCol = 'CoveragePlan' AND @SortDir = 'ASC' 
            THEN CoveragePlan END ASC,
		 CASE WHEN @SortCol = 'CoveragePlan' AND @SortDir = 'DESC' 
            THEN CoveragePlan END DESC,

		CASE WHEN @SortCol = 'AddedDate' AND @SortDir = 'ASC' 
            THEN AddedDate END ASC,
		CASE WHEN @SortCol = 'AddedDate' AND @SortDir = 'DESC' 
            THEN AddedDate END DESC					
		OFFSET @skip ROWS 
		FETCH NEXT @take ROWS ONLY
	end
GO
/****** Object:  StoredProcedure [dbo].[spUpdateContractInfo]    Script Date: 01-Oct-20 7:41:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[spUpdateContractInfo] @contractInfo nvarchar(max), @id int output, @status bit output, @message nvarchar(max) output
as
begin
	BEGIN TRY
		BEGIN TRAN

			update p
					set 
					
						p.CustomerName=u.CustomerName,		
						p.CustomerAddress=u.CustomerAddress,					
						p.CustomerGender=u.CustomerGender,
						p.CustomerCountry = u.CustomerCountry,
						p.DateofBirth = u.DateofBirth,
						p.SaleDate = u.SaleDate,
						p.CoveragePlan = u.CoveragePlan,
						p.NetPrice = u.NetPrice,
						p.ModifiedDate = GETDATE()

					from
						[dbo].[Contracts] as p
						cross apply
						[dbo].[fnMapContractInfo](@contractInfo) as u
						where 
						p.Id=u.Id

			set @status=1;
			
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		set @status=0;
		IF(@@TRANCOUNT > 0)
			ROLLBACK TRAN;
		set @message=ERROR_MESSAGE()
	END CATCH
end 
GO
