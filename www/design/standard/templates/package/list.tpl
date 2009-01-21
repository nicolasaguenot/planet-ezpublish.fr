{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{let page_limit=15
     package_list=fetch( package, list,
                         hash( offset, $view_parameters.offset,
                               limit, $page_limit,
                               repository_id, $repository_id ) )
     repository_list=fetch( package, repository_list )
     can_remove=fetch( package, can_remove )}
<form method="post" action={concat('package/list',
                            $view_parameters.offset|gt(0)
                            |choose('',
                                    concat('/offset/',$view_parameters.offset)))|ezurl}>

{section show=$remove_list}

<div class="warning">
<h2>{'Removal of packages'|i18n('design/standard/package')}</h2>
<p>{'Are you sure you want to remove the following packages?
The packages will be lost forever.
Note: The packages will not be uninstalled.'|i18n('design/standard/package')|break}</p>
<ul>
{section var=package loop=$remove_list}
    <li>
        <input type="hidden" name="PackageSelection[]" value="{$package.name|wash}" />
        {$package.name|wash} ({$package.summary|wash})
    </li>
{/section}
</ul>
</div>

<div class="buttonblock">
    <input class="button" type="submit" name="ConfirmRemovePackageButton" value="{'Confirm removal'|i18n('design/standard/package')}" />
    <input class="defaultbutton" type="submit" name="CancelRemovePackageButton" value="{'Keep packages'|i18n('design/standard/package')}" />
</div>

{section-else}

<h2>{'Packages'|i18n('design/standard/package')}</h2>

{section show=$module_action|eq( 'CancelRemovePackage' )}
<div class="feedback">
    <p>{'Package removal was canceled.'|i18n('design/standard/package')}</p>
</div>
{/section}


<p>{'The following packages are available on this system'|i18n('design/standard/package')}</p>

<label>{'Repositories'|i18n( 'design/standard/package' )}</label>
<select name="RepositoryID">
    <option value="">{'All'|i18n( 'design/standard/package' )}</option>
{section var=repository loop=$repository_list}
    <option value="{$repository.id|wash}"{section show=eq( $repository.id, $repository_id )} selected="selected"{/section}>{$repository.name|wash}</option>
{/section}
</select>
&nbsp;<input type="submit" name="ChangeRepositoryButton" value="{'Change repository'|i18n( 'design/standard/package' )}" />

<table class="list" width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
    {section show=$can_remove}
    <th width="1">{'Selection'|i18n('design/standard/package')}</th>
    {/section}
    <th>{'Name'|i18n('design/standard/package')}</th>
    <th>{'Version'|i18n('design/standard/package')}</th>
    <th>{'Summary'|i18n('design/standard/package')}</th>
    <th>{'Status'|i18n('design/standard/package')}</th>
</tr>
{section name=Package loop=$package_list sequence=array(bglight,bgdark)}
<tr class="{$:sequence}">
    {section show=$can_remove}
    <td width="1">{section show=$:item.is_local}<input type="checkbox" name="PackageSelection[]" value="{$:item.name|wash}" />{/section}</td>
    {/section}
    <td><a href={concat('package/view/full/',$:item.name)|ezurl}>{$:item.name|wash}</a></td>
    <td>{$:item.version-number}-{$:item.release-number}{section show=$:item.release-timestamp}({$:item.release-timestamp|l10n( shortdatetime )}){/section}{section show=$:item.type} [{$:item.type|wash}]{/section}</td>
    <td>{$:item.summary|wash}</td>
    <td>
        {section show=$:item.install_type|eq( 'install' )}
            {section show=$:item.is_installed}
                {'Installed'|i18n('design/standard/package')}
            {section-else}
                {'Not installed'|i18n('design/standard/package')}
            {/section}
        {section-else}
            {'Imported'|i18n('design/standard/package')}
        {/section}
    </td>
</tr>
{/section}
{section show=and( $package_list|gt( 0 ),
                   $can_remove )}
<tr>
    <td colspan="5">
    <div class="buttonblock">
        <input class="button" type="submit" name="RemovePackageButton" value="{'Remove package'|i18n('design/standard/package')}" />
    </div>
    </td>
</tr>
{/section}
</table>

{let can_create=fetch( package, can_create )
     can_import=fetch( package, can_import )}

<div class="buttonblock">
{section show=$can_import}
    <input class="button" type="submit" name="InstallPackageButton" value="{'Import package'|i18n('design/standard/package')}" />
{/section}
{section show=$can_create}
    <input class="button" type="submit" name="CreatePackageButton" value="{'Create package'|i18n('design/standard/package')}" />
{/section}
</div>

{/let}


{/section}


</form>

{/let}