
# Gigih Family Catering

Backend Path Final Project Assigment

## API

#### Get all menu items

```http
  GET /menu
```
| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `category`      | `boolean` |  request parameter to show menu item that have categories|

#### Create a menu item

```http
  POST /menu/create
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `name`      | `string` | **Required**. Name of menu item |
| `price`      | `float` | **Required**. price of menu item |

#### Update a menu item

```http
  PUT /menu/update
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `integer` | **Required**. id of menu item |
| `name`      | `string` | **Required**. Name of menu item |
| `price`      | `float` | **Required**. price of menu item |

#### Delete a menu item

```http
  DELETE /menu/delete
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `integer` | **Required**. id of menu item |

#### Get all category

```http
  GET /category
```

#### Insert category for a menu item

```http
  POST /menu/create/category
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `menu_item_id`      | `integer` | **Required**. menu_item_id of menu item |
| `category_id`      | `integer` | **Required**. category_id of category |

#### Show daily order

```http
  GET /order/daily
```

#### Create a customer order

```http
  POST /order/add
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `customer_id`      | `integer` | **Required**. customer_id of customer |
| `menu_item_id`      | `integer` | **Required**. menu_item_id of menu item that chosen|
| `quantity`      | `integer` | **Required**. quantity of menu item |

#### Update a customer order to be paid

```http
  PUT /order/update
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `order_id`      | `integer` | **Required**. order_id of customer order |

#### Create a another customer order this api didnt create order but only orderdetail

```http
  PUT /order/add/another
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `customer_id`      | `integer` | **Required**. customer_id of customer |
| `menu_item_id`      | `integer` | **Required**. menu_item_id of menu item that chosen|
| `quantity`      | `integer` | **Required**. quantity of menu item |



