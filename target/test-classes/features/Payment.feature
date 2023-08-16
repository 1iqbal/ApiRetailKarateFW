@completeTest
Feature: TEK Retail API Address Service

  Background: 
    Given url appURL
    * def tokenValue = call read("TokenGenerator.feature")
    * def token = tokenValue.response.accessToken
    * header x-access-token = token
    * path "/payment"
    * def generator = Java.type("tests.DataGenerator")
    * def cardNumber = generator.getCardNumber()
    * def nameOnCard = generator.getNameOnCard()
    * def expirationMonth = generator.getExpirationMonth()
    * def expirationYear = generator.getExpirationYear()
    * def securityCode = generator.getSecurityCode()

  @paymentTest
  Scenario: Create New Payment
    * request
      """
      {
      "cardNumber": "#(cardNumber)",
      "nameOnCard": "#(nameOnCard)",
      "expirationMonth": 12,
      "expirationYear": 2024,
      "securityCode": "#(securityCode)",
      }
      """
    * method post
    * print response
    * status 200

  Scenario: get all Payment
    #* path "/payment"
    * method get
    * status 200
    * print response
    * print response[1].id
    * karate.write(response, 'payment.json')

  Scenario: Update an payment
    * def paymentID = read('file:./target/payment.json')
    * def id = paymentID[2].id
    * path "/payment/"+id
    * def requestbody = read('request.json')
    * request requestbody
    * method put
    * status 404
    * print response

  @getAcc
  Scenario: Delete  Payment
    * def addressID = read('file:./target/payment.json')
    * def id = addressID[1].id
    * path "/payment/" + id
    * method delete
    * print response
