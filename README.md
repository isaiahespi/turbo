
# Turbo Article Template for Quarto

<!-- badges: start -->
<!-- badges: end -->

This is a Quarto template that assists you in creating in simple journal article-like document. The template allows both single and two-column output.

## Creating a New Article

You can use this as a template to create a document by using the following command:

```bash
quarto use template isaiahespi/turbo
```

This will install the extension and create an example `.qmd` file, along with a `bibiography.bib` file that you can use as a starting place for your article.

## Installation For An Existing Document

You may also use this format with an existing Quarto project or document. From the Quarto project or document directory, run the following command to install this format:

```bash
quarto install extension isaiahespi/turbo
```

## Usage

To use the format, you can use the format names `turbo-pdf`. For example:

```bash
quarto render article.qmd --to turbo-pdf
```

or in your document yaml

```yaml
format:
  pdf: default
  simple-article-pdf:
    keep-tex: true    
```
You can view a preview of the rendered template at https://github.com/isaiahespi/turbo/blob/main/template.pdf

## Format Options

The simple article format supports a number of options for customizing the format and appearance of the document. 
Specify these under the `classoption` key.

 - `twoside` - use two-sided output.
 - `twocolumn` -  use two-coloumn output; this option should be used together should be used together with a reduced font size (and possibly narrower margins).
 - `9pt`, `11pt`,... - font size for normal text; 9pt is useful for twocolumn output while other font sizes supported by the `extsizes` package will also work (default: 10pt).
 - `narrowmargins` - use narrow margins; possibly useful for twocolumn articles.
 - `normalnumbers` - use normal numbers for sectioning (default are roman numbers).
 - `phfthm` - provide theorem and proof environments from the phfthm package.

For two-column output, I also recommend non-indented paragraphs (use the ìndent` parameter for the output format). An example:

``` yaml
format:
  turbo-pdf:
    indent: false
    classoption: 
     - 9pt
     - twocolumn
     - twoside
```
## Limitations

In two-column mode, markdown tables are not supported. The reason is that Quarto (at least at the time of writing these notes in v1.2.x) uses the `longtable` environment to typeset tables which is incompatible with the `twocolumn` option to LaTeX classes. Unfortunately, the use of `longtable` is currently hard coded in Quarto.

A workaround - for short tables - is to use the `knitr::kable()` or `kableExtra::kbl()` table generators in R which do not rely on `longtable`. By using their `table.envir` argument (or it's abbreviated form `table.env`), even tables spanning both columns can be constructed. 

The draw with this approach is that table captions and labels must be provided through the `caption` and `label` arguments of these functions; using the Quarto-typical comment-like entries in a code cell (e.g., `label:` and `tbl-cap:`) do not work as their values are not fed into the `kable` or `kbl()` calls. An example for creating a full-width table is:


```r
kableExtra::kbl(head(mtcars), caption = "Cars", label = "tab-cars", booktabs = TRUE, table.env = 'table*')
```

<table>
<caption>Cars</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> mpg </th>
   <th style="text-align:right;"> cyl </th>
   <th style="text-align:right;"> disp </th>
   <th style="text-align:right;"> hp </th>
   <th style="text-align:right;"> drat </th>
   <th style="text-align:right;"> wt </th>
   <th style="text-align:right;"> qsec </th>
   <th style="text-align:right;"> vs </th>
   <th style="text-align:right;"> am </th>
   <th style="text-align:right;"> gear </th>
   <th style="text-align:right;"> carb </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Mazda RX4 </td>
   <td style="text-align:right;"> 21.0 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 160 </td>
   <td style="text-align:right;"> 110 </td>
   <td style="text-align:right;"> 3.90 </td>
   <td style="text-align:right;"> 2.620 </td>
   <td style="text-align:right;"> 16.46 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mazda RX4 Wag </td>
   <td style="text-align:right;"> 21.0 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 160 </td>
   <td style="text-align:right;"> 110 </td>
   <td style="text-align:right;"> 3.90 </td>
   <td style="text-align:right;"> 2.875 </td>
   <td style="text-align:right;"> 17.02 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Datsun 710 </td>
   <td style="text-align:right;"> 22.8 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 108 </td>
   <td style="text-align:right;"> 93 </td>
   <td style="text-align:right;"> 3.85 </td>
   <td style="text-align:right;"> 2.320 </td>
   <td style="text-align:right;"> 18.61 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Hornet 4 Drive </td>
   <td style="text-align:right;"> 21.4 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 258 </td>
   <td style="text-align:right;"> 110 </td>
   <td style="text-align:right;"> 3.08 </td>
   <td style="text-align:right;"> 3.215 </td>
   <td style="text-align:right;"> 19.44 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Hornet Sportabout </td>
   <td style="text-align:right;"> 18.7 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 360 </td>
   <td style="text-align:right;"> 175 </td>
   <td style="text-align:right;"> 3.15 </td>
   <td style="text-align:right;"> 3.440 </td>
   <td style="text-align:right;"> 17.02 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Valiant </td>
   <td style="text-align:right;"> 18.1 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 225 </td>
   <td style="text-align:right;"> 105 </td>
   <td style="text-align:right;"> 2.76 </td>
   <td style="text-align:right;"> 3.460 </td>
   <td style="text-align:right;"> 20.22 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
</tbody>
</table>

The same code without using `table.envir` will generate a single column table.
