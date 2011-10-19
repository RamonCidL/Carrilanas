{* Smarty *}

{include file="header.tpl"}
{include file="menu.tpl"}
<td><a href="{$SCRIPT_NAME}?action=close&view=menu"  >
	<button>&uarr;</button>
</a>
</td>
<table border="0" >
	<th bgcolor="#d1d1d1">&nbsp;</th>
	<th bgcolor="#d1d1d1">id     </th>
	<th bgcolor="#d1d1d1">Lugar </th>
	<th bgcolor="#d1d1d1">Fecha</th>
	<th bgcolor="#d1d1d1">Distancia    </th>
	<th bgcolor="#d1d1d1">MapaRecorrido</th>
	<th bgcolor="#d1d1d1">ComoLlegar</th>
	<th bgcolor="#d1d1d1">PredicciónTiempo    </th>
	<th bgcolor="#d1d1d1">Comentario</th>
	<th bgcolor="#d1d1d1">&nbsp;</th>
	<th bgcolor="#d1d1d1">&nbsp;</th>
	{foreach from=$records item="record"}
    <tr bgcolor="{cycle values="#dedede,#eeeeee" advance=true}">
        <td><a href="{$SCRIPT_NAME}?action=open&view=inscrito&id={$record.id}&masterId={$record.id}"  >
			<button>&darr;</button>
			</a>
		</td>
		<tr bgcolor="{cycle values="#dedede,#eeeeee" advance=true}">
        <td><a href="{$SCRIPT_NAME}?action=open&view=llegada&id={$record.id}&masterId={$record.id}"  >
			<button>&darr;</button>
			</a>
		</td>
		<td>
			{$record.id|escape}
		</td>        
		<td>
			{$record.lugar|escape}
		</td>        
		<td>
			{$record.fecha|escape}
		</td>        
		<td>
			{$record.distancia|escape}
		</td>        
		<td>
			{$record.mapaRecorrido|escape}
		</td> 
		<td>
			{$record.comoLlegar|escape}
		</td>        
		<td>
			{$record.prediccionTiempo|escape}
		</td>        
		<td>
			{$record.comentario|escape}
		</td>        
	      
        <td><a href="{$SCRIPT_NAME}?action=edit&id={$record.id}"  >
			<button>.</button></a>
		</td>
        <td><a href="{$SCRIPT_NAME}?action=delete&id={$record.id}">
			<button>X</button></a>
		</td>
	</tr>
    {foreachelse}
      <tr>
        <td colspan="2">No hay datos</td>
      </tr>
  {/foreach}
</table>
<table border="0">
	<tr>
		<td>
			<a href="{$SCRIPT_NAME}?action=goFirst">
				<button>&#124;&lt;</button></a>
			</a>
		</td>
		<td>
			<a href="{$SCRIPT_NAME}?action=goPrev">
				<button>&lt;</button></a>
			</a>
		</td>
		<td>
			<a href="{$SCRIPT_NAME}?action=goNext">
				<button>&gt;</button></a>
			</a>
		</td>
		<td>
			<a href="{$SCRIPT_NAME}?action=goLast">
				<button>&gt;&#124;</button></a>
			</a>
		</td>
		<td>
			<a href="{$SCRIPT_NAME}?action=add&view=equipo">
				<button>+</button></a>
			</a>
		</td>
	</tr>
</table>
{include file="footer.tpl"}
