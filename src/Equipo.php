<?php
require_once(LIB_DIR .'MasterTable.php');
class Equipo extends MasterTable{
	function __construct() {
		$this->table        = 'equipo';
		$this->formTemplate = 'equipoForm.tpl';
		$this->listTemplate = 'equipoList.tpl';
		$this->fields= array(
				'nombre', 
				'foto', 
				'comentario', 
				'categoria_id',  
				
		);
		$this->level = 1;
		parent::__construct();
	}
	function getTable(){
		$ret = '{' ;
		if($_SESSION['nivel'] > 5){
			$ret .= ' "add"      : "true"';
			$ret .= ',"edit"     : "true"';
			$ret .= ',"delete"   : "true"';
		}else{
			$ret .= ' "add"      : "false"';
			$ret .= ',"edit"     : "false"';
			$ret .= ',"delete"   : "false"';
		}
		$ret .= ',
			"colModel" : [
				
				{"display": "Nombre",          "name" : "nombre",         "width" : 150 },
				{"display": "Foto",            "name" : "foto",           "width" : 250 },
				{"display": "Comentario",      "name" : "comentario",     "width" : 250 },
				{"display": "Categoria",       "name" : "categoria_id",   "width" : 250 }
				
			]
		}';
		return $ret;
	}
	function getForm(){
		return '{
			"colModel" : [
				{"type":"text", "display": "Nombre",   "value" : "nombre",   "width" : 150 },
				{"type":"image", "display": "Foto", "value" : "foto","width" : 25 },
				{
					"type"     : "textarea"     , 
					"display"  : "Comentarios"  ,     
					"value"    : "comentario"   ,     
					"width"    : 50             , 
					"height"   : 2 
				},
				{
					"type"       :"lookup"       , 
					"display"    :"Categoria"      ,   
					"value"      :"categoria_id"   ,
					"width"      : 5             , 
					"id"         :"idDelUsuario" ,
					"database"   :"carrilana"   ,
					"table"      :"categoria"      ,
					"fieldSearch":"nombre"       ,
					"fieldRet"   :"id"
				}
			]
		}';
	}

	function isValidForm($formvars) {
		$this->error = null;
		return true;
	}
}
?>
