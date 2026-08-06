# Adventure Works

## General Context
You have been hired by Adventure Works (AW), a rapidly growing bicycle manufacturer that boasts over 500 distinct products, 20,000 customers, and 31,000 orders. To sustain its growth and differentiate itself from the competition, Adventure Works aims to use its data strategically, guiding its decisions to become a data-driven company. The company's leadership has already listed a series of questions they wish to answer through data analysis—questions that will guide the development of the data warehouse's fact and dimension tables. To kickstart the project and achieve quick results, the decision was made to begin with the sales area, although tables from other areas may be required to obtain the desired information. In your initial assessment, you identified several systems used by Adventure Works that generate business-relevant data and should eventually be integrated into the data infrastructure:

| Function      | System           |
|---------------|------------------|
| ERP           | SAP              |
| CRM           | Salesforce       |
| Web Analytics | Google Analytics |
| Website       | Wordpress        | 

During initial conversations, you also identified that the project does not have unanimous support within the company; there are doubts regarding the timeline, the costs involved, and whether there will be a return on investment.

The project was conceived and sponsored by AW’s Innovation Director, João Muller, and also has the backing of the company’s CEO, Carlos Silveira, who views the use of data as a long-term strategic differentiator. However, the Commercial Director, Silvana Teixeira, believes the funds invested in the project could have been allocated to promotional activities that—in her view—generate immediate sales results. Furthermore, she fails to see how creating a modern data infrastructure will benefit her commercial department, given that previous promises to make the area "data-driven"—made by vendors of other systems like CRM and Web Analytics—failed to deliver the promised results.

A specific request from CEO Carlos Silveira is that the construction of this data platform guarantees the quality and accuracy of the output data; in other words, the Analytics Engineering team must be able to confirm that the information aligns with the figures verified by the accounting audit team. Carlos cited the example of gross sales in 2011, which totaled $12,646,112.16. He would like tests performed to verify the accuracy of this figure within the models being built, following the approach from a "Modern Data Stack" workshop he recently attended.

In addition to these individuals, the IT Director, Nilson Ramos, is responsible for ensuring data access and has designated an analyst, Gabriel Santos, to assist with this. Gabriel is currently responsible for managing databases and answering ad-hoc questions from business units that require SQL. His schedule is quite tight, so coordinated communication and efficient interactions are essential to ensure all necessary data is available for the project.

## Data description
Adventure Works has a transactional database (PostgreSQL) that stores data from its various areas. This data is distributed across 68 tables divided into 5 schemas: HR (Human Resources), sales (vendas), production (produção), and purchasing (compras).

## Challenge objective
The goal is to build a data model for conducting clear and reliable analyses using a base dataset derived from Adventure Works raw data, enabling you to answer the following business questions:

a - What are the number of orders, quantity purchased, and total transaction value by product, card type, sales reason, sales date, customer, status, city, state, and country?

b - Which products have the highest average order value by month, year, city, state, and country? (average order value = Gross revenue - product discounts / number of orders in the analysis period)

c - Who are the top 10 customers by total transaction value, filtered by product, card type, sales reason, sales date, status, city, state, and country?

d - Which are the top 5 cities by total transaction value, filtered by product, card type, sales reason, sales date, customer, status, city, state, and country?

e - What are the number of orders, quantity purchased, and total transaction value by month and year (hint: time series chart)?

f - Which product has the highest number of units purchased for the "Promotion" sales reason?
