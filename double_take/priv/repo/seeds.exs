# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     DoubleTake.Repo.insert!(%DoubleTake.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias DoubleTake.Library

Library.create_quotation()

Library.create_quotation(%{text: "The Dude Abides.",
name: "The Dude",
steps: 2})

Library.create_quotation(%{text: "It can’t rain all the time",
name: "The Crow",
steps: 2})

Library.create_quotation(%{text: "The best way to spread Christmas cheer is singing loud for all to hear.",
name: "Elf",
steps: 2})

Library.create_quotation(%{text: "So you’re saying there’s a chance",
name: "Dumb and Dumber",
steps: 2})

Library.create_quotation(%{text: "We the People of the United States, in Order to form a more perfect Union, establish Justice, insure domestic Tranquility, provide for the common defense, promote the general Welfare, and secure the Blessings of Liberty to ourselves and our Posterity, do ordain and establish this Constitution for the United States of America.",
name: "Preamble",
steps: 8})

Library.create_quotation(%{text: "You don’t open your mouth until you know what the shot is",
name: "Glengarry Glenross",
steps: 4})

Library.create_quotation(%{text: "You got this lion, he’s the king of the jungle. Huge mane out to here. He’s laying down under a tree, in the middle of Africa, he’s so big, he’s so hot! He doesn’t wanna move. Now, the little lion cubs they start messin’ with him, bitin’ his tail, bitin’ his ears, he doesn’t do anything. The lioness, she starts messing with him, coming over making trouble, still nothing. Now the other animals, they notice this, and they start to move in. The jackals, hyenas, they’re barking at him, laughing at him. They nip his toes and eat the food that’s in his domain. They do this and they get closer and closer and bolder and bolder, till one day…that lion gets up and tears the shit outta everybody, runs like the wind, eats everything in his path, ’cause every once in a while, the lion has to show the jackals who he is. It’s too late to be scared. It’s time to kill",
name: "Poolhall Junkies",
steps: 15})

Library.create_quotation(%{text: "To infinity and beyond",
name: "Toy Story",
steps: 2})

Library.create_quotation(%{text: "Did you try turning it off and on again?",
name: "OTP",
steps: 2})

DoubleTake.Accounts.register_user(%{
  email: "email@example.com",
  password: "password"
})
