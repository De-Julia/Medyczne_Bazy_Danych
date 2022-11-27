# Medical Data Base
Database project for clients from the medical industry. It assumes the creation of a basic database divided into three modules (patient data, clinical data, laboratory data)

# Modular design:
- login module (customer service)
- patient data module
- clinical module
- laboratory module

# Technology:
1. 3-layer design
2. Modular architecture
3. Web server - Apache
4. Database - My SQL
5. Programming language - PHP
6. Authorization - login/password
7. Session Tracking - Session ID passed in cookie (optional but appreciated)

# What do modules do?
**User** - a database of users with a related function (personal data is entered by the registrar, clinical data is entered by a doctor, laboratory data is entered by a diagnostician) depending on which user we log in as, we have access only to a specific group of data.

**Personal data** - concerns information about the patient (name, surname, PESEL number, contact details, residence details) the possibility of grouping by e.g. the size of the city, information about who and when entered and modified the patient's data.

**Clinic** - a list of all the patient's diseases and treatment (diagnosis and prescribed drugs) information who entered the data (the patient's drugs do not have to be related to the disease).

**Laboratory** - The patient can have various materials collected (plasma, serum, whole blood, tissue, urine, stool, physiological fluids), various tests can be performed (assigned to a given material), information about the date of material collection and the date of the test.

# Action plan:
- Determining the client's expectations (conducting a thorough interview with the user
proposing a solution and then consulting with the client)
- Database design (designing tables & designing the relationship)
- Interface design (suggesting a way of communication & designing forms)
- Security policy
