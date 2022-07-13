# Data Persistence Lab

In this lab we will cover Data Persistence in the Apple ecosystem. Data persistence is how apps save data for future use. There are several ways to accomplish data persistence and in this activity we will learn 5 methods. 

We will begin with a starter app and refactor it five times to cover each persistence method. While it it possible to jump in at any level we recommend doing all of them to understand the pros and cons of each. Feel free to go at your own pace and work with others.


# Important
When you first clone the project you will need to changing the signing and capabilities to your own account.

## Stage 1: User Defaults
- LOs TBD

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
