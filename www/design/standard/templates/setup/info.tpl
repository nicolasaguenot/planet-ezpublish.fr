{* DO NOT EDIT THIS FILE! Use an override template instead. *}
<h1>{'System information'|i18n('design/standard/setup')}</h1>

<div class="objectheader">
    <h2>eZ Publish</h2>
</div>
<div class="object">
    <table width="500">
    <tr>
        <td><p><b>{'Site'|i18n('design/standard/setup')}:</b></p></td><td><p>{ezini('SiteSettings','SiteURL')}</p></td>
    </tr>
    <tr>
        <td><p><b>{'Version'|i18n('design/standard/setup','eZ Publish version')}</b></p></td><td><p>{$ezpublish_version}</p></td>
    </tr>
    <tr>
        <td><p><b>{'SVN revision'|i18n('design/standard/setup','eZ Publish version')}</b></p></td><td><p>{$ezpublish_revision}</p></td>
    </tr>
    <tr>
        <td><p><b>{'Extensions'|i18n('design/standard/setup','eZ Publish extensions')}</b></p></td>
        <td>
            <p>
                {section loop=$ezpublish_extensions}{$:item}{delimiter}, {/delimiter}{/section}
            </p>
        </td>
    </tr>
    </table>
</div>

<div class="objectheader">
    <h2>PHP</h2>
</div>
<div class="object">
    <table width="100%">
    <tr>
        <td><p><b>{'Version'|i18n('design/standard/setup','PHP version')}</b></p></td><td><p>{$php_version}</p></td>
    </tr>
    <tr>
        <td><p><b>{'Extensions'|i18n('design/standard/setup','PHP extensions')}</b></p></td>
        <td>
            <p>
                {section loop=$php_loaded_extensions}{$:item}{delimiter}, {/delimiter}{/section}
            </p>
        </td>
    </tr>
    </table>
    <p>
        {if $php_ini.safe_mode}
            {'Safe mode is on.'|i18n('design/standard/setup')}<br/>
        {else}
            {'Safe mode is off.'|i18n('design/standard/setup')}<br/>
        {/if}
        {if $php_ini.open_basedir}
            {'Basedir restriction is on and set to %1.'|i18n('design/standard/setup',,array($php_ini.open_basedir))}<br/>
        {else}
            {'Basedir restriction is off.'|i18n('design/standard/setup')}<br/>
        {/if}
        {if $php_ini.register_globals}
            {'Global variable registration is on.'|i18n('design/standard/setup')}<br/>
        {else}
            {'Global variable registration is off.'|i18n('design/standard/setup')}<br/>
        {/if}
        {if $php_ini.file_uploads}
            {'File uploading is enabled.'|i18n('design/standard/setup')}<br/>
        {else}
            {'File uploading is disabled.'|i18n('design/standard/setup')}<br/>
        {/if}
        {'Maximum size of post data (text and files) is %1.'|i18n('design/standard/setup',,array($php_ini.post_max_size))}<br/>
        {'Script memory limit is %1.'|i18n('design/standard/setup',,array($php_ini.memory_limit))}<br/>
        {'Maximum execution time is %1 seconds.'|i18n('design/standard/setup',,array($php_ini.max_execution_time))}<br/>
    </p>
</div>

<div class="objectheader">
    <h2>{'Web server'|i18n( 'design/standard/setup', 'Web server title' )}</h2>
</div>
<div class="object">
    {section show=$webserver_info}
        <table width="100%">
        <tr>
            <td><p><b>{'Name'|i18n('design/standard/setup','Web server name')}</b></p></td><td><p>{$webserver_info.name}</p></td>
        </tr>
        <tr>
            <td><p><b>{'Version'|i18n('design/standard/setup','Web server version')}</b></p></td><td><p>{$webserver_info.version}</p></td>
        </tr>
        {section show=$webserver_info.modules}
            <tr>
                <td><p><b>{'Modules'|i18n('design/standard/setup','Web server modules')}</b></p></td>
                <td>
                    <p>
                        {section loop=$webserver_info.modules}{$:item}{delimiter}, {/delimiter}{/section}
                    </p>
                </td>
            </tr>
        {section-else}
            <tr>
                <td colspan="2"><p>{'Web server modules could not be detected'|i18n('design/standard/setup','Web server modules')}</p></td>
            </tr>
        {/section}
        </table>
    {section-else}
        <p>{'No known information on the web server'|i18n( 'design/standard/setup' )}</p>
    {/section}
