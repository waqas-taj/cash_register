# Cash Register Application

## Overview

Cash Register application is made with Ruby on Rails only API and it's a simple but powerful tool that works like a basic point-of-sale system. Products are added to cart and it calculates the total price and applies special discounts. The application is easy to use and can be run in the command line. It is designed with simplicity, readability, maintainability, and ease of extension in mind.

## Features

- Add various products to a shopping cart.
- Compute the total cost of items in the cart.
- Special discount rules for bulk purchases and promotional offers.

## Product Catalog

The application supports the following products:

| Product Code | Name         | Price  |
|--------------|--------------|--------|
| GR1          | Green Tea    | €3.11  |
| SR1          | Strawberries | €5.00  |
| CF1          | Coffee       | €11.23 |

## Special Conditions

- **CEO Offer**: Buy-one-get-one-free offer on Green Tea.
- **COO Offer**: Discounted price of €4.50 for bulk purchases of Strawberries (3 or more).
- **VP of Engineering Offer**: Discounted price to 2/3 of the original price for bulk purchases of Coffee (3 or more).

## Installation

1. Ensure Ruby is installed on your system.
2. Navigate to the project directory.

### Dependencies

The application uses following dependencies:

- **Rails (v7.0)**
- **Ruby (v3.0)**
- **PostgreSQL for database**
- **Devise JWT for user authentication**
- **RSpec for Test cases**

## Usage

### Seed File
The seed file (db/seeds.rb) includes initial data for products. To load this data into the development database, run:

```bash
rails db:seed
```

Start the rails server:

```bash
rails s
```

Use `Postman` for API request.
## Code Structure

### ProductData Module
Defines the available products and their details.

### CashRegister Class
Manages the cart and calculates the total price, applying discounts as per the rules.

## Testing

The application is covered by tests written using Ruby's RSpec framework. The tests validate the functionality of the cash register, including adding products to the cart, calculating totals, and applying discounts.

### Running Tests

To execute the test cases, follow these steps:

1. Run the test cases:

    ```bash
    rspec spec
    ```
