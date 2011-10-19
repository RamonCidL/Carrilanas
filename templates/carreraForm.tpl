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

  Lugar: 
  <input 
	  type="text" 
	  name="lugar" 
	  value="{$formVars.lugar|escape}" 
  >
  <br />
  Fecha: 
  <input 
	  type="text" 
	  name="fecha" 
	  value="{$formVars.fecha|escape}" 
  >
  <br />
  Distancia: 
  <input 
	  type="text" 
	  name="distancia" 
	  value="{$formVars.distancia|escape}" 
  >
  <br />
  MapaRecorrido: 
  <input 
	  type="text" 
	  name="mapaRecorrido" 
	  value="{$formVars.mapaRecorrido|escape}" 
  >
  <br />
  ComoLlegar: 
  <input 
	  type="text" 
	  name="comoLlegar" 
	  value="{$formVars.comoLlegar|escape}" 
  >
  <br />
  PredicciónTiempo: 
  <input 
	  type="text" 
	  name="prediccionTiempo" 
	  value="{$formVars.prediccionTiempo|escape}" 
  >
  <br />
  Comentario:
  <textarea name="comentario" >
	  {$formVars.dni|escape}
  </textarea>
  <br />
  
  
  <br />
  <input type="submit" value="Submit">
  <input type="hidden" name="id" value="{$formVars.id}" />
</form>
{include file="footer.tpl"}
