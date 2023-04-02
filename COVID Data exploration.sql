
-- Covid Deathdata
select *
from PortfolioProject..COVIDdeaths
where continent is not null
order by 3,4;
 
 -- VACCINATION DATA
select *
from PortfolioProject..Covidvaccination
where continent is not null
order by 3,4;

-- select data that i used 

select location,date,total_cases,new_cases,total_deaths,population
from  PortfolioProject..COVIDdeaths
where continent is not null
order by 1,2;

-- Total cases vs total deaths in india

select location,date,total_cases,total_deaths, (total_deaths/total_cases)*100 as per_death
from  PortfolioProject..COVIDdeaths
where location like'%india%'
order by 3 desc;

-- Total cases vs population

select location,date,total_cases,population,(total_cases/population)*100 as infection_percentage
from  PortfolioProject..COVIDdeaths
order by infection_percentage desc;

--Countries with highest infecton rate compared to population

select location,population, max(total_cases) as highest_infection, max((total_cases)/population)*100 as rate_of_infection
from  PortfolioProject..COVIDdeaths
where continent is not null
group by population,location
order by 3 desc;


--Countries with highest Death rate compared to population
-- cast( column_name as data_type) is use bcs data type of total_death was different 

select location,population, max(cast(total_deaths as int)) as total_death_count, max((total_deaths)/population)*100 as rate_of_death
from  PortfolioProject..COVIDdeaths
where continent is not null
group by population,location
order by 3 desc;

-- most deaths by continents

select continent, max(cast(total_deaths as int)) as total_death_count, max((total_deaths)/population)*100 as rate_of_death
from  PortfolioProject..COVIDdeaths
where continent is not null
group by continent
order by 2 desc;

--Grouping by continent
select continent, max(cast(total_deaths as int)) as total_death_count
from  PortfolioProject..COVIDdeaths
where continent is not null
group by continent
--order by total_death_count desc;


--Global  numbers
select sum(new_cases) as total_cases,sum(cast(new_deaths as int)) as total_deaths,(sum(cast(new_deaths as int))/sum(new_cases))*100 as perc_deaths
from PortfolioProject..COVIDdeaths
where continent is not null
order by 1,2


--Looking at total population vs vaccination
-- Joining vaccination and death table 
-- running count using sum() over (partition by and order by)


Select det.continent,det.location,det.date,det.population,vac.new_vaccinations,
 sum(convert(bigint,vac.new_vaccinations)) over (partition by det.location order by det.location,det.date ) as rolling_vaccination
from 
  PortfolioProject..COVIDdeaths as det
  join 
  PortfolioProject..Covidvaccination as vac
  on 
  det.location=vac.location and det.date=vac.date
where det.continent is not null
order by 2,3 ;

-- USing CTE for population vs vaccination
-- creating CTE 

with Popvsvac(continent,location,date,population,new_vaccination,rolling_vaccination)
as
(
Select det.continent,det.location,det.date,det.population,vac.new_vaccinations,
 sum(convert(bigint,vac.new_vaccinations)) over (partition by det.location order by det.location,det.date ) as rolling_vaccination
from 
  PortfolioProject..COVIDdeaths as det
  join 
  PortfolioProject..Covidvaccination as vac
  on 
  det.location=vac.location and det.date=vac.date
where det.continent is not null
--order by 2,3 
)

select *,(rolling_vaccination/population)*100 as vaccination_rate
from Popvsvac



-- Temp table


DROP TABLE if exists vaccination_rate
create Table vaccination_rate
(
continent nvarchar(255),
location nvarchar(255),
date datetime ,
population numeric,
new_vaccination numeric,
rolling_vaccination numeric
)

insert into vaccination_rate

Select det.continent,det.location,det.date,det.population,vac.new_vaccinations,
 sum(convert(bigint,vac.new_vaccinations)) over (partition by det.location order by det.location,det.date ) as rolling_vaccination
from 
  PortfolioProject..COVIDdeaths as det
  join 
  PortfolioProject..Covidvaccination as vac
  on 
  det.location=vac.location and det.date=vac.date
where det.continent is not null
--order by 2,3 

select *,(rolling_vaccination/population)*100 from vaccination_rate



--creating view to store data for visualization


create	View percentageofvaccinated as
Select det.continent,det.location,det.date,det.population,vac.new_vaccinations,
 sum(convert(bigint,vac.new_vaccinations)) over (partition by det.location order by det.location,det.date ) as rolling_vaccination
from 
  PortfolioProject..COVIDdeaths as det
  join 
  PortfolioProject..Covidvaccination as vac
  on 
  det.location=vac.location and det.date=vac.date
where det.continent is not null
--order by 2,3 


select * from percentageofvaccinated;