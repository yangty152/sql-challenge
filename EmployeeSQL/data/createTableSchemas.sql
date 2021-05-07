DROP TABLE IF EXISTS department CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS employee CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS title CASCADE;


CREATE TABLE department(
	dept_no character varying(10) COLLATE pg_catalog."default" NOT NULL,
    dept_name character varying(30) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT department_pkey PRIMARY KEY (dept_no)
);

CREATE TABLE title
(
    title_id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    title character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT title_pkey PRIMARY KEY (title_id)
);

CREATE TABLE employee(
    emp_no integer NOT NULL,
    emp_title_id character varying(30) COLLATE pg_catalog."default" NOT NULL,
    birth_date date,
    first_name character varying(30) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(30) COLLATE pg_catalog."default" NOT NULL,
    sex character(1) COLLATE pg_catalog."default",
    hire_date date NOT NULL,
    CONSTRAINT employee_pkey PRIMARY KEY (emp_no),
    CONSTRAINT employee_emp_title_id_fkey FOREIGN KEY (emp_title_id)
        REFERENCES title (title_id) MATCH SIMPLE
);

CREATE TABLE dept_emp(
    emp_no integer NOT NULL,
    dept_no character varying(10) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT dept_emp_emp_no_fkey FOREIGN KEY (emp_no)
        REFERENCES employee (emp_no) MATCH SIMPLE
);

CREATE TABLE dept_manager(
    dept_no character varying(10) COLLATE pg_catalog."default" NOT NULL,
    emp_no integer,
    CONSTRAINT dept_manager_dept_no_fkey FOREIGN KEY (dept_no)
        REFERENCES department (dept_no) MATCH SIMPLE
);

CREATE TABLE salaries
(
    emp_no integer NOT NULL,
    salary integer NOT NULL,
    CONSTRAINT salaries_emp_no_fkey FOREIGN KEY (emp_no)
        REFERENCES employee (emp_no) MATCH SIMPLE
);

