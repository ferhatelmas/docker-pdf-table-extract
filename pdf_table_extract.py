#!/usr/bin/env python2

import sys
import pdftableextract as pdf


def convert_pdf_to_text(src, dest):
    cells = pdf.process_page(src, "1")
    with open(dest, "w") as f:
        for cell in cells:
            f.write(cell[5])
            f.write("\n")


convert_pdf_to_text(sys.argv[1], sys.argv[2])
