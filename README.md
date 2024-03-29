
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- Unless your project is a Quarto Project. Then README.Rmd will render an HTML file -->


# Turbo Article Template for Quarto

<!-- badges: start -->
<!-- badges: end -->

This is a Quarto template that assists you in creating in simple journal article-like document. The template allows both single and two-column output.

This template, and much of the wording of the README, was derived primarily from [Christian Marquardt's quarto-simple-article format template](https://github.com/cmarquardt/quarto-simple-article/tree/main). 

Template modification (and refinement for this repository) followed a guide written by [Christopher T. Kenny](https://christophertkenny.com/) found [here](https://christophertkenny.com/posts/2023-07-01-creating-quarto-journal-articles/). I recommend following his tutorial guide if you are interested in created your own Quarto article template, especially for official or officially endorsed templates often found on [Overleaf](https://www.overleaf.com/).


## Creating a New Article

You can use this as a template to create a document by using the following command in the terminal:

```bash
quarto use template isaiahespi/turbo
```

This will install the extension and create an example `.qmd` file, along with a `bibiography.bib` file that you can use as a starting place for your article. 

To be clear, this will download a folder (i.e., a directory) into your working directory that can be specifically used for your article; it includes the necessary files and such to begin writing and (should) render right "out-of-the-box", so to speak. You will be asked for the directory name for this folder (e.g., "article" or whatever) which will also be used for the name of the `.qmd` file (e.g., article.qmd).

## Installation For An Existing Document

You may also use this format with an existing Quarto project or document. From the Quarto project or document directory, run the following command to install this format:

```bash
quarto install extension isaiahespi/turbo
```

## Example

Here is the source code for a minimal sample document: [template.qmd](template.qmd).
This produces the following document (click for a full preview):

<!-- pdftools::pdf_convert('template.pdf',pages = 1) -->
![[template.qmd](template.qmd)](figs/template_1.png)


## Usage

To use the format, you can use the format names `turbo-pdf`. For example:

```bash
quarto render article.qmd --to turbo-pdf
```

or in your document yaml

```yaml
format:
  pdf: default
  turbo-pdf:
    keep-tex: true    
```
You can view a preview of the rendered template at https://github.com/isaiahespi/turbo/blob/main/template.pdf

## Format Options

The article format supports a number of options for customizing the format and appearance of the document. 
Specify these under the `classoption` key.

 - `twoside` - use two-sided output.
 - `twocolumn` -  use two-coloumn output; this option should be used together should be used together with a reduced font size (and possibly narrower margins).
 - `9pt`, `11pt`,... - font size for normal text; 9pt is useful for twocolumn output while other font sizes supported by the `extsizes` package will also work (default: 10pt).
 - `narrowmargins` - use narrow margins; possibly useful for twocolumn articles.
 - `normalnumbers` - use normal numbers for sectioning (default are roman numbers).
 - `lucida` - use the commercially available (from the TUG) Lucida fonts; this requires Lua/XeLaTeX (default: Palatino for pdfLaTeX or TeX Gyre Pagella for Lua/XeLaTeX).
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

```{r}
kableExtra::kbl(head(mtcars), caption = "Cars", label = "tab-cars", booktabs = TRUE, table.env = 'table*')
```

The same code without using `table.envir` will generate a single column table.

