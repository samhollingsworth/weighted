# Weighted

## Problem
This app was inspired by the use of the Apple Stocks app that allows you to see the performance of individual securities but cannot be customized to show the performance of your personal portfolio. Also, apps supplied by financial institutions usually had a feature where you could congregrate your accounts (even if they're from different institutions) into one page and be summarized into one number that represents your net worth. The issue I found with this feature is that they are slow to update, sometimes taking 1-2 days, and aren't easily accessed (usually have to login to their app) with no support for a widget on the home screen. 

## Solution 
Weighted Returns is an iOS app that allows the user to track the weighted returns of their entire investment portfolio so they can easily and quickly see the performance of their entire portfolio or individual accounts (i.e. IRA, 401k). It functions similarly to the default Stock app but with the added ability to create custom portfolios where users can set the weight of each security.

## Achitecture
Implements MVVM architecture (Model, View, View Model) to separate out the different parts of the app to easily test each unit and avoid a bloated View Controller like in the commonly-found MVC architecture (Model View Controller)

## Future Features

* **CoreData** to persist the data between sessions so the user can still see the most recently fetched performance of their portfolio and make changes to the allocation
* **Home Screen Widget** that will allow the user to quickly see their how their overall portfolio is performing as well as individual accounts

## Design Mocks

<img width="820" alt="Screen Shot 2021-03-18 at 12 10 51 PM" src="https://user-images.githubusercontent.com/25331902/111658739-ffdd8b80-87e2-11eb-9d0c-b1c3ea139b4b.png">

## Status

🚧 Under Construction
