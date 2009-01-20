{default attribute_base='ContentObjectAttribute' html_class='full'}
{let data_text=cond( is_set( $#collection_attributes[$attribute.id] ),
                     $#collection_attributes[$attribute.id].data_text,
                     $attribute.content )}
<textarea class="{eq( $html_class, 'half' )|choose( 'box', 'halfbox' )}"
          name="{$attribute_base}_data_text_{$attribute.id}"
          id="field_{$attribute.id}"
          cols="70"
          rows="{$attribute.contentclass_attribute.data_int1}">{$data_text|wash}</textarea>
{/let}
{/default}
