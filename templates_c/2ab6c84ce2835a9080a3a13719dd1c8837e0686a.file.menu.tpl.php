<?php /* Smarty version Smarty-3.0.7, created on 2011-10-19 13:04:00
         compiled from "templates\menu.tpl" */ ?>
<?php /*%%SmartyHeaderCode:218094e9eaea0db7b01-77891732%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '2ab6c84ce2835a9080a3a13719dd1c8837e0686a' => 
    array (
      0 => 'templates\\menu.tpl',
      1 => 1318938752,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '218094e9eaea0db7b01-77891732',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<ul id="navigation"> 
<h1>
<table border="0" width="100%">
<tr>
<?php  $_smarty_tpl->tpl_vars['page'] = new Smarty_Variable;
 $_smarty_tpl->tpl_vars['title'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('opciones')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['page']->key => $_smarty_tpl->tpl_vars['page']->value){
 $_smarty_tpl->tpl_vars['title']->value = $_smarty_tpl->tpl_vars['page']->key;
?> 
   <td> 
		<a href="<?php echo $_smarty_tpl->getVariable('SCRIPT_NAME')->value;?>
?view=<?php echo $_smarty_tpl->tpl_vars['page']->value;?>
"> 
			<?php echo $_smarty_tpl->tpl_vars['title']->value;?>

		</a> 
	</td> 
<?php }} ?> 
</tr>
</table>
</h1>
