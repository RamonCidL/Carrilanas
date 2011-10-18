<?php /* Smarty version Smarty-3.0.7, created on 2011-10-10 12:20:05
         compiled from "templates\usuarioForm.tpl" */ ?>
<?php /*%%SmartyHeaderCode:224604e92c6d5a7dbf6-16303296%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '5a5d85af5966ed1d1a886c928e0dc4cf13ec60d8' => 
    array (
      0 => 'templates\\usuarioForm.tpl',
      1 => 1318142152,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '224604e92c6d5a7dbf6-16303296',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<?php if (!is_callable('smarty_modifier_escape')) include 'smarty/plugins\modifier.escape.php';
?>

<?php $_template = new Smarty_Internal_Template("header.tpl", $_smarty_tpl->smarty, $_smarty_tpl, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null);
 echo $_template->getRenderedTemplate();?><?php unset($_template);?>
<?php $_template = new Smarty_Internal_Template("menu.tpl", $_smarty_tpl->smarty, $_smarty_tpl, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null);
 echo $_template->getRenderedTemplate();?><?php unset($_template);?>
<form action="<?php echo $_smarty_tpl->getVariable('SCRIPT_NAME')->value;?>
?action=submit" method="post">
  <table border="1">
    <?php if ($_smarty_tpl->getVariable('error')->value!=''){?>
      <tr>
      <td bgcolor="yellow" colspan="2">
      <?php if ($_smarty_tpl->getVariable('error')->value=="nombre_empty"){?>
	  	El nombre está vacío
      <?php }elseif($_smarty_tpl->getVariable('error')->value=="password_empty"){?> 
	   	La clave no puede estar vacía
      <?php }elseif($_smarty_tpl->getVariable('error')->value=="nivel_empty"){?> 
	   	El nivel no puede estar vacío
      <?php }?>
      </td>
      </tr>
    <?php }?>
  </table>

  Nombre:
  <input 
	  type="text" 
	  name="nombre" 
	  value="<?php echo smarty_modifier_escape($_smarty_tpl->getVariable('formVars')->value['nombre']);?>
" 
  >
  <br />
  Password: 
  <input 
	  type="password" 
	  name="password" 
	  value="<?php echo smarty_modifier_escape($_smarty_tpl->getVariable('formVars')->value['password']);?>
" 
  >
  <br />
  Nivel: 
  <input 
	  type="text" 
	  name="nivel" 
	  value="<?php echo smarty_modifier_escape($_smarty_tpl->getVariable('formVars')->value['nivel']);?>
" 
  >
  <br />
  <input type="submit" value="Submit">
  <input type="hidden" name="id" value="<?php echo $_smarty_tpl->getVariable('id')->value;?>
" />
</form>
<?php $_template = new Smarty_Internal_Template("footer.tpl", $_smarty_tpl->smarty, $_smarty_tpl, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null);
 echo $_template->getRenderedTemplate();?><?php unset($_template);?>
