# Build a PDF with pdfLaTeX and stop at the first LaTeX error.
$pdf_mode = 1;
$pdflatex = 'pdflatex -interaction=nonstopmode -halt-on-error -file-line-error %O %S';