</div>

<div class="objectheader">
    <h2>PHP Accelerator</h2>
</div>
<div class="object">
{if $php_accelerator}
    <table width="100%">
    <tr>
        <td><p><b>{'Name'|i18n('design/standard/setup','PHP Accelerator name')}</b></p></td><td><p>{if $php_accelerator.url}<a href="{$php_accelerator.url|wash}">{/if}{$php_accelerator.name|wash}{if $php_accelerator.url}</a>{/if}</p></td>
    </tr>
    <tr>
        <td><p><b>{'Version'|i18n('design/standard/setup','PHP Accelerator version')}</b></p></td><td><p>{if $php_accelerator.version_string}{$php_accelerator.version_string|wash}{else}{'Could not detect version'|i18n('design/standard/setup')}{/if}</p></td>
    </tr>
    </table>
    <p>
        {if $php_accelerator.enabled}
            {'The PHP Accelerator is enabled.'|i18n('design/standard/setup')}<br/>
        {else}
            {'The PHP Accelerator is disabled.'|i18n('design/standard/setup')}<br/>
        {/if}
    </p>
{else}
    <p>
            {'There is no known PHP accelerator active.'|i18n('design/standard/setup')}<br/>
    </p>
{/if}
</div>

<div class="objectheader">
    <h2>{'Database'|i18n('design/standard/setup')}</h2>
</div>
<div class="object">
    <table width="500">
    <tr>
        <td width="1"><p><b>{'Type'|i18n('design/standard/setup','Database type')}</b></p></td>
                <td><p>{$database_info}</p></td>
    </tr>
    <tr>
        <td width="1"><p><b>{'Server'|i18n('design/standard/setup','Database server')}</b></p></td>
                <td><p>{$database_object.database_server}</p></td>
    </tr>
        {if $database_object.database_socket_path}
    <tr>
        <td width="1"><p><b>{'Socket path'|i18n('design/standard/setup','Database socket path')}</b></p></td>
                <td><p>{$database_object.database_socket_path}</p></td>
    </tr>
        {/if}
    <tr>
        <td width="1"><p><b>{'Database'|i18n('design/standard/setup','Database name')}</b></p></td>
                <td><p>{$database_object.database_name}</p></td>
    </tr>
    <tr>
        <td width="1"><p><b>{'Connection retry count'|i18n('design/standard/setup','Database retry count')}</b></p></td>
                <td><p>{$database_object.retry_count}</p></td>
    </tr>
    <tr>
        <td width="1"><p><b>{'Charset'|i18n('design/standard/setup','Database charset')}</b></p></td>
                <td><p>{$database_charset|wash}{if $database_object.is_internal_charset} ({'Internal'|i18n('design/standard/setup')}){/if}</p></td>
    </tr>
    </table>
</div>

<div class="objectheader">
    <h2>{'Operating System'|i18n('design/standard/setup')}</h2>
</div>
<div class="object">
    {if $system_info.is_valid}
    <table width="500">
    <tr>
        <td width="1"><p><b>{'CPU'|i18n('design/standard/setup','Database type')}</b></p></td>
                <td><p>{$system_info.cpu_type} {$system_info.cpu_speed} {$system_info.cpu_unit}</p></td>
    </tr>
    <tr>
        <td width="1"><p><b>{'Memory'|i18n('design/standard/setup','Database server')}</b></p></td>
                <td><p>{$system_info.memory_size|si( byte )}</p></td>
    </tr>
    </table>
    {else}
        <p>{'No information on the operating system could be determined.'|i18n( 'design/standard/setup' )}</p>
    {/if}
</div>

{if $database_object.use_slave_server}
<div class="objectheader">
    <h2>{'Current read-only database (Slave)'|i18n('design/standard/setup')}</h2>
</div>
<div class="object">
    <table width="500">
    <tr>
        <td width="1"><p><b>{'Server'|i18n('design/standard/setup','Database server')}</b></p></td>
                <td><p>{$database_object.slave_database_server}</p></td>
    </tr>
    <tr>
        <td width="1"><p><b>{'Database'|i18n('design/standard/setup','Database name')}</b></p></td>
                <td><p>{$database_object.slave_database_name}</p></td>
    </tr>
        </table>
</div>
{/if}

