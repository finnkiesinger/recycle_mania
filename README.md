## Inspiration

When I first heard about the Global Gamers Challenge, my excitement instantly went up. After brainstorming for a couple of days, I came up with two cool ideas:

1. A game where you are put in the position of managing your own recycling facility. Your job is to build different facilities to recycle waste products into resources that can be used in new products. It features a complex system where you have to optimize production chains to maximize profit. It has educative content, allowing players to learn about the recycling process of different materials.
2. The second idea was much simpler: Different types of waste are falling down and you have to sort them into the right trash can before they reach the ground. This is a more playful approach to teach players about waste separation.

As the second idea is much smaller than the first, and the first is a more complex and less "lightweight" experience, I came up with the idea of introducing the second game as a mini-game in the first one. The management game is called **Recycle Mania** and it makes up the majority of our project. The second mini-game is called **Recycle Rumble**. **Recycle Rumble** can be started in the game at any point.

## How I built it

**Recycle Mania** is built completely with _Flutter_. It doesn't use any engine as it UI-based and doesn't require any complex graphics. **Recycle Rumble** is built using _Flutter_ and the _Flame_ engine.
Let's take a closer look at **Recycle Mania** first: The core of the game is a **GameState** class. As the name suggests, it contains all the information of the current state of the game. It stores the current inventory of the player, their balance, i.e. how much money they have, the facilities that have been built, the blueprints the player owns and the powerups they have. There are two types of facilities: _Static Facilities_ are facilities that have no associated production pipeline. Currently the only type of _Static Facility_ is a _Storage Facility_. The other type of facility is called an _IO Facility_, meaning a facility that processes some sort of input into some output. There are two types of _IO Facilities_: A _Processing Facility_ and a _Production Facility_. A _Processing Facility_ takes some sort of _Waste_ as input and has some _Resource_ as output. This is where waste is turned into resources ready for recycling. The 5 resource types in this game are _Paper_, _Organic_, _Glass_, _Metal_ and _Plastic_. These 5 resources can be stored in _Storage Facilities_ and then be used in _Production Facilities_. _Production Facilities_ turn _Resources_ into _Products_. Products are then sold on the market for profit. Each _IO Facility_ has a processing time and a cooldown time, constantly switching between the two. Whenever the state switches, a start or end function is called, in which waste is acquired, resources are produced or consumed, or products created and sold. An IO Facility is updated on each iteration. The base iteration time is 1 second, however, this implemented in a dynamic way to allow for powerups that double the production time for example. To separate the updating logic from the facility logic, a separate _Mixin class_ called _TimedObject_ was created.
On the market, the player can acquire _blueprints_ and _powerups_. Each blueprint has some requirements and some output. An output has the type _Craftable_, which is an empty mixin class used to mark craftable objects. Right now, the only craftable objects are facilities, however since this might change in the future, I introduced this class.
Like a facility, a powerup can be static or timed. Static powerups don't disappear over time. An example for a static powerup is selling excess resources for money instead of disposing of them. An example for a timed powerup is a time booster that increases the game time by some factor.
For all timed items, whether that's facilities or powerups, their time is not linked to the real time, but rather some internal accumulator. This makes two things very easy: Changing game speed or pausing the game, and creating save games. When the player saves the game, the internal time of each timed object can be saved very easily.

The core gameplay loop looks like this:

1. Player buys blueprint for some facility 2. Player learns about different recycling processes by reading the blueprint
2. Player builds facility
3. Player buys powerups to improve their production chain
4. Repeat

**Recycle Rumble** doesn't really have a very complex underlying gameplay system. Waste falls down at increasing speed and needs to be sorted into the right column before reaching the respective trash can. In each game, the player has 3 lives, one of which is lost every time the player incorrectly sorts waste. For each correct sorting, the player earns one point.

## Challenges I ran into

Getting started was a fun process. I came up with tons of cool ideas and ways to implement them. But having started 4 weeks late into the competition put me in front of a tough challenge. Managing the scope of the project so that I could have a working app on March 5th. That meant cutting some features and focusing on core gameplay mechanics. However, I did develop the game from the ground up in a way that would allow me to extend the game later on. The class structure I chose will allow for lots of content to be added without having to rewrite much code.
Another challenge was coming up with a way of integrating Google Wallet. At the beginning of this challenge, I thought of the Wallet App as simply a way of storing tickets and never thought about other ways of using it. I actually started the challenge with the intention of not integrating it, but somewhere in the middle of development I got an idea too good not to implement it: After a player beats the game, i.e. after they built everything possible and have made a certain amount of money, they can buy themselves the **Golden Ticket**. This ends the game and rewards them with a pass that proves that they have beaten the game.

## Accomplishments that I'm proud of

Saying that I am not much of an artist would be putting it lightly. I have always been very much interested in game development, especially the more technical aspect of 3D rendering and game engine architecture, having put many, many hours into exploring both. However, whenever it came to building a game of my own that goes beyond prototypes, I hit a roadblock due to the lack of original game art that I could create. So for this challenge I had to come up with ideas that met a very specific set of requirements:

- Require minimal game art
- The main theme of the game is sustainability
- Allow for seamless, well-integrated educational content without reducing the fun of the gameplay
- Little required world-building or story-telling -> not feasible to come up with a well-written story within 8 weeks, while simultaneously developing the game architecture

It quickly became clear that the game would be in the management/simulation genre, since that best fits the requirements I set for the idea. I am proud that I actually came up with 2 ideas, that both fit each other so well that it even made sense building one as a mini-game into the other. Creating 2 fully functional games within 2 weeks is another thing that I am very proud of.

## What I learned

Whatever the outcome is in the end, this challenge was a super fun experience. The combination of my passion for game development and a theme as important and impactful as sustainability allowed me to learn a lot. I challenged myself to come up with and build games that go beyond fun gameplay and actually teach the player about one of the most important topics right now and for the future. This was the first simulation game that I built and coming up with the architecture was a ton of fun and I learned a lot in the process. These were also the first games that I actually released and I am very proud of that.

## What's next for Recycle Mania

I have no intention of stopping with the development of this game. There are two main things that have to come next: _Playtesting_ and _Balancing_. The game is not very balanced right now and is quite easy to beat. This allows for the exploration of the gameplay mechanics, but in the long run, the game needs to be fun and offer the player a challenge. After collecting feedback and implementing balance changes, the game will need new content. I already have new content in mind:

- Upgrading facilities
- Facility failures
- Workforce restrictions
- Facility Capacity restrictions, i.e. in addition to blueprints the player will also need to increase the size of the recycling facility
- Dynamic economy
- Integrating **Recycle Rumble** as an alternative way for waste acquisition in the game

I believe that this is a great game idea beyond the scope of this challenge and has significant potential. The most important thing right now however is collecting feedback and making this game fun for the players.
