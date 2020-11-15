chaim = User.create(email: "chaim@gmail.com", username: "chaim123", password: "password")
becca = User.create(email: "becca@gmail.com", username: "becca123", password: "password")

chaim.tweets.create(content: "What a day!")
becca.tweets.create(content: "So cool!")