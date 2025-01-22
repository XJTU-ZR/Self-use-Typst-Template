#import "@preview/i-figured:0.2.4"
#import "@preview/hydra:0.5.2": *
#import "@preview/lemmify:0.1.6": *
#import "@preview/physica:0.9.4": *
#import "@preview/mitex:0.2.5": *
#import "@preview/equate:0.2.1": equate
#import "@preview/muchpdf:0.1.0": *

// #import "@preview/ctheorems:1.1.3": *


#import "@preview/great-theorems:0.1.1": *
#import "@preview/rich-counters:0.2.1": *


#let mybook(
  title: none,
  authors: (),
  Introduction: [],
  doc,  
) = {
    set text(font: ("Latin Modern Roman", "FZShuSong-Z01"), size: 12pt)

    show strong: text.with(font: ("Latin Modern Roman","FZHei-B01"), size: 12pt)

    show emph: text.with(font: ("Latin Modern Roman", "FZKai-Z03"), size: 12pt)
    show math.equation: set text(font: "Latin Modern Math", size: 11pt)
    // fonts

    // title page

  set align(center)
  v(4em)
  text(24pt, title)

  let count = authors.len()
  let ncols = calc.min(count, 2)
  grid(
    columns: (5fr,) * ncols,
    row-gutter: 24pt,
    ..authors.map(author => [
      #author.name 
    ]),
  )

  par(justify: false)[
    #text("Introduction", size:18pt,weight: "bold",font: "Latin Modern Roman") 

    #text(Introduction, size:16pt, font: ("Latin Modern Roman", "FZKai-Z03")) 
  ]

  set align(left)

    // title page

    // outline
    show outline: it => {
      show heading: set align(center)
      set text(size: 16pt,fill: blue)
      it
    }

    show outline.entry.where(
      level: 1
    ): it => {
      v(12pt, weak: true)
      //align(center, text(size: 18pt, weight: "bold", fill: blue, it))
      text(size: 12pt,fill: blue, strong(it))
    }

    show outline.entry.where(
      level: 2
    ): it => {
      text(size: 12pt,fill: blue, it)
    }

    show outline.entry.where(
      level: 3
    ): it => {
      text(size: 12pt,fill: blue, it)
    }


    // outline

    // Page
    set page(paper: "a4", margin: (y: 4em), numbering: "1", header: context {
      align(right,  text(size: 13pt,fill: blue,hydra(2)))
      v(-10pt)
      line(length: 100%, stroke: black) 
    }, footer: [
        #align(center,context {counter(page).display("I")})
        #line(length: 100%, stroke: black) 
      ])
    set heading(numbering: "1.1.")
    set par(justify: true,first-line-indent: 2em) // 两端对齐，段前缩进2字符
    show heading: it =>  {
    it
    par()[#text(size:0.5em)[#h(0.0em)]]
    }
    show figure: it =>  {
        it
        par()[#text(size:0.5em)[#h(0.0em)]]
    }

    show heading.where(level: 1): it => pagebreak(weak: true) + it
    show heading.where(level: 1): it => {
      align(center, text(
        size: 18pt,               // 字体大小
        fill: blue,               // 字体颜色
        weight: "bold",           // 加粗
        it
      ))
      v(12pt)
    }

    // 自定义二级标题样式
    show heading.where(level: 2): it => {
      text(
        size: 16pt,               // 字体大小
        fill: blue,               // 字体颜色
        it
      )
       v(8pt)
    }

    // 自定义三级标题样式
    show heading.where(level: 3): it => {
      text(
        size: 14pt,               // 字体大小
        fill: blue,               // 字体颜色
        it
      )
    }
    // Page

    // ref
    let refcolor = color.hsl(0deg, 97.48%, 53.33%)
    show heading: i-figured.reset-counters.with(extra-kinds: ("atom",))
    show figure: i-figured.show-figure.with(numbering: "(1.1)")
    set math.equation(supplement: text("式")+h(-0em))
    set figure(supplement: text("图"))
    show math.equation: i-figured.show-equation.with(numbering: "(1.1)")// a similar function exists for math equations

    //ref 
    // thm
    show: great-theorems-init

    show link: text.with(fill: refcolor)
    show ref: it =>{text(it,refcolor)}
    // thm


    outline(indent: auto, title:"Table of Contents")
    pagebreak()

    // 重置page 
    set page(  footer: [
        #align(center,context {counter(page).display("1")})
        #line(length: 100%, stroke: black) 
      ]
    )
    counter(page).update(1)
  
  doc
}



// thm

#let thmcounter = rich-counter(
  identifier: "thmcounter",
  inherited_levels: 1
)

#let propcounter = rich-counter(
  identifier: "propcounter",
  inherited_levels: 1
)


#let exmcounter = rich-counter(
  identifier: "exmcounter",
  inherited_levels: 1
)

#let defcounter = rich-counter(
  identifier: "defcounter",
  inherited_levels: 1
)


#let thm = mathblock(
  blocktitle: "Theorem",
  counter: thmcounter,
  bodyfmt: body=>[#text(font: ("Latin Modern Roman", "FZKai-Z03"),size: 15pt,emph(body))] ,
  suffix: [],
  ).with(fill: rgb("#70dbe9"), radius: 10pt, inset: 10pt)
  
#let prop = mathblock(
  blocktitle: "Proposition",
  counter: propcounter,
  bodyfmt: body=>[#text(font: ("Latin Modern Roman", "FZKai-Z03"),size: 15pt,emph(body))] ,
  suffix: [],
  ).with(fill: rgb("#155ada49"), radius: 10pt, inset: 10pt)

#let exm = mathblock(
  blocktitle: "Example",
  counter: exmcounter,
  bodyfmt: body=>[#text(font: ("Latin Modern Roman", "FZKai-Z03"),size: 15pt,emph(body))] ,
  suffix: [],
  ).with(fill: rgb("#0caec42c"), radius: 10pt, inset: 10pt)

#let def = mathblock(
  blocktitle: "Definition",
  counter: defcounter,
  bodyfmt: body=>[#text(font: ("Latin Modern Roman", "FZKai-Z03"),size: 15pt,emph(body))] ,
  suffix: [],
  ).with(fill: rgb("#eeffee"), radius: 10pt, inset: 10pt)

#let pf = mathblock(
  blocktitle: "Proof",
  prefix: [*_Proof._*],
  bodyfmt: body=>[#text(font: ("Latin Modern Roman", "FZKai-Z03"),size: 15pt,emph(body))] ,
  suffix: [#h(1fr) $qed$],
)


#let rem = mathblock(
  blocktitle: "Remark",
  prefix: [*_Remark._*],
  bodyfmt: body=>[#v(0.01em) #text(font: ("Latin Modern Roman", "FZKai-Z03"),size: 15pt,emph(body))] ,
  suffix: [#h(1fr) $qed$],
)


// thm

#let appendix(body) = {
  set heading(numbering: "A.1.", supplement: [Appendix])
  set par(justify: true,first-line-indent: 2em) // 两端对齐，段前缩进2字符
  show heading: it =>  {
    it
    par()[#text(size:0.5em)[#h(0.0em)]]
  }
  show figure: it =>  {
      it
      par()[#text(size:0.5em)[#h(0.0em)]]
  }

  show math.equation: i-figured.show-equation.with(numbering: "(A.1)")
  //show figure: i-figured.show-figure.with(numbering: "A.1")
  counter(heading).update(0)
  body
}
    




