---
title: "Datafest Oregon 2016"
tags: ["science", "data science"]
menu: "blog"
date: 2016-06-11
slug: "datafest"
---

![image](/blog/resources/datafest-header.jpg)

Datafest Oregon 2016
====================

This year, I competed in Datafest. Datafest is a data analysis
competition for students, with a corporate sponsor who provides the
data. For this competition Ticketmaster provided the data, and Datafest
itself was hosted by Dr. Charlotte Wickham, an assistant professor in
the Statistics Department at OSU.

Our team was called "Pretty Terrestrial", and consisted of myself,
Michelle Wiley, Steven Freidman, and Camden Lopez. It was a lot of fun
working together on this project, especially when it got down to crunch
time in the final hour.

The best data visualization on here is the interactive map at the end,
so if you want to skip ahead to that, [check out the results
section](#results).

The team (from left to right): Steve Freidman, Andrew Brereton (me),
Camden Lopez, Michelle
Wiley.  
![](/blog/resources/pretty_terrestrial.jpg)

The Data
--------

The data that we received was in the form of three tables:

1.  Adwords data - information from Google about the ad campaigns
2.  User behavior data - information about what pages users looked at, and for how long, etc.
3.  Purchase data - each row here represented a ticket purchase

We were able to narrow down our search for insights by ignoring the
Adwords data. That aspect of the problem was less interesting to us, so
we didn't consider it. That left us with only \~4 Gb of data to search
through for *cool stuff*.

Searching
---------

We started off with a hunch. Many of us grew up in isolated regions. The
concert-going experience in an isolated region is really
straightforward: a band you're interested in is doing a show in the only
nearby city, so you try really hard to get tickets because you never
know if they'll ever return. In terms of our data, we were wondering if
we would see any relationships between ticket sale price, and
willingness to travel to events.

To assess *willingness to travel*, we first had to come up with some
sense of distance. So we obtained latitude and longitude by using the
zip-code, city, and state names in the purchase dataset, and the
geolocation of the IP addresses in the user behaviour dataset. Next we
used the Haversine formula to convert the lat-long differences into a
distance (in km). So now we had a metric for each user in the behaviour
dataset, which tells us how far they were from the event they were
looking at.

Then we can plot that on a map!

![Events plotted on a map of the USA, with their size corresponding to
the median cost of the tickets for that event, and their color
corresponding to the median distance of users looking at that event from
that event.](/blog/resources/interest_map.png)

The first version of this map had a line connecting every user to every
event they looked at. The whole map was black. It turns out people from
all over tend to look at events from all over. Makes sense, I assume
people are more interested in the band then they are in the location. To
fix this, we identified the median user-distance for each event.

Looking at the map, the most interesting thing we noticed is that a lot
of events along the west coast seem to attract more interest from afar,
and events in the Midwest attract less interest from afar. It seemed
like there might be something to this after all.

We hoped to get a finer picture of what was going on however, so we
started by breaking down the analysis by region.

![Relative proportion of users from various regions looking at events in
various regions.](/blog/resources/filled_bars.png)

Looking at this plot, it's clear that events in each region are mostly
looked at by people from that region. That's a great sanity check, but
maybe not that interesting. So we added cost back into the picture.

![The median distance of a user looking at a given event (colored by the
region the event is in), plotted against the median ticket cost of the
event.](/blog/resources/CostvsDistance.png)

Here, we see an interesting trend. It seems like people **do** pay more
when the event they are interested in is more distant... or rather,
*they do if the event is in the west*. It's also interesting to see the
straight horizontal line at about \$100. It seems people are hesitant to
sell for more than that.

At this point, we felt like we were getting somewhere. We still needed
something with a little more resolution than these broad regions though.
So we broke all the user-event pairs up by state-to-state, and created a
metric I call the *Weighted Financial Interest* (WFI).

In the raw R code, we calculate it like this:

{{< highlight R >}}

cost_means <- do(clustering_grouped_by_state, get_mean_cost_for_clustering(.))

cost_means$RI <- cost_means$median_ticket_cost / cost_means$mean_event_cost

cost_states_incomplete <- cost_means %>% 
  group_by(buyer_state, event_state) %>% 
  summarise(WFI = mean(RI))
{{< / highlight >}}

In more simple terms, it could be described like this:

> There is one WFI value for each pair of states. For each **event
> state** there is a mean cost for *all* events in that state. For each
> user in the **user state** there is a cost for the event that user was
> looking at (in the **event state**). The relative interest (RI) is the
> ratio of these two costs: the cost of the particular event the user
> was looking at divided by the cost of the mean event in that **event
> state**. Then, for each pair of states, the mean RI is the WFI.

Results
-------

What this metric gives us is a measure of how "interested" various
states are in events being held in other states. For example, we can see
that people from New York are looking at events in California which cost
less than the average event in California. We also see the reverse,
people in California are looking at less expensive events in New York.
This might make sense considering that usually when an expensive show is
going to New York, it will probably at least also go to California, and
vice versa.

Another really interesting trend occurs in Midwest states. For example,
we see that the strongest interest in events in Missouri are from
neighboring Midwest states.

There is some missing data in the final plot, and some small formatting
issues, but I present it here as it was when we presented it at
Datafest. We only had an hour or two to learn how to use Leaflet and
Shiny.

There are more interesting things we can see in the data, but I'll let
you play around with it yourself!

<div class="videoWrapper">
<iframe id="ticketmaster-map" src="https://atomoton.shinyapps.io/ticketmaster-map/" style="border: none; width: 100%; height: 100%; margin: auto" frameborder="0"></iframe>
</div>

