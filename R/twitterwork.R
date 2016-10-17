library(dplyr)
Twitter <- select(Twitter, date, Time, Tweets)
library(ggplot2)
ggplot(Twitter, aes(as.numeric(Time), Tweets)) + geom_point() +
  ggtitle("Growth in Twitter Tweets")

ggplot(filter(Twitter, Time > 500, Time < 2000),
       aes(as.numeric(Time),
           log(Tweets))) + geom_point() +
  ggtitle("Growth in Twitter Tweets")

lm(log(Tweets) ~ as.numeric(Time),
   data=filter(Twitter, Time > 500, Time < 2000))

ggplot(filter(Twitter, Time > 500, Time < 2000),
       aes(as.numeric(Time),
                    log(Tweets))) + geom_point() +
  ggtitle("Growth in Twitter Tweets") +
  geom_smooth(method="lm", color="red", se=FALSE)
