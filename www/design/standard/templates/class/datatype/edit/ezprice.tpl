{* DO NOT EDIT THIS FILE! Use an override template instead. *}

<div class="block">
<label>{'Default VAT'|i18n( 'design/standard/class/datatype' )}:</label>
<select name="ContentClass_ezprice_include_vat_{$class_attribute.id}">
<option value="1" {section show=eq( $class_attribute.data_int1, 1 )}selected="selected"{/section}>{'Price inc. VAT'|i18n( 'design/standard/class/datatype' )}</option>
<option value="2" {section show=eq( $class_attribute.data_int1, 2 )}selected="selected"{/section}>{'Price ex. VAT'|i18n( 'design/standard/class/datatype' )}</option>
</select>
</div>

<div class="block">
<label>{'Default VAT type'|i18n( 'design/standard/class/datatype' )}:</label>
{include uri='design:shop/vattype/edit.tpl'
         select_name=concat( "ContentClass_ezprice_vat_id_", $class_attribute.id )
         vat_types=$class_attribute.content.vat_type
         current_val=$class_attribute.data_float1}
</div>