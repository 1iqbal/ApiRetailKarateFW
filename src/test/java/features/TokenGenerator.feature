Feature: Token Generator Feature for TEK Insurance API

	@token
  Scenario: Generate Token
    Given url appURL
    * path "/auth/login"
    * request {"email":"deena@tek.us","password":"Deena@tek7"}
    * method post
    * print response
    * status 200
    * print response.accessToken
    * print response
