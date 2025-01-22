#import "lib.typ": *


#let axmcounter = rich-counter(
  identifier: "axmcounter",
  inherited_levels: 1
)


#let thm = mathblock(
  blocktitle: "Theorem",
  counter: thmcounter,
  numbering: "A.1",
  bodyfmt: body=>[#text(font: ("Latin Modern Roman", "FZKai-Z03"),size: 15pt,emph(body))] ,
  suffix: [],
  ).with(fill: rgb("#70dbe9"), radius: 10pt, inset: 10pt)

#let prop = mathblock(
  blocktitle: "Proposition",
  counter: propcounter,
  bodyfmt: body=>[#text(font: ("Latin Modern Roman", "FZKai-Z03"),size: 15pt,emph(body))] ,
  suffix: [],
  ).with(fill: rgb("#0881f1e8"), radius: 10pt, inset: 10pt)


#let exm = mathblock(
  blocktitle: "Example",
  counter: exmcounter,
  numbering: "A.1",
  bodyfmt: body=>[#text(font: ("Latin Modern Roman", "FZKai-Z03"),size: 15pt,emph(body))] ,
  suffix: [],
  ).with(fill: rgb("#0caec42c"), radius: 10pt, inset: 10pt)

#let def = mathblock(
  blocktitle: "Definition",
  counter: defcounter,
    numbering: "A.1",
  bodyfmt: body=>[#text(font: ("Latin Modern Roman", "FZKai-Z03"),size: 15pt,emph(body))] ,
  suffix: [],
  ).with(fill: rgb("#eeffee"), radius: 10pt, inset: 10pt)



#let axm = mathblock(
  blocktitle: "Axiom",
  counter: axmcounter,
    numbering: "A.1",
  bodyfmt: body=>[#text(font: ("Latin Modern Roman", "FZKai-Z03"),size: 15pt,emph(body))] ,
  suffix: [],
  ).with(fill: oklch(73.47%, 0.158, 67.92deg, 28.1%), radius: 10pt, inset: 10pt)