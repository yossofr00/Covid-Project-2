--Queries used for tableau project 



-- 1.

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
FROM [Portfolio Project]..CovidDeaths$
--WHERE location like '%states%'
WHERE continent is not null
--Group BY date 
order by 1,2

-- numbers are extremely cloe so we will keep them - the second includes "International" location

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
FROM [Portfolio Project]..CovidDeaths$
--WHERE location like '%states%'
WHERE location = 'World'
--Group BY date 
order by 1,2

--2.

--We take these out as they are not inluded in the above queries and want to stay consistent
-- European Union is part of Europe

SELECT location, SUM(cast(new_deaths as int)) as TotalDeathCount
FROM [Portfolio Project]..CovidDeaths$
--WHERE location like '%states%'
WHERE continent is null 
and location not in ('World', 'European union', 'International')
GROUP BY location
order by TotalDeathCount desc


--3. 

Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From [Portfolio Project]..CovidDeaths$
--Where location like '%states%'
Group by Location, Population
order by PercentPopulationInfected desc




--4.

SELECT location, population, date, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
FROM [Portfolio Project]..CovidDeaths$
--WHERE location like '%states%'
Group by location, population, date
order by PercentPopulationInfected desc