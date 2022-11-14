
SELECT location, date, total_cases, new_cases, total_deaths, population 
from CovidDeaths
order by 1,2

-- Total cases vs total death
SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases) * 100 as DeathPercentage
from CovidDeaths
where location = 'united states'
order by 1,2

-- Total cases vs population
SELECT location, date, population, total_cases, (total_cases/population) * 100 as CasesPercentage
from CovidDeaths
where location = 'pakistan'
order by 1,2

-- Highest infection rate by Population in countries
SELECT location, population, max(total_cases) as HighestInfection, max((total_cases/population))*100 as PercentageInfected
from CovidDeaths
Group By location, population
order by PercentageInfected desc

-- Highest Death by Countries
SELECT continent, max(cast(total_deaths as int)) as TotalDeath
from CovidDeaths
where continent is not null
Group by continent
order by TotalDeath desc

select * from CovidDeaths

SELECT location, max(total_cases) as TotalCases, max(total_deaths) as TotalDeath FROM CovidDeaths
where continent is not null
Group by location
order by TotalDeath desc

Select * from CovidVaccinations

Select dea.location, max(cast(vac.people_fully_vaccinated as int))
from CovidDeaths dea
join CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
group by dea.location
order by 2 desc

Select dea.location, max(cast(vac.extreme_poverty as float))
from CovidDeaths dea
join CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
group by dea.location
order by 2 desc

Select dea.location, max(cast(total_boosters as int))
from CovidDeaths dea
join CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
group by dea.location
order by 2 desc

Select * from CovidVaccinations
Select * from CovidDeaths

-- Top 10 countries with highest cases
SELECT Top 10 location, max(total_cases) as Total_Cases from CovidDeaths
where continent is not null
group by location
order by 2 desc


-- Top 10 countries with highest death
SELECT Top 10 location, max(total_deaths) as Total_Deaths from CovidDeaths
where continent is not null
group by location
order by 2 desc

Select location, total_vaccinations from CovidVaccinations
where location = 'pakistan'


-- Top 10 countries with highest vaccination
SELECT Top 10 cd.location, max(cast(cv.total_vaccinations as float)) as Total_Vaccinations from CovidDeaths cd
join CovidVaccinations cv
 on cd.location = cv.location
 AND cd.date = cd.date
 where cd.continent is not null
 group by cd.location
 order by 2 desc

 -- Top 10 countries with highest fully vaccinated
SELECT Top 10 cd.location, max(cast(cv.people_fully_vaccinated as float)) as Fully_Vaccinated from CovidDeaths cd
join CovidVaccinations cv
 on cd.location = cv.location
 AND cd.date = cd.date
 where cd.continent is not null
 group by cd.location
 order by 2 desc


  -- Top 10 countries with highest booster
SELECT Top 10 cd.location, max(cast(cv.total_boosters as float)) as Boosters from CovidDeaths cd
join CovidVaccinations cv
 on cd.location = cv.location
 AND cd.date = cd.date
 where cd.continent is not null
 group by cd.location
 order by 2 desc
