
<h1>Data Analysis with SQL</h1>

<h2>Description</h2>

 - <b> Data Exploration with SQL.</b2>
 - <b>Tables :Covid death,covid vaccination</b>
 - <b>Use of windows Functions,joins, Temporary Tables to find out the total Vaccinaton rates,Total infection rate, for global as well as continal wise</b>

<h2>Language Used</h2>

- <b>SQL</b> 

<h2>Environments Used </h2>

- <b>Windows 10</b> 

<h2>Project walk-through:</h2>
<p align="center">
<p align="center">
<b> Table view</b2>: <br/>
<a href="https://ibb.co/cNT1JxQ"><img src="https://i.ibb.co/Q6mf9XM/Table-view.jpg" alt="Table-view" border="0" /></a>
<br />
<p align="center">
<br />
Countries with highest INFECTION rate compared to population: <br/>
<a href="https://ibb.co/3vs9q10"><img src="https://i.ibb.co/Qkc3R96/Countries-with-highest-infecton-rate-compared-to-population.jpg" alt="Countries-with-highest-infecton-rate-compared-to-population" border="0" /></a>
<br />
 <p align="center">
<br />
Countries with highest DEATH rate compared to population:
 <br />
 -- cast( column_name as data_type) is use bcs data type of total_death was different <br/>
<a href="https://ibb.co/D9GRdHC"><img src="https://i.ibb.co/By4Ck5Z/Countries-with-highest-Death-rate-compared-to-population.jpg" alt="Countries-with-highest-Death-rate-compared-to-population" border="0" /></a>
<br />
 <p align="center">
<br />
-- most deaths by continents:  <br/>
<a href="https://imgbb.com/"><img src="https://i.ibb.co/F8vvMJH/most-deaths-Group-by-continents.jpg" alt="most-deaths-Group-by-continents" border="0" /></a>
<br />
 <p align="center">
<br />
- Looking at total population vs vaccination
 <br />
- Joining vaccination and death table 
 <br />
- running count using sum() over (partition by and order by):  <br/>
<a href="https://ibb.co/YDH7W8T"><img src="https://i.ibb.co/9wQ9v23/Looking-at-total-population-vs-vaccination.jpg" alt="Looking-at-total-population-vs-vaccination" border="0" /></a>
<br />
<br />
 <p align="center">
 *)USing CTE for population vs vaccination
 <br />
 *)creating CTE 
:  <br/>
<a href="https://ibb.co/3s0CkDy"><img src="https://i.ibb.co/z5S4Nyh/USING-CTE.jpg" alt="USING-CTE" border="0" /></a>
<br />
 <p align="center">
--Creating Table 
 <br />
-- Inserting into Table 
 <br />
--Finding out the vaccination rate vs Population:  <br/>
<a href="https://ibb.co/BfhVMrT"><img src="https://i.ibb.co/HKcD8xG/Temp-Table.jpg" alt="Temp-Table" border="0" /></a>
<br />
 
<!--
 ```diff
- text in red
+ text in green
! text in orange
# text in gray
@@ text in purple (and bold)@@
```
--!>
