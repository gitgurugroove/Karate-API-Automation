@sendGridMail
Feature: Send email using SendGrid V3 Mail Send API (Mock)

  Background:
    * url baseUrl
    * header Content-Type = 'application/json'

  @positive @smoke
  Scenario: Successfully send a transactional email with multiple recipients
    * def payload = read('classpath:payloads/sendGridMailSend.json')

    Given path '/v3/mail/send'
    And request payload
    When method post
    Then status 202

 @positive @202Status
 Scenario: Send email with wrong endpoint to validate error handling
  * def payload = read('classpath:payloads/sendGridMailSend.json')

  Given path '/v3/mail/sen'
  And request payload
  When method post
  Then status 200

  @negative @400Status
  Scenario: Fail to send email when "from"/"to" from email is missing
    * def payload = read('classpath:payloads/sendGridMailSend400.json')

    Given path '/v3/mail/send'
    And request payload
    When method post
    Then status 400

 @negative @404Status
 Scenario: Fail to send email when baseURL is incorrect
   * def payload = read('classpath:payloads/sendGridMailSend.json')

   Given url 'https://sendgri-v3-api.mock.beeceptor.com'
   Given path '/v3/mail/send'
   And request payload
   When method post
   Then status 404