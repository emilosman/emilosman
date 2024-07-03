# SOAP / SOA
- [not SOPS!](/pages/sops)

## [SOAP (Simple Object Access Protocol)](https://www.techtarget.com/searchapparchitecture/definition/SOAP-Simple-Object-Access-Protocol)

## SOAP vs. REST (Microservices)
SOAP is designed to break traditional monolithic applications down into a multicomponent, distributed form without losing security and control. In contrast, [REpresentational State Transfer (REST)](rest.md) is a model of distributed computing interaction based on the HTTP protocol and the way that web servers support clients. REST over HTTP is almost always the basis for modern microservices development and communications. RESTful APIs use HTTP requests to GET, PUT, POST and DELETE data.
- SOAP is a heavyweight protocol vs the lightweight REST
- REST is used in modern Microservices development

## SOA - Service Oriented Architecture
- uses Smart pipes, such as Enterprise Service Bus (ESB), using heavyweight protocols, such as SOAP for Inter-service communication
- ESB is a smart pipe that contains business and message-processing logic to integrate the services
- uses global data models and shared databases
- SOA is used to integrate large monolithic applications
- SOA application usually consists of a few large services
