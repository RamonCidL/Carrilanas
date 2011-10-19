{* Smarty *}
{include file="header.tpl"}
{include file="menu.tpl"}
<form action="{$SCRIPT_NAME}?action=submit" method="post">
  <table border="0">
    {if $error ne ""}
      <tr>
      <td bgcolor="yellow" colspan="2">
      {if $error eq "nombre_empty"}
	  	Se necesita un nombre
      {elseif $error eq "apellidos_empty"}
	  	Los apellidos no pueden estar vacíos 
      {elseif $error eq "dni_empty"}
	  	El DNI no puede estar vacío 
      {elseif $error eq "telefono_empty"}
	  	El teléfono no puede estar vacío 
      {/if}
      </td>
      </tr>
    {/if}
  </table>

  Nombre: 
  <input 
	  type="text" 
	  name="nombre" 
	  value="{$formVars.nombre|escape}" 
  >
  <br />
  Foto: 
  <input 
	  type="text" 
	  name="foto" 
	  value="{$formVars.foto|escape}" 
  >
  <br />
  Password:
  <input 
	  type="text" 
	  name="password" 
	  value="{$formVars.password|escape}" 
  >
  <br />
  Teléfono:
  <input 
	  type="text" 
	  name="telefono" 
	  value="{$formVars.telefono|escape}" 
  >
  <br />
  Correo:
  <input 
	  type="text" 
	  name="correo" 
	  value="{$formVars.correo|escape}" 
  >
  <br />
  Equipo:
  <input 
	  type="text" 
	  name="equipo" 
	  value="{$formVars.equipo|escape}" 
  >
  <br />
  <br />
  <input type="submit" value="Submit">
  <input type="hidden" name="id" value="{$formVars.id}" />
</form>
{include file="footer.tpl"}
