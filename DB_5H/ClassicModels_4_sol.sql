use classicmodels;

-- 1. Stampare nome e cognome dei dipendenti, e per ciascuno la città del suo ufficio
SELECT e.firstName, e.lastName, o.city from employees e, offices o
WHERE e.officeCode = o.officeCode;

-- 1. versione con inner join
select e.firstName, e.lastName, o.city from employees e inner join offices o
    on e.officeCode = o.officeCode;

-- 2. Trovare per ogni ufficio quanti dipendenti sono assegnati ad esso
SELECT officeCode, count(*) as numImpiegati from employees
    GROUP BY officeCode;

-- 3 Trovare, per ogni impiegato (solo coloro che si occupano dei clienti), la somma totale dei pagamenti effettuati dai clienti da loro seguiti
select c.salesRepEmployeeNumber, sum(p.amount) as totalePagamenti from customers c inner join payments p
    on c.customerNumber = p.customerNumber
    group by c.salesRepEmployeeNumber;

-- 4 Trovare il numero di ordini per ogni cliente, stampando anche nome e dati di contatto del cliente
select c.customerNumber, c.customerName, c.contactFirstName, c.contactLastName, count(*) as numOrdini from customers c inner join orders o
    on c.customerNumber = o.customerNumber
    group by o.customerNumber;

-- 5 Trovare descrizione e immagine dei prodotti dell’ordine n. 10122
select p.productName, p.productDescription, p.productImage from products p inner join orderdetails o
    on p.productCode = o.productCode inner join productlines pl on p.productLine = pl.productLine
    where o.orderNumber = 10122;

/* 6 Trovare, con un’unica query, per ogni cliente (customerName), quanti ordini sono stati cancellati
(Cancelled), quanti sono andati in disputa (Disputed) e poi risolti (Resolved) e quanti ordini sono
attualmente in attesa (on Hold). */
select c.contactLastName, o.customerNumber, o.status, count(*) as numOrdini from orders o
    inner join customers c on o.customerNumber = c.customerNumber
       where o.status in ('Cancelled', 'Disputed', 'Resolved', 'On Hold')
        group by o.customerNumber, o.status;

/* 7 Trovare codice, nome, città e stato di tutti i clienti, e, qualora presente, nome e cognome dell’addetto
commerciale cui il cliente è affidato.
 */
select c.customerNumber, c.customerName, c.city, c.state, e.firstName, e.lastName from customers c left join employees e
    on c.salesRepEmployeeNumber = e.employeeNumber;

-- 8 Trovare il codice prodotto e il codice cliente di tutti gli ordini spediti nel maggio 2003.
select o.orderNumber, o.orderDate, o.shippedDate, o.status, o.customerNumber, od.productCode from orders o inner join orderdetails od
    on o.orderNumber = od.orderNumber
    where month(orderDate)=5 and year(orderDate)=2003;

-- 9 Stampare nome e cognome di ciascun dipendente, e nome e cognome dell’eventuale responsabile
select e.firstName, e.lastName, e2.firstName, e2.lastName from employees e inner join employees e2
    on e.reportsTo = e2.employeeNumber;

