mh3uCalc
========

A tool for discovering armor sets for Monster Hunter Ultimate 3, and hopefully some day Monster Hunter 4.


About
========
In the video game franchise Monster Hunter, players do not "level up" as they would in traditional games.  
Instead, your character skills are entirely determined by the equipment worn.  There are hundreds of
different armor pieces in the game, and each one grants a certain number of points in a skill.  Once that
total reaches a certain value ( usually 10 but sometimes 15 and even 20), the character will have access to 
that skill.  For instance, if you equipped five different armor pieces that gave +2 Fire Attack, you would
have a total of 10 points in Fire Attack, which would grant the skill Fire Attack+.  

In addition to the points granted by equipment pieces, each piece of equipment can have up to 3 "slots" in
which you can place "decorations".  These decorations also grant skill points.

To top this all off we have Talismans.  Talismans are like other equipment save for one big difference --
while other equipment is built from blueprints and will always be the same, talismans are found and have
random attributes.  Talismans grant skill points and can also have up to three decoration slots.

The most common - and easiest - method of getting skills in Monster Hunter is to simply equip a matching set
of armor -- equipment built from the same parts will usually unlock around 3 skills.  However, many skill
combinations are only available by mixing pieces from different armor sets, but between the hundreds of armor
pieces, dozens of decorations, and randomly generated talismans this is a daunting task.  Even if you 
manage to get the skills you want on an armor set, there may still be a better build that includes more skills,
more defense, or better resistances.

The purpose of this calculator is to help users configure armor sets with the skills they desire.  For now 
it walks through the armor building process with the user, giving them equipment recommendations at each step.
Ultimately I want it to be able to automatically generate multiple builds for desired skills and give
recommendations based on what it determines to be "best", squeezing out defense points or additional skills.

Notes
========
This calculator is built using Ruby on Rails with Twitter Bootstrap.  Documentation will improve along
with the project.


To Do
========
- Ajax armor description in build so user can see where they are going in real time
- Decorations (and placing them algorithmically first and last)
- User Registration
- User Defined Talismans
- Automated Armor Building w/ several concurrent instances
- Add gunner sets
- Add decorations