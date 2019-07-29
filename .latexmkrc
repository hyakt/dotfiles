#!/usr/bin/env perl
$latex      = 'uplatex -kanji=utf8 -no-guess-input-enc %S';
$bibtex     = 'upbibtex %B';
$biber      = 'biber --bblencoding=utf8 -u -U --output_safechars %B';
$makeindex  = 'upmendex -o %D %S';
$dvipdf     = 'dvipdfmx %O -o %D %S';
$max_repeat = 5;
$pdf_mode   = 3; # generates pdf via dvipdfmx

# Prevent latexmk from removing PDF after typeset.
# This enables Skim to chase the update in PDF automatically.
$pvc_view_file_via_temporary = 0;

# Use Skim as a previewer
$pdf_previewer    = "open -ga /Applications/Preview.app/.app";
$pdf_update_command = "open -ga Preview %S";


