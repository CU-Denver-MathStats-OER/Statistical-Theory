lyrics <- c("Yeah", "I", "was", "working", "part", "time", "in", "a", "five", "and", "dime", "My", "boss", "was", "Mr", "McGee", "He", "told", "me", "several", "times", "that", "he", "didnt", "like", "my", "kind", "Cause", "I", "was", "a", "bit", "too", "leisurely", "Seems", "that", "I", "was", "busy", "doing", "something", "close", "to", "nothing", "But", "different", "than", "the", "day", "before", "Thats", "when", "I", "saw", "her", "ooh", "I", "saw", "her", "She", "walked", "in", "through", "the", "out", "door", "out", "door", "She", "wore", "a", "Raspberry", "beret", "The", "kind", "you", "find", "in", "a", "second", "hand", "store", "Raspberry", "beret", "And", "if", "it", "was", "warm", "she", "wouldnt", "wear", "much", "more", "Raspberry", "beret", "I", "think", "I", "love", "her", "Built", "like", "she", "was", "She", "had", "the", "nerve", "to", "ask", "me", "If", "I", "planned", "to", "do", "her", "any", "harm", "So", "look", "here", "I", "put", "her", "on", "the", "back", "of", "my", "bike", "And", "we", "went", "riding", "Down", "by", "old", "man", "Johnsons", "farm", "I", "said", "now", "overcast", "days", "never", "turned", "me", "on", "But", "something", "about", "the", "clouds", "and", "her", "mixed", "She", "wasnt", "to", "bright", "But", "I", "could", "tell", "when", "she", "kissed", "me", "She", "knew", "how", "to", "get", "her", "kicks", "She", "wore", "a", "Raspberry", "beret", "The", "kind", "you", "find", "in", "a", "second", "hand", "store", "Raspberry", "beret", "And", "if", "it", "was", "warm", "she", "wouldnt", "wear", "much", "more", "Raspberry", "beret", "I", "think", "I", "love", "her", "The", "rain", "sounds", "so", "cool", "when", "it", "hits", "the", "barn", "roof", "And", "the", "horses", "wonder", "who", "you", "are", "Thunder", "drowns", "out", "what", "the", "lightning", "sees", "You", "feel", "like", "a", "movie", "star", "Listen", "They", "say", "the", "first", "time", "aint", "the", "greatest", "But", "I", "tell", "ya", "If", "I", "had", "the", "chance", "to", "do", "it", "all", "again", "I", "wouldnt", "change", "a", "stroke", "Cause", "baby", "Im", "the", "most", "With", "a", "girl", "as", "fine", "as", "she", "was", "then", "The", "kind", "you", "find", "The", "kind", "you", "find", "The", "kind", "you", "find", "In", "a", "second", "hand", "store", "Oh", "no", "no", "Raspberry", "beret", "And", "if", "it", "was", "warm", "Where", "have", "all", "the", "raspberry", "women", "gone", "Yeah", "Raspberry", "beret", "I", "think", "I", "I", "think", "I", "I", "think", "I", "love", "her", "No", "no", "no", "No", "no", "no", "The", "kind", "you", "find", "In", "a", "second", "hand", "store", "Raspberry", "beret", "Tell", "me", "Where", "have", "all", "the", "raspberry", "women", "gone", "And", "if", "it", "was", "warm", "she", "Wouldnt", "wear", "much", "more", "Raspberry", "beret")
pop.letters <- nchar(lyrics)

# Create your own sample here:
my.sample <- #########
my.letters <- nchar(my.sample)

counter <- 0
plot(x = c(0, 8), y = c(1, 100), type = "n", xlab = "", ylab = "")

for (i in 1:100)
{
  x <- sample(pop.letters, size = 30, replace = FALSE)
  L <- mean(x) - 1.96*sqrt(3.45/30)
  U <- mean(x) + 1.96*sqrt(3.45/30)
  if ( L < mean(pop.letters) && mean(pop.letters) < U)
  {
    counter <- counter + 1
    plot.color  <- "green"
  }
  else
    plot.color  <- "red"
  segments(L, i, U, i, col = plot.color)    
}

abline(v = mean(pop.letters), col = "blue")
counter/100




