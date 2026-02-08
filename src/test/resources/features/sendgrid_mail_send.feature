Feature: Send email using SendGrid V3 Mail Send API (Mock)

  Background:
    * url baseUrl
    * header Content-Type = 'application/json'

  @smoke
  Scenario: Successfully send an email
    * def payload = read('classpath:payloads/sendgrid_mail_request.json')

    Given path '/v3/mail/send'
    And request payload
    When method post
    Then status 202
