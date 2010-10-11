{* DO NOT EDIT THIS FILE! Use an override template instead. *}
<div class="block">
<label>{'Media player type'|i18n( 'design/standard/class/datatype' )}:</label>
<select name="ContentClass_ezmedia_type_{$class_attribute.id}">
    <option value="flash" {if eq( $class_attribute.data_text1, 'flash' )}selected="selected"{/if}>{'Flash'|i18n( 'design/standard/class/datatype' )}</option>
    <option value="quick_time" {if eq( $class_attribute.data_text1, 'quick_time' )}selected="selected"{/if}>{'QuickTime'|i18n( 'design/standard/class/datatype' )}</option>
    <option value="real_player" {if eq( $class_attribute.data_text1, 'real_player' )}selected="selected"{/if}>{'RealPlayer'|i18n( 'design/standard/class/datatype' )}</option>
    <option value="silverlight" {if eq( $class_attribute.data_text1, 'silverlight' )}selected="selected"{/if}>{'Silverlight'|i18n( 'design/standard/class/datatype' )}</option>
    <option value="windows_media_player" {if eq( $class_attribute.data_text1, 'windows_media_player' )}selected="selected"{/if}>{'Windows Media Player'|i18n( 'design/standard/class/datatype' )}</option>
</select>
</div>

<div class="block">
<label>{'Max file size'|i18n( 'design/standard/class/datatype' )}:</label>
<input type="text" name="ContentClass_ezmedia_max_filesize_{$class_attribute.id}" value="{$class_attribute.data_int1}" size="5" maxlength="5" />&nbsp;MB
</div>
