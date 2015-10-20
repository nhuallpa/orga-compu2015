#!/bin/bash
cp ../tp1.c .
cp ../multiplicar.S .
pdflatex tp1.tex
cp tp1.pdf ..
echo "Informe generado y copiado"
