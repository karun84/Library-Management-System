create database library;
use library;

create table Branch(Branch_no int primary key, Manager_id int, Branch_address varchar(25), Contact_no varchar(20));

create table Employee(Employee_id int primary key, Emp_name varchar(25), position varchar(20), salary decimal(8,2), 
Branch_no int, foreign key(Branch_no)references Branch(Branch_no));

create table Books(isbn varchar(20) primary key, Book_title varchar(20), Category varchar(20), Rental_price decimal(8,2),
Status enum('Yes','No'), Author varchar(20), Publisher varchar(20));

create table Customer(Customer_id int primary key, Customer_name varchar(20), Customer_address varchar(20),
Reg_date date);

create table IssueStatus(Issue_id int primary key, Issued_cust int, Issued_book_name varchar(20), Issued_date date,
Isbn_book varchar(20), foreign key(Issued_cust) references Customer(Customer_id), foreign key(Isbn_book)references
Books(isbn));

create table ReturnStatus(Return_id int primary key, Return_cust int, Return_book_name varchar(20), Return_date date,
Isbn_book2 varchar(20), foreign key(Return_cust)references Customer(Customer_id), foreign key(Isbn_book2)references
Books(isbn));

insert into Branch(Branch_no, Manager_id, Branch_address, Contact_no) values(1, 101, '123 Main St, Cityville', '1234567890'),
(2, 102, '456 Elm St, Townsville', '9876543210'),(3,103,'678 Nor St, Bobyville','8945632178'),
(4,104,'369 Sou St, Domville','1235478968');

insert into Employee(Employee_id, Emp_name, position, salary, Branch_no) values(1, 'Alice Johnson', 'Librarian', 35000, 2),
(2, 'Bob Smith', 'Assistant Librarian', 30000, 1),
(3, 'Charlie Brown', 'Librarian', 36000, 4),(4,'Sharon James', 'Assistant Librarian',25000,3);

insert into Employee(Employee_id, Emp_name, position, salary, Branch_no) values
(5,'Gold Roger', 'Librarian','45000',3),(6,'Silvers Rayleigh', 'Assistant Librarian','42000',3),
(7,'Edward Newgate', 'Assistant Librarian','47000',3),(8,'Marshall Teach', 'Assistant Librarian','35000',3),
(9,'John Hawkings', 'Librarian','49000',3);

insert into Books(isbn, Book_title, Category, Rental_price, Status, Author, Publisher) values
('978-3-16-148410-0', 'The Great Gatsby', 'Fiction', 500, 'Yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-1-56619-909-4', 'Don Quixote', 'Chivalric Romance', 900, 'Yes', 'Miguel de Cervantes', 'Francisco de Robles'),
('978-0-7432-7356-5', '1984', 'Dystopian', 450, 'No', 'George Orwell', 'Secker & Warburg'),
('978-0-7432-7356-6', 'The Trail', 'Dystopian Fiction', 600,'Yes', 'Franz Kafka', 'Pinguin Classics');

insert into Customer(Customer_id, Customer_name, Customer_address, Reg_date) values
(1, 'John Doe', '78 Oak St, Cityvile', '2024-01-15'),
(2, 'Jane Smith', '21 Pine St, LY', '2023-02-20'),
(3,'Angela Yu','12 China St, NY','2024-06-25'),(4,'Jean Black', '578 Mondstadt, TY', '2023-08-13');

insert into IssueStatus(Issue_id, Issued_cust, Issued_book_name, Issued_date, Isbn_book) values
(1, 1, 'The Great Gatsby', '2024-03-01', '978-3-16-148410-0'),
(2, 2, 'Don Quixote', '2024-03-05', '978-1-56619-909-4'),(3,3,'1984','2024-04-11','978-0-7432-7356-5'),
(4,4,'The Trial','2023-06-11','978-0-7432-7356-6');

insert into ReturnStatus(Return_id, Return_cust, Return_book_name, Return_date, Isbn_book2) values
(1, 1, 'The Great Gatsby', '2024-03-10', '978-3-16-148410-0'),
(2, 2, 'Don Quixote', '2024-03-15', '978-1-56619-909-4'),(3,3,'1984','2024-04-29','978-0-7432-7356-5'),
(4,4,'The Trial','2024-03-27','978-0-7432-7356-6');

#1st question
select Book_title, Category, Rental_price from Books where Status='yes';

#2nd question
select Emp_name, salary from employee order by salary desc;

#3rd question
select books.book_title, customer.customer_name from IssueStatus join books on IssueStatus.isbn_book=books.isbn
join customer on IssueStatus.Issued_cust=customer.customer_id;

#4th question
select category, count(*) as TotalBooks from books group by category;

#5th question
select emp_name, position from Employee where salary>50000;

#6th question
select customer_name from customer where reg_date<'2022-01-01' and customer_id not in (select issued_cust
from issuestatus);

#7th question
select branch_no, count(*) as TotalEmployees from employee group by branch_no;

#8th question
select customer.customer_name from issuestatus join customer on issuestatus.issued_cust=customer.customer_id
where issued_date between '2023-06-01' and '2023-06-30';

#9th question
select book_title from books where category like '%history%';

#10th question
select branch_no, count(*) as TotalEmployees from employee group by branch_no having count(*)>5;

#11th question
select employee.emp_name, branch.branch_address from employee join branch on employee.employee_id=branch.manager_id;

#12th question
select customer.customer_name from issuestatus join books on issuestatus.isbn_book=books.isbn
join customer on issuestatus.issued_cust=customer.customer_id where books.rental_price>25;








