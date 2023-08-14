@completeTest
Feature: TEK Retail API Address Service

  Background: 
    Given url appURL
    * def tokenValue = call read("TokenGenerator.feature")
    * def token = tokenValue.response.accessToken
    * header x-access-token = token

  @PostAddress
  Scenario: Create New Address
    * path "/address"
    * request
      """
      {
      "country": "United States",
      "fullName": "John Dooooo",
      "phoneNumber": "9047931984",
      "street": "2714 Yule Street, Arvada CO",
      "apartment": "H.no 15",
      "city": "Jacksonville",
      "state": "Florida",
      "zipCode": "32216"
      }
      """
    * method post
    * print response
    * status 200

  @getAddress
  Scenario: get all Addresses
    * path "/address"
    * method get
    * status 200
    * print response
    * print response[0].id
    * karate.write(response, 'address.json')

  @updateAddress
  Scenario: Update an address
    * def addressID = read('file:./target/address.json')
    * def id = addressID[2].id
    * path "/address/" + id
    * request
      """
      {
      
      "country": "United States",
      "fullName": "Hamed",
      "phoneNumber": "9046041814",
      "street": "2714 Hanzuaas ct",
      "apartment": "222",
      "city": "Jacksonvilllee",
      "state": "Floridaaa"
      
      }
      """
    * method put
    * print response

  @DeleteAddress
  Scenario: Delete All Address
    * def addressID = read('file:./target/address.json')
    * def id = addressID[1].id
    * path "/address/" + id
    * method delete
    * print response
