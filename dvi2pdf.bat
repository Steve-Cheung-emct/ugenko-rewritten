dvipdfmx -V 7 main.dvi
pdfcrop --margins 36  main.pdf crop-mysample.pdf

del	*.aux	*.bak	*.log	*.bbl	*.blg	*.thm	*.toc	*.out	*.lof	*.lol	*.lot	*.fdb_latexmk	*.synctex.gz	*.ent	/s
pause