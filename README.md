# Data Persistence Lab

In this lab we will cover Data Persistence in the Apple ecosystem. Data persistence is how apps save data for future use. There are several ways to accomplish data persistence and in this activity we will learn 5 methods. 

We will begin with a starter app and refactor it five times to cover each persistence method. While it it possible to jump in at any level we recommend doing all of them to understand the pros and cons of each. Feel free to go at your own pace and work with others.


# Important
When you first clone the project you will need to changing the signing and capabilities to your own account.

## Stage 1: User Defaults

- Description:
  - "One common way to store a small amount of data is called UserDefaults, and it’s great for simple user preferences. There is no specific number attached to “a small amount”, but everything you store in UserDefaults will automatically be loaded when your app launches – if you store a lot in there your app launch will slow down. To give you at least an idea, you should aim to store no more than 512KB in there." -Hacking with Swift

- Resources
  - [basic user defaults](https://www.hackingwithswift.com/read/12/2/reading-and-writing-basics-userdefaults)
  - [user defaults with @AppStorage in SwiftUI](https://www.hackingwithswift.com/books/ios-swiftui/storing-user-settings-with-userdefaults)
- Challenge
  - Store the search text in user defaults
  - If done properly the app should remember your last search text when you close and reopen the app
  - Try this task with user defaults first then with @AppStorage

## Stage 2: JSON

- Description:
  - Java Script Object Notation (JSON) is an industry standard for passing data between sources. JSON is very common and it is beneficial to be knowledgeable on the subject. In the context of data persistence, JSON is a convenient way to save data locally in your app. With JSON we can save more complicated data structures and greater sizes of data. Swift's Codable protocol helps us convert our custom data types into JSON. 
  
  JSON gives us a bit more storage capability than user defaults. The JSON data structure is easier to read and understand and it's pretty compact. However, JSON should not be treated as a database. Large files can slow down your app.

- Resources
  - [Storing App Data Locally](https://medium.com/@lrkhan/storing-app-data-locally-99e36d4b91a0)
    - this is an article written by a student in the 2022 cohort!
  - [JSON and Codable Protocol - Swift](https://www.youtube.com/playlist?list=PLBn01m5Vbs4DKrm1gwIr_a-0B7yvlTZP6)
    - 9 part video series
- Challenge
  - Use JSON to store contacts
  - When the user adds, edits, or deletes a contact, that change should be written to a JSON file saved in the document directory
  - When the app loads it should read the JSON file to populate the contacts list
  - Bonus challenge: use [Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html) in your read / write functions

TODO:

## Stage 3: CoreData

## Stage 4: CloudKit

## Stage 5: CoreData and CloudKit


### Prerequisites
- Developer account (for stages 4 and 5)
- data modeling
- core swift learning objectives
- await
- async
- closures
