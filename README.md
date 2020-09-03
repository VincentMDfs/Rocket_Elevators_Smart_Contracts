# Rocket_Elevators_Smart_Contracts
## CodeBoxx Week - 12
The project was to create a smart contract consisting of 6 nodes using Solidity and Truffle as well as a front end component for which we used Vue. The de facto leader of the team was ***Vincent Mercier***, the front-end was done by ***Frédéric Choquette*** with from ***Samuel Chabot & Alexandre Levesque*** and the nodes were worked on by all team members.

## The Team
- Vincent Mercier
- Samuel Chabot
- Alexandre Levesque
- Frédéric Choquette
- Thierry Harvey
- Thomas Simoneau
- Philippe Lemire
- Martin Dussault
- Colin Larke

## The Nodes
The smart contract is made up of six individual nodes, with their responsibilities and collaborators listed below.

1. **Project Office** - ***Phillipe Lemire & Martin Dussault*** \
Takes the initial order for the contract and inputs the amount of Batteries, Columns, Elevators and Floors and converts this to a list of parts Controllers, Shafts, Doors, Buttons, Motors and the quantity of each needed.

2. **Material Provider** - ***Samuel Chabot & Frédéric Choquette*** \
Recieves the list of parts needed and performs calculations to determine the necessary raw materials needed to manufacture the order and pushes each material and quantity into an array that is passed to the Solution Manufacturing node.

3. **Solution Manufacturing** - ***Thierry Harvey, Thomas Simoneau & Colin Larke*** \
Sorts the array of materials into maps for each resource and creates the individual components by making as many components as the resources given allows. These components are added to an array of type and quantity and passed to the Quality, Security and Homologation node.

4. **Quality, Security and Homologation** - ***Alexandre Levesque & Vincent Mercier*** \
Receives the list of components and marks each one with a certificate of verification which includes a timestamp and id number for each component in the order. The components array is then sent to the Shipping node.

5. **Shipping** - ***Samuel Chabot, Frédéric Choquette & Alexandre Levesque*** \
The Shipping node recieves the verified parts list from the previous node and marks each component recieved, packaged and then shipped.

6. **Installation and Activation** - ***The Whole Team*** \
The final node takes the list of parts that were shipped and assembles them into the elevator system that was ordered in the first node. It then marks the system as activated and returns a list of functional Batteries, Columns, Elevators and Floors.

## Running the application
To see the program in action, clone the repository, enter root folder and run the command \
``sh start.sh``
