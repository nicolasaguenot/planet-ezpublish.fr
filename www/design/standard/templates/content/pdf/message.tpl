{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{pdf(header, hash( type, 2,
                   text, $object.name|wash,
                   size, 24,
                   align, center ) )}

{section name=ContentObjectAttribute loop=$object.contentobject_attributes}
  {attribute_pdf_gui attribute=$ContentObjectAttribute:item}
{/section}

{let related=$object.related_contentobject_array}
  {section show=$related}
    {pdf(header, hash( type, 3,
                       text, "Related objects"|i18n("design/standard/content/view")|wash(pdf),
                       size, 18,
                       align, center ) )}
    
    {section name=Object loop=$related}
      {content_pdf_gui view=line content_object=$Object:item}
    {/section}

  {/section}
{/let}
