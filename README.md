# GameFinder

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Allow users to discover new games and keep track of their current inventory.  (to be edited)

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Social networking / game  (to be edited)
- **Mobile:** This app was developed for mobile phones  (to be edited)
- **Story:** Show newly released games and promote games better suited to the user (to be edited)
- **Market:** People interested in games  (to be edited)
- **Habit:** This app could be used as often or unoften as the user wanted depending on how intereted they are in the current gaming market. 
- **Scope:** At first we would show the newly released game to the user, and then with time as the user likes games/adds to their invenotry we can promote games better suited to their taste.(to be edited) 

## Product Spec. (to be edited)

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* Automatically shows users newly released games 
* User scrolls through games and can click on game image for more information 
* User can heart game they find interesting to add to their inventory 
* User can go to inventory of likes 

**Optional Nice-to-have Stories**

* Login and Logout option 
* User profile pages for each user
* Bookmarks pages for each user
* Adding comment on a post

### 2. Screen Archetypes

* Games screen
   * Automatically shows users newly released games
* Game information screen 
   * Allows user to see the details for each game 

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Game selection
* Home page

**Flow Navigation** (Screen to Screen)

* Game infomation
   * Jumps to a more deatil page

## Wireframes
<img src="https://user-images.githubusercontent.com/90946653/161089641-b6e91b8a-8c60-4de8-8fe2-0210af51bbaf.JPG" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
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
   | comment       | String   | comment from API for each game |
   | slug          | String   | slug from API for each game|
   | commentsCount | Number   | number of comments that has been posted to an game| 
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
