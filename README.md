# Learning DBT

To load raw data into Snowflake run this on it:

```SQL
create warehouse transforming;
create database raw;
create database analytics;
create schema raw.jaffle_shop;
create schema raw.stripe;

create table raw.jaffle_shop.customers 
( id integer,
  first_name varchar,
  last_name varchar
);

copy into raw.jaffle_shop.customers (id, first_name, last_name)
from 's3://dbt-tutorial-public/jaffle_shop_customers.csv'
file_format = (
  type = 'CSV'
  field_delimiter = ','
  skip_header = 1
  );
  
  create table raw.jaffle_shop.orders
( id integer,
  user_id integer,
  order_date date,
  status varchar,
  _etl_loaded_at timestamp default current_timestamp
);

copy into raw.jaffle_shop.orders (id, user_id, order_date, status)
from 's3://dbt-tutorial-public/jaffle_shop_orders.csv'
file_format = (
  type = 'CSV'
  field_delimiter = ','
  skip_header = 1
  );
  
  create table raw.stripe.payment 
( id integer,
  orderid integer,
  paymentmethod varchar,
  status varchar,
  amount integer,
  created date,
  _batched_at timestamp default current_timestamp
);

copy into raw.stripe.payment (id, orderid, paymentmethod, status, amount, created)
from 's3://dbt-tutorial-public/stripe_payments.csv'
file_format = (
  type = 'CSV'
  field_delimiter = ','
  skip_header = 1
  );
  
```

### Packages

To use packages we need to create a `packages.yml` file in the project root directory and paste the configuration settings of the package that you're looking for.
[Packages hub](https://hub.getdbt.com/)

The file will be like this:
``` YML
packages:
  - package: dbt-labs/dbt_utils
    version: 0.8.4
```

If we want to use a private repo as a package we have to do something like this:

``` YML
packages:
  - package: name_of_it
    version: 0.1.1
  - git: https://github.com/victorbertoldo/dbt_snowflake.git
    revision: master
```

Or we can use a sub-directory as a package by doing something like this:

``` YML
packages:
  - local: sub-project
```
