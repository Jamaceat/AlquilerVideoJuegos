# AlquilerVideoJuegos

FullStack Project

---

.NET CORE 6.0 API `RentGames`

Exposed in port `44315`

---

## Important to change in `appsettings.json`

![image](https://user-images.githubusercontent.com/49654113/198897294-cf0b89a4-f06a-4aea-b6f5-32746ea9ca3c.png)

According to you sql source you need to replace the string

---

### Network

` https://localhost:44315/api`

Endpoints

- `/Rents`
- `/Games`
- `/Clients`
- `/Users`

## API End Points

---

## `/Rents`

### Get

    /

#### Entry

    -

#### Response

    [ {
    "idRent": 0,
    "idGame": 0,
    "idUser": 0,
    "returned": true,
    "rentedDate": "2022-10-30T18:16:30.050Z",
    "expirationDays": 0,
    } , ...]

All Rents

---

### Get

    /{id}

#### Entry

    - Query Params

#### Response

    {
    "idRent": 0,
    "idGame": 0,
    "idUser": 0,
    "returned": true,
    "rentedDate": "2022-10-30T18:16:30.050Z",
    "expirationDays": 0,
    }

Rent With idRent = { id }

---

### Get

    /Recibo

#### Entry

    -

#### Response

    [ {
    "idUser": 2,
    "idRent": 1,
    "firstName": "Sasa",
    "lastName": "Mama",
    "email": "wawa@gmail.com",
    "gameTitle": "Need for Speed Most Wanted",
    "rentedDate": "2022-10-24T00:00:00",
    "expirationDays": 3,
    "rentalPrice": 15000,
    "totalPrice": 45000
    } , ... ]

Return all Bills

---

### Get

    /UserInfo/{UserId}

#### Entry

    - Query Params

#### Response

    [ {
    "idUser": 2,
    "idRent": 1,
    "gameTitle": "Need for Speed Most Wanted",
    "rentedDate": "2022-10-24T00:00:00",
    "expirationDays": 3,
    "rentalPrice": 15000,
    "returnDate": "2022-10-27T00:00:00",
    "totalPrice": 45000
    } , ...]

All bills from User = UserId

---

### Get

    /Daily

#### Entry

    -

#### Response

    [{
    "idUser": 2,
    "idRent": 1,
    "gameTitle": "Need for Speed Most Wanted",
    "rentedDate": "2022-10-24T00:00:00",
    "expirationDays": 3,
    "rentalPrice": 15000,
    "returnDate": "2022-10-27T00:00:00",
    "totalPrice": 45000
    } , ...]

All daily rents

<br/>

## `/Clients`

---

### Get

    /

#### Entry

    -

#### Response

    [ {
    "idClient": 1,
    "firstName": "Johan",
    "lastName": "Mendez",
    "age": 21,
    "address": "Cll 17e",
    "birthday": "2001-03-31T00:00:00",
    "gender": "Male",
    "email": "jamacea@uninorte.edu.co",
    "users": []
    } , ... ]

All Clients

---

### Get

    /Best

#### Entry

    -

#### Response

    {
    "idUser": 2,
    "firstName": "Sasa",
    "lastName": "Mama",
    "email": "wawa@gmail.com",
    "age": 20,
    "address": "Cll 16",
    "birthday": "2003-05-08T00:00:00",
    "rentas": 9
    }

The customer with the highest number of rentals

<br/>

## `/Games`

---

### Get

    /

#### Entry

    -

#### Response

    [ {
    "idGame": 1,
    "name": "Pinball",
    "releaseYear": 1970,
    "protagonist": "Ball",
    "director": "Ballers",
    "platform": "PC",
    "rentalPrice": 12000,
        } , ...]

Show all games with its data

---

### Get

    /MenosRentado

#### Entry

    -

#### Response

    [ {
    "name": "Need for Speed Most Wanted",
    "rango": 10,
    "frecuencia": 1
    } , ...]

Shows the least rented game within a range of 10 years

---

### Get

    /MenosRentado

#### Entry

    -

#### Response

    [ {
    "name": "Need for Speed Most Wanted",
    "rango": 10,
    "frecuencia": 1
    } , ...]

Shows the least rented game within a range of 10 years

---

### Get

    /InfoGames/{atributo}/{data}

#### Entry

    - Query params
        atributo :
            values:
                - ReleaseDate
                - tile
                - protagonist
                - director

#### Response

     [
        {
        "idGame": 1,
        "name": "Pinball",
        "releaseYear": 1970,
        "protagonist": "Ball",
        "director": "Ballers",
        "platform": "PC",
        "rentalPrice": 10000,
        } , ...]

Show just info that matches with query parameters

---

### Put

    /MenosRentado

#### Entry

    - body
    - schema:
        {
        "idGame": 0,
        "rentalPrice": 0
        }

#### Response

    status: 200 Success

Change the price of game with id = idGame with the value of rentalPrice
