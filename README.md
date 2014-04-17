Makerland book
==============

This is a repo containing first Makerland Tutorials book and resouces to build it. 

The book is written in [Markdown](http://daringfireball.net/projects/markdown/) and converted to PDF using [Pandoc](http://johnmacfarlane.net/pandoc/).


What's in this repo?
===============

You should see two folders here:

- __content__ - this is the book content. If you want to edit the content of the book - images or text, go here. It contains Markdown and image files.
- __templates__ - these are latex templates used by Pandoc to design PDF files generated from Markdown.  


Generating books
===============

## Dependencies

First, you need to install this:

Packages:

- [`pandoc`](http://johnmacfarlane.net/pandoc/installing.html)
- [`texlive-xetex`](http://scripts.sil.org/cms/scripts/page.php?item_id=xetex_download)
- `texlive-latex-extra`
- `texlive-latex-recommended`

Fonts are included here, but make sure you have them too:

- `Bebas`
- `Minion Pro`

## Building the book

There are two ways of builing a book:

- Print version: run `make makerland print` in your terminal
- PDF version: run `make makerland pdf`

You can also build just one tutorial, by running this:

- Print version: run `make [tutorial] print` in your terminal (for example `make pythonruby print`)
- PDF version: run `make [tutorial pdf`

Yay! Your book should now be ready in __build__ folder.

Licence
===============

Creative Commons Attribution NonCommercial ShareAlike (CC-NC-SA)

Read more: <https://tldrlegal.com/license/creative-commons-attribution-noncommercial-sharealike-(cc-nc-sa)>
