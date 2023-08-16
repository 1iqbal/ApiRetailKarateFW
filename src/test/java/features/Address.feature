@completeTest
Feature: TEK Retail API Address Service

  Background: 
    Given url appURL
    * def tokenValue = call read("TokenGenerator.feature")
    * def token = tokenValue.response.accessToken
    * header x-access-token = token
    #* path "/address"
    * def generator = Java.type("tests.DataGenerator")
    * def country = generator.getCountry()
    * def fullName = generator.getFullName()
    * def phoneNumber = generator.getPhoneNumber()
    * def street = generator.getStreet()
    * def apartment = generator.getApartment()
    * def city = generator.getCity()
    * def state = generator.getState()
    * def zipCode = generator.getZipCode()

  @PostAddress
  Scenario: Create New Address
   * path "/address"
    * request
      """
      {
      "country": "#(country)",
      "fullName": "#(fullName)",
      "phoneNumber": "#(phoneNumber)",
      "street": "#(street)",
      "apartment": "#(apartment)",
      "city": "#(city)",
      "state": "#(state)",
      "zipCode": "#(zipCode)"
      }
      """
    * method post
    * print response
    * status 200

  @GetAddress
  Scenario: get all Addresses
    * path "/address"
    * method get
    * status 200
    * print response
    * print response[0].id
    * karate.write(response, 'address.json')

  @UpdatAddress
  Scenario: Update an address
    * def addressID = read('file:./target/address.json')
    * def id = addressID[2].id
    * path "/address/" + id
    * request
      """
      {
      "country": "USA",
      "fullName": "Qand Agha Kha",
      "phoneNumber": "9049049042",
      "street": "2525 Hanzas ct",
      "apartment": "H 1212",
      "city": "Jacksonville",
      "state": "Florida",
      "zipCode": "32216"
      }
      """
    * method put
    * status 200
    * print response

  @DeleteAddress
  Scenario: Delete All Address
    * def addressID = read('file:./target/address.json')
    * def id = addressID[2].id
    * path "/address/" + id
    * method delete
    * print response
  @DeleteAddress
  Scenario: Delete All Address
    * def addressID = read('file:./target/address.json')
    * def id = addressID[3].id
    * path "/address/" + id
    * method delete
    * print response