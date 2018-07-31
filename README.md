# FlightStatus
This is flight notification system where users can choose specific people in their contacts to be notified about the user's flight. 

## Audience
People who fly and would like to keep specific people informed of their flight information.

## Experience
A user opens the app is asked to login / sign up. Once they log in, they are delivered to the flight page. The user will put in their airline name and flight number and they will be proceeded to confirm the flight information.  Then the user will input the people they will like to contact and hit submit. If I have extra time, I would like to add a history tab. 

## Technical
Models \
Flight.swift \
Contacts.swift 

## Views
ListContactsView - list of contacts they would like to notify 

## Controllers
LoginController.swift
AirlineFlightInputController.swift
AirlineConfirmController.swift

## Other
AlamoFire \
SwiftyJSON

## Credits
I'd like to thank ADSB exchange for the live flights data. \
https://www.adsbexchange.com


## Daily Goals
### Week 1 
Monday: Create a github repo and begin researching on open source projects and APIs on flight tracking systems. \
Tuesday: Finish design documentation and recieve approval on API and begin parsing JSON object. Ensure that API data is real time and accurate. \
Wednesday: Create a simple UI design, continue working on parsing JSON object through API \
Thursday: Begin adding functionality to the UI design and have a MVP for Friday's user testing session \
Friday: Continue working on api and fix last minute bugs until user testing session. \
Goal: User signs up/ logs in and searches for a flight with an airline and flight number. Then prompted to confirm that the data is correct. 

### Week 2
Monday: Understand the servers behind the app and ensure the real time activity. Add the add contacts storyboard and begin adding functionality. \
Tuesday: Continue adding the functionality of saving a contact. \
Wednesday: Begin incorporating the sms texting feature. \
Thursday: Continue working on the sms texting feature. 

### Week 3
Monday: Polish the UI design \
Tuesday: Check for test cases and continue polishing the UI design \
Wednesday: User testing - continue fixing bugs and UI design \
Thursday: Polish \
Friday: Polish

Extra time: \
- History page
