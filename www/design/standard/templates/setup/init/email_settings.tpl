{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{*?template charset=latin1?*}
<div align="center">
  <h1>{"Outgoing Email"|i18n("design/standard/setup/init")}</h1>
</div>

<p>
  {"This section is used to configure how eZ Publish delivers its outgoing Email."|i18n("design/standard/setup/init")}
</p>

{section show=eq($system.type,"unix")}
<p>
{"There are two options:<br>- Direct delivery through transfer agent (must be available on the server).<br>- Indirect delivery using an SMTP relay server."|i18n("design/standard/setup/init")}
{* {"You can choose from either"|i18n("design/standard/setup/init")} <i>{"sendmail"|i18n("design/standard/setup/init")}</i> {"which must be available on the server or"|i18n("design/standard/setup/init")} <i>{"SMTP"|i18n("design/standard/setup/init")}</i> {"which will relay the emails. If unsure what to use, ask your webhost. Some webhosts do not support"|i18n("design/standard/setup/init")} <i>{"sendmail"|i18n("design/standard/setup/init")}</i>. *}
</p>
{section-else}
<p>
{"SMTP is recommended for MS Windows users."|i18n("design/standard/setup/init")}
</p>
{/section}

<p>

<form method="post" action="{$script}">
<fieldset>
<legend>{"Email delivery"|i18n("design/standard/setup/init")}:</legend>
<table cellspacing="3" cellpadding="0" border="0">
{section show=eq($system.type,"unix")}
<tr>
  <td class="normal">
    <input type="radio" id="eZSetupEmailMTA" name="eZSetupEmailTransport" value="1" {section show=eq( $email_info.type, 1 )}checked="checked"{/section} /></td>
    <td class="normal"><label class="radio" for="eZSetupEmailMTA">{"Sendmail/MTA"|i18n("design/standard/setup/init")}</label>
  </td>
</tr>
{/section}
<tr>
  <td class="normal">
    {section show=eq($system.type,"unix")}
      <input type="radio" id="eZSetupEmailSMTP" name="eZSetupEmailTransport" value="2" {section show=eq( $email_info.type, 2 )}checked="checked"{/section} /></td>
    {section-else}
      <input type="hidden" name="eZSetupEmailTransport" value="2" /></td>
    {/section}
    <td class="normal"><label class="radio" for="eZSetupEmailSMTP">{"SMTP"|i18n("design/standard/setup/init")}</label>
  </td>
</tr>
<tr>
  <td></td><td class="normal"><label for="eZSetupSMTPServer" class="textfield">{"Server name: "|i18n("design/standard/setup/init")}</label></td>
  <td class="normal"><input type="text" size="25" id="eZSetupSMTPServer" name="eZSetupSMTPServer" value="{$email_info.server|wash}"></td>
</tr>
<tr>
  <td></td><td class="normal"><label for="eZSetupSMTPUser" class="textfield">{"Username (optional): "|i18n("design/standard/setup/init")}</label></td>
  <td class="normal"><input type="text" size="25" id="eZSetupSMTPUser" name="eZSetupSMTPUser" value="{$email_info.user|wash}"></td>
</tr>
<tr>
  <td></td><td class="normal"><label for="eZSetupSMTPPassword" class="textfield">{"Password (optional): "|i18n("design/standard/setup/init")}</label></td>
  <td class="normal"><input type="password" size="25" id="eZSetupSMTPPassword" name="eZSetupSMTPPassword" value="{$email_info.password|wash}"></td>
</tr>
</table>
</fieldset>

  {include uri='design:setup/init/navigation.tpl'}
  {include uri='design:setup/persistence.tpl'}
</form>

</p>
