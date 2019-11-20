# COBOL

Here is a lot of documentation because COBOL is quite different than modern programming languages, so if you want to understand what's going on you will probably need to read a little bit.

- Here is [IBM COBOL documentation](https://www.ibm.com/support/knowledgecenter/en/ssw_ibm_i_71/rzahg/rzahgcobol.htm).
- Here is [COBOL Wikipedia page](https://en.wikipedia.org/wiki/COBOL).
- Here is [COBOL Wikibooks](https://en.wikibooks.org/wiki/Software_Engineers_Handbook/Language_Dictionary/COBOL).
- Here is [7 COBOL examples with explanations](https://medium.com/@yvanscher/7-cobol-examples-with-explanations-ae1784b4d576) by [Yvan Scher](https://medium.com/@yvanscher).
- Here is [The beauty of the COBOL Programming Language](https://devops.com/the-beauty-of-the-cobol-programming-language-v2/) by [Bob Reselman](https://devops.com/author/bob-reselman/).

In order to compile this code you need a COBOL compiler. [GnuCOBOL](https://open-cobol.sourceforge.io/) is the one I used to write this program.

## Run

At the repository root (with GnuCOBOL):
```
cobc -x cobol/pomodoro.cob
./pomodoro
```

## Notes

- run-p paragraph is written like that because run/RUN is a reserved word.

- DIVIDE perform a euclidiean division which allow us to get the MINUTES (the quotient) and the SECONDS (the remainder) in a single line.

- Unlike ADD, SUB, MUL and DIVIDE, there is no MOD (for modulo) in original 1959 COBOL. As explain before you can use DIVIDE and get the remainder. But there is now an [intrisinc function](https://riptutorial.com/cobol/topic/7580/intrinsic-functions) called MOD you can use by doing : FUNCTION MOD (dividend divisor). I use it to choose between a 15 minutes and a 5 minutes pause.

- There is no sleep() or wait() function in COBOL. The sleep-1-second paragraph is supposed to be an equivalent to these. This paragraph is a copy from a code given as an answer to [this question](http://ibmmainframes.com/about9953.html).
