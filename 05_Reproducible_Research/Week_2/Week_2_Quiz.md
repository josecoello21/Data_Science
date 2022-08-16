# Quiz 2

1. Who created Markdown?

**Answer:** John Gruber

2. When writing a document in R Markdown, how do you denote the beginning of an R code chunk?

**Answer:** ```{r}

3. When using knitr, how do you indicate the height and width of a plot created in a code chunk?

**Answer:** Set the 'fig.height' and 'fig.width' options for the code chunk

4. With some code chunks, we may not want the output generated by the chunk to be rendered into HTML but would prefer to print the output verbatim. How can we specify this preference for a given code chunk?

**Answer:** Set the option **results = "asis"**

5. When using knitr and R Markdown and producing output in HTML, why should you never edit the resulting HTML file?

**Answer:** Every time you knit() the R Markdown file, the HTML file will be overwritten