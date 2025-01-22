#import "lib.typ":*



#show: mybook.with(
  title: [
    Title
  ],
  authors: (
    (
      name: text("Author",size:18pt, font: "Latin Modern Roman"),

    ),

  ),
  Introduction: lorem(50)
)

= 这是第一章

== 这是第一节


#def()[#lorem(50)] <d1>
#rem()[#lorem(50)]  

  $ 
    integral dd(p,4) delta(p^2 + m^2) theta(p^0) f(p) 
    = integral dd(p,3) dd(p)^0 (delta(p^0 - sqrt(bold(p)^2 + m^2)))/(2|p^0|) f(p)  
  $ <1-1>


@eqt:1-1, @d1 #lorem(10)


#figure(image("fig/cover1.png",width: 8em), caption:"封面") <1>

@fig:1 #lorem(10)

// 附录
#show: appendix
#import "AppLet.typ":*



= 这是附录

== 这是附录

#thm()[#lorem(50)] <d2>
#pf()[#lorem(50)]  


  $ 
    integral dd(p,4) delta(p^2 + m^2) theta(p^0) f(p) 
    = integral dd(p,3) dd(p)^0 (delta(p^0 - sqrt(bold(p)^2 + m^2)))/(2|p^0|) f(p)  
  $ <2-1>

@eqt:2-1, @d2

