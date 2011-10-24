<?php
require_once(LIB_DIR .'MasterTable.php');
class Miembro extends MasterTable{
	function __construct() {
		$this->table        = 'miembro';
		$this->formTemplate = 'miembroForm.tpl';
		$this->listTemplate = 'miembroList.tpl';
		$this->fields= array(
				'nombre', 
				'foto', 
				'password', 
				'telefono',
				'correo',
				'equipo_id'  
				
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
				{"display": "Contraseña",      "name" : "password",       "width" : 150 },
				{"display": "Teléfono",        "name" : "telefono",       "width" : 250 },
				{"display": "Correo",      	   "name" : "correo",         "width" : 250 },
				{"display": "Equipo",          "name" : "equipo_id",      "width" : 250 }
				
			]
		}';
		return $ret;
	}
	function getForm(){
		return '{
			"colModel" : [
				{"type":"text",     "display": "Nombre",   "value" : "nombre","width" : 150 },
				{"type":"image",    "display": "Foto",     "value" : "foto","width" : 25 },
				{"type":"password", "display": "Password", "value" : "password","width" : 25 },
				{"type":"text",     "display": "Telefono", "value" : "telefono","width" : 25 },
				{"type":"text",     "display": "Correo",   "value" : "correo","width" : 25 },
				{
					"type"       :"lookup"       , 
					"display"    :"Equipo"      ,   
					"value"      :"equipo_id"   ,
					"width"      : 5             , 
					"id"         :"id" ,
					"database"   :"carrilana"   ,
					"table"      :"equipo"      ,
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
