# Teamplayers - ( A Ruby on Rails 2 Sided Marketplace Project)

Deployed: [https://teamplayers.herokuapp.com/](https://teamplayers.herokuapp.com/)

Github: [https://github.com/natalieytan/teamplayers](https://github.com/natalieytan/teamplayers)

# Contents

- [Concept](#concept)
  * [Problem Statement:](#problem-statement-)
  * [Solution](#solution)
- [Design Process](#design-process)
  * [User stories](#user-stories)
  * [Sitemap planning](#sitemap-planning)
  * [My Scrumboard](#my-scrumboard)
  * [ERD](#erd)
  * [Wireframes](#wireframes)
- [Plans for future development](#plans-for-future-development)
  * [Plan for More features](#plan-for-more-features)
  * [Involvement of Leagues & Clubs](#involvement-of-leagues---clubs)
  * [Plans for financial sustainability](#plans-for-financial-sustainability)
  * [Cleaner code](#cleaner-code)
  * [Write more tests](#write-more-tests)
- [Local installation instructions](#local-installation-instructions)


# Concept
## Problem Statement:
Team sports bring a valuable contribution to the social fabric of society, as they, physical activity and active recreation opportunities more accessible to communities. Its benefits are wide-ranging, including physical health, mental health, personal wellbeing, and social cohesion.  

A national survey (AusPlay, July 2016-2017) showed that 58% of adults and 69% of children participated in sport-related activities and regular community-based sport participation, and in Australia generates an estimated AUD$18.7B value p.a. in social capital.

Despite the increasing connectivity, which technology has brought, many sport teams continue to face an ongoing challenge of trying to cobble a team every week.

It is common for clubs needing players to fill their games to send desperate emails, texts and facebook messages from clubs. Meanwhile, players who are looking for games, or interested in joining the club, are often not the recipients of these messages, which have limited reach.

![So difficult to find a player...](/docs/assets/images/cantfindplayer.png)

![So difficult to find a player...](/docs/assets/images/sohard.png)

## Solution
The underlying problem is that while clubs are looking for players to fill their games, and players are looking for games, neither have a convenient means of connecting.

The aim of “Teamplayers” is to provide a digital platform, which provides an efficient way to connect the two groups. In, doing so, it also hopes to support the clubs in fostering a community.



# Design Process
## User stories
![User Stories](/docs/assets/images/userstories.png)
[Trello Board](https://trello.com/b/bT0ZRygs/teamplayers)

I was able to speak to a few people who have similarly found themselves to be in a similar sticky situation of either being unable to find a player, or conversely - find a team. Being able to listen to user stories in person was a very enjoyable aspect of this project.

I then fleshed out their user stories onto a trello board. It was interesting to note that despite the common underlying problem, different users had different visions of what their ideal application would encompass.

Given the variety of opinions despite the small sample size, it would be ideal to conduct more research over a longer period.

## Sitemap planning
![Site Map](/docs/assets/images/sitemap.png)
Taking the user stories, I convert them into list of components of the site that would fufil the stories.

I then used the trello board to organise the components into groupings suitable for a site map.

## My Scrumboard
![Scrum Board](/docs/assets/images/scrumboard.png)
I cloned my sitemap board into a scrum board, and added some additional features as I went along.

Given the time frame of the project, I realised that not every component desired was possible. I thus decided to group the features into what I determined was core and non-core.

- Light blue denotes core
- Yellow denotes non-core
- Dark blue denotes tests written & completed


## ERD
![ERD](/docs/assets/images/erd.png)

In creating my ERD, I denoting what were the core and non-core features, such that I could prioritise the models for the core features.

In dealing with categorical variables which are not likely to change (e.g. Days of the week and gender). I was torn between using enum vs. foreign keys as a data-type. I was able to experiment with both types and have gained perspective on how to effectively use them in the future.

- Blue denotes core features

- Green denotes non-core features

## Wireframes
![User Stories](/docs/assets/images/wireframes.png)
- Font choices: Bree Serif, Open Sans
- Colors
    - White & Black as base colors
    - Blue as Secondary color
    - Yellow as accent
    - Red & green for alert and warnings
- Reason for design decisions
    - Bree Serif (Serif) pairs well with Open Sans (serif)
    - Blue and yellow pair well as they are complementary colours
    - Blue as a secondary colour is soothing, and does not conflict with the colours I intended to use for alerts (red) and notices (green)
- Mobile first approach.

# Plans for future development
## Plan for More features
Some 'nice to have' features (which are quite feaible) I wish to implement in the future
- Ability to search for individual games (this is not far off!)
- Team message board
- User to user messaging

## Involvement of Leagues & Clubs
- While the application connects teams with players, leagues are the additional party who hold a lot of data, resources and finances
- Involving leagues could potential bring about the following benefits:
    - Easy access to large amount of data (can pre-populate database with season information, games and potentially update score)
    - Financial backing (players and teams often pay leagues amount of money for each season. If a league gets more players, they stand to benefit.)

## Plans for financial sustainability
- Ideally, I would like the to keep the app free for players, as my underlying intention is to provide accessibility to team sports.
- While the current MVP involves charging players ($2) to create a team, I would ideally like to form partnerships with league, and shift the charge in exchange for benefits like soical prominence, in essentially what will be a "team sports version of linkedin"

## Cleaner code
- In writing code in rails, as the view could access the database, it was often easy to forget that the cost of the queries, especially if there were multiple joins.
- While I tried to reduce n+1 queries by prefetching joins in the controller as much as possible, there were instances this slipped through.
- Ideally I would like to use `rack-profiler` and `rubocop` to reduce the bloat.

## Write more tests
- I would love to be able to have write more tests before actually writing code. 
- However, given my limited knowledge of writing rspec for rails at this stage, I found that I was actually writing code to test & learn how to write my tests.
- I aim to continue writing more tests and adopt test driven development.


# Local installation instructions
1. Run a postgres database in the background
2. `brew install imagemagick` 
- (assuming you have homebrew) 
- this is required for image processing to work.
3. `bundle install`
4. `bin/rails db:migrate`
5. `bin/rails db:seed`
6. `bin/rails s`

