# 🥋 Karate API Automation Framework

This repository contains an **API automation testing framework built using Karate**, designed for **fast, reliable, and maintainable REST API testing** with **minimal Java code** and **powerful built-in reporting**.

The framework demonstrates testing of the **SendGrid V3 Mail Send API (Mock Server)** but is **fully reusable for any REST API**.

---

## 🚀 Tech Stack

* **Java 17**
* **Karate Framework**
* **JUnit 5**
* **Gradle**
* **Karate HTML Reports (built-in)**

---

## 🧠 Why Karate?

Karate simplifies API automation by combining:

* API requests
* Assertions
* Data handling
* Reporting

all inside **`.feature` files**, without the need for:

* Rest Assured boilerplate
* Step definition classes
* External reporting plugins

---

## 📂 Project Structure

```
karate-api-automation
│
├── build.gradle
├── settings.gradle
│
├── src
│   └── test
│       ├── java
│       │   └── runners
│       │       └── TestRunner.java
│       │
│       └── resources
│           ├── features
│           │   └── sendgrid
│           │       └── sendgrid_mail_send.feature
│           │
│           ├── payloads
│           │   └── sendgrid_mail_request.json
│           │
│           └── karate-config.js
│
└── README.md
```

---

## 🌐 API Under Test

**SendGrid V3 Mail Send API (Mock Server)**
(No authentication required)

```
POST https://sendgrid-v3-api.mock.beeceptor.com/v3/mail/send
```

This mock API is ideal for:

* Payload validation
* Status code verification
* Framework development without real email delivery

---

## 📝 Sample Feature File

```gherkin
Feature: Send email using SendGrid V3 Mail Send API (Mock)

  Background:
    * url baseUrl
    * header Content-Type = 'application/json'

  @smoke
  Scenario: Successfully send a transactional email
    * def payload = read('classpath:payloads/sendgrid_mail_request.json')

    Given path '/v3/mail/send'
    And request payload
    When method post
    Then status 202
```

---

## 🧾 Global Configuration

📍 `src/test/resources/karate-config.js`

```javascript
function fn() {
  var config = {
    baseUrl: 'https://sendgrid-v3-api.mock.beeceptor.com'
  };

  karate.configure('logPrettyRequest', true);
  karate.configure('logPrettyResponse', true);

  return config;
}
```

---

## ▶️ How to Run Tests

### Run all tests

```bash
gradle clean test
```

---

## 📊 Reports

Karate generates **HTML reports automatically**.

After execution, open:

```
build/karate-reports/karate-summary.html
```

The report includes:

* Request & response payloads
* Execution timeline
* Step-by-step results
* Failure details (if any)

No extra reporting tools required ✅

---

## ⚡ Parallel Execution

Parallel execution is supported out-of-the-box.

Example in `TestRunner.java`:

```java
@Karate.Test
Karate runAllTests() {
    return Karate.run("classpath:features")
            .parallel(4);
}
```

---

## 🔧 Prerequisites

* **Java 17+**
* **Gradle 7+**
* **Git**

---

## 🧠 Key Advantages of This Framework

* ✅ No step definitions
* ✅ No REST client setup
* ✅ Native JSON handling
* ✅ Clean and readable BDD syntax
* ✅ Built-in reporting
* ✅ Easy CI/CD integration

---

## 📌 Future Enhancements

* 🔐 Authentication (OAuth / API Keys)
* 📦 Schema validation
* 📊 Advanced data-driven tests
* 🧪 API mocking with Karate
* 🚀 CI/CD pipeline integration

---

## 👤 Author

**Sushil Yadav**
API Automation | Karate | Java | BDD

---

## ⭐️ Contributing

Feel free to fork the repository and raise pull requests for improvements, fixes, or enhancements.

