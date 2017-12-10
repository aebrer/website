---
title: "Designing a Tattoo Using Neural Networks"
tags: ["science", "craft", "tattoo"]
menu: "blog"
date: 2017-06-08
slug: "tattoo"
---

![](/blog/resources/tattoo_trimmed_nobg.png)

When I design a tattoo I like it to mean something personally to me. I
also like for it to be unique, and to reflect my personality. With that
in mind, I hoped to create a tattoo that would show some of the things I
had learned here at OSU, while I was getting my PhD. I think I've been
able to pull that off, and I'll try to detail a little about how I made
the tattoo here in this blog post.

Getting the Structure
---------------------

The base of the tattoo is a DNA structure. When structural biologists
solve a structure for a molecule, they then have to decide how to
represent that structure when making figures or even thinking about it
while making predictions. One common representation is to simply display
each of the atoms as small spheres. In this case, that's what I decided
would look best for the tattoo, and I liked how it kept things pretty
simple.

To decide the colours I would use, I took advice from one of my
favourite websites, [Color Brewer](http://colorbrewer2.org). You can see
this first visualization below:

![](/blog/resources/color3.png)

An example of another type of visualization that might be valid as well
is called a surface view, which shows the water-accessible surface of
the molecule.

![](/blog/resources/surface.png)

One of the aspects I like best about using this actual experimentally
solved structure as the basis for this tattoo, is that many of the
observed bond angles and other geometric details (like base pair
planarity) are very non-ideal. Often when people represent DNA or
proteins, they treat everything as if it exists in some perfect state
that conforms to our best theories. In reality it is never so simple.
Strain and tension within these structures often dictates that they
deform and twist away from ideal geometry, and this structure is a great
example of that.

Computer, make art!
-------------------

What I had now was a passable, interesting image of DNA. What I wanted
was something striking and visually cool as well. Since I've been here,
getting my PhD, I've learned a lot of programming and computer science.
I've found that I really enjoy it, and I am glad I've been able to apply
it to my own research. One of the developments I've been following and
always found interesting is the ability of trained neural networks to
lift the style from one art image, and apply it to another content
image. So that's what I decided to do with this DNA image.

To start, I messed around with a style called "low-poly", where you
essentially try to recreate the image as it exists, but using only
simply coloured triangles.

![](/blog/resources/lowpoly0.png)

I made a few different versions of this.

![](/blog/resources/lowpoly3.png)

Then, in order to not lose the original meaning altogether, I blended
these low-poly images with the original, while strengthening the black
lines of the spheres.

![](/blog/resources/blend1.png)

Now I had the base image I liked, and I could begin to style it using
neural networks. To do this, I used the [chainer implementation of the
neural style
algorithm](https://github.com/yusuketomoto/chainer-fast-neuralstyle).

I began to experiment with different artistic styles.

![](/blog/resources/edat.png)

![](/blog/resources/candy.png)

![](/blog/resources/kand.png)

Finally, I worked to blend these together and layer them in a way that I
was happy with, while trimming the edges and cleaning up a few
artifacts:

![The final product. (at a lower resolution for this
post)](/blog/resources/tattoo_trimmed_nobg.png)

Getting the Tattoo!
-------------------

After sitting on the design for a year to decide if I really wanted it
or not, I decided to go for it. I found my artist: [Melody
McBrayer](https://www.instagram.com/Art_of_melody_grace/), and we got to
work.

![](/blog/resources/melody.jpg)

I can only say that Melody did a fantastic job, and I can't believe how
well she has been able to capture all the strange details in this
tattoo. In the first session, we did all the line-work; I'll need to
come back later to get the color, once I've healed.

![Looking a little raw, because it
is.](/blog/resources/linework_prehealing.jpg)

Update: June 2 2017
-------------------

![Mostly healed.](/blog/resources/bandwHealed.jpg)

Once the linework was more or less healed, I was able to return and get
the tattoo colored in a second session!

Here are some photos of me getting the tattoo coloured:

![Just starting out!](/blog/resources/colorProgress1.jpg)

![3 hours and 45 minutes in. The greens took the
longest.](/blog/resources/colorProgress2.jpg)

All in all it was quite a long session, but the finished product was
worth it!

It's still healing somewhat, but here is the more or less final product:

![](/blog/resources/colorFinished.jpg)

Once again, big thanks to Melody at Anchored Ink Eugene for pulling it
off. I hadn't quite realized what an undertaking this would be, but I
couldn't be happier with the end result!


