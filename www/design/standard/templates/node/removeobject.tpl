{* DO NOT EDIT THIS FILE! Use an override template instead. *}
<form action={concat($module.functions.removeobject.uri)|ezurl} method="post" name="ObjectRemove">

<div class="warning">
<h2>{"Are you sure you want to remove these items?"|i18n("design/standard/node")}</h2>
<ul>
{section name=Result loop=$DeleteResult}
    {section show=$Result:item.childCount|gt(0)}
        <li>{"%nodename and its %childcount children. %additionalwarning"
             |i18n( 'design/standard/node',,
                    hash( '%nodename', $Result:item.nodeName,
                          '%childcount', $Result:item.childCount,
                          '%additionalwarning', $Result:item.additionalWarning ) )}</li>
    {section-else}
        <li>{"%nodename %additionalwarning"
             |i18n( 'design/standard/node',,
                    hash( '%nodename', $Result:item.nodeName,
                          '%additionalwarning', $Result:item.additionalWarning ) )}</li>
    {/section}
{/section}
</ul>
</div>

{section show=$moveToTrashAllowed}
  <input type="hidden" name="SupportsMoveToTrash" value="1" />
  <p><input type="checkbox" name="MoveToTrash" value="1" checked="checked" />{'Move to trash'|i18n('design/standard/node')}</p>

  <p><b>{"Note"|i18n("design/standard/node")}:</b> {"If %trashname is checked you will find the removed items in the trash afterward."
                                                    |i18n( 'design/standard/node',,
                                                           hash( '%trashname', concat( '<i>', 'Move to trash' | i18n( 'design/standard/node' ), '</i>' ) ) )}</p>
  <br/>
{/section}


<div class="buttonblock">
{include uri="design:gui/button.tpl" name=Store id_name=ConfirmButton value="Confirm"|i18n("design/standard/node")}
{include uri="design:gui/defaultbutton.tpl" name=Discard id_name=CancelButton value="Cancel"|i18n("design/standard/node")}
</div>

</form>