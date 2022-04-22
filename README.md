# GameFinder

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Allow users to discover new games and keep track of their current inventory.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Social networking / game
- **Mobile:** This app was developed for mobile phones
- **Story:** Show newly released games and promote games better suited to the user
- **Market:** People interested in games
- **Habit:** This app could be used as often or unoften as the user wanted depending on how intereted they are in the current gaming market. 
- **Scope:** At first we would show the newly released game to the user, and then with time as the user likes games/adds to their invenotry we can promote games better suited to their taste.

## Product Spec.

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [X] Automatically shows users newly released games. // this is CHECKED OFF
- [X] User scrolls through games and can click on game image for more information 
- [X] User can heart game they find interesting to add to their inventory 
- [X] User can go to inventory of likes 

**Optional Nice-to-have Stories**

* [X] Login and Logout option 
* [X] User profile pages for each user
* Bookmarks pages for each user
* Adding comment on a post

### 2. Screen Archetypes

* Games screen
   * Automatically shows users newly released games
* Game information screen 
   * Allows user to see the details for each game 

* Login screen
 * Allows user to login and sign up 

* User Profile screen
 * Allows user to see their profile page and the games they liked
  

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Game selection
* Home page
* Profile page

**Flow Navigation** (Screen to Screen)

* Game infomation
   * Jumps to a more deatil page

* Login 
   * Jumps to game list 

## Wireframes
<img src="https://user-images.githubusercontent.com/90946653/161089641-b6e91b8a-8c60-4de8-8fe2-0210af51bbaf.JPG" width=600>

## Schema 
### Models
#### Post

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | objectId      | String   | unique id for the user post (default field) |
   | author        | Pointer to User| image author |
   | synopsis      | String   | game synopsis from API |
   | title         | String   | game title from API |
   | rating        | Number   | game rating from API |
   | image         | File     | image from API for each game|
   | createdAt     | DateTime | date when like is created (default field) (Optional)| 
   | updatedAt     | DateTime | date when like is last updated (default field) (Optional)|
   
### Networking
#### List of network requests by screen
   - Home Feed Screen
      - (Read/GET) Get all posts from game API 
      - (Create/POST) Create a new like on a post 
      - (Delete) Delete existing like
      - (Create/POST) Create a new comment on a post (Optional)
      - (Delete) Delete existing comment (Optional)
   - Profile Screen
      - (Read/GET) Query logged in user object
      - (Update/PUT) Update user 'liked' game 
      - (Update/PUT) Update user profile image(Optional)

##### Game API
- Base URL - [https://rawg.io/apidocs#use-cases](https://rawg.io/apidocs#use-cases)




### Video walkthrough - last updated April 7,2022
<img src='https://media.giphy.com/media/7yro9mObJvoKwWJhlv/giphy.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

###  Video walkthrough - last updated April 14,2022
![ezgif com-gif-maker (1)](https://user-images.githubusercontent.com/81440356/163466962-3016463f-9a42-48df-b5cd-b115c236200a.gif)

###  Video walkthrough - last updated April 20,2022
<img src= 'https://media.giphy.com/media/2N4I7OwTMWaRzt3Vub/giphy.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

### Video walkthrough - last updated April 20,2022
<img src= 'https://media.giphy.com/media/FNazBNyIThbymLnrJw/giphy.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

###  CURRENT Video walkthrough - last updated April 21,2022
<img src= 'https://media.giphy.com/media/QTIA0v23HI0VgHK3mx/giphy.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />



