{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{* Generate complete PDF file from definition and stream or save it *}
{* Usage:
            pdf(execute, $pdf_definition, hash(size, A4,
                                               orientation, portrait))

   available sizes: 4A0, 2A0, A0-10, B0-10, C0-10, RA0-4, SRA0-4, LETTER, LEGAL, EXECUTIVE, FOLIO
   orientation: portrait, landscape 
   
*}


{pdf(execute, $pdf_definition, hash( size, A4,
                                     orientation, portrait ) )}

{if $generate_stream|eq(1)}
  {pdf(stream)}
{/if}

{if $generate_file|eq(1)}
  {pdf(close, $filename)}
{/if}
