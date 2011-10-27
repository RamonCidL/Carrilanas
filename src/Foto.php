<?php
require_once(LIB_DIR .'MasterTable.php');
class Foto extends MasterTable{
	function __construct() {
		$this->table        = 'foto';
		$this->listTable    = '';
		$this->fields= array(
			'titulo'              ,
			'foto'                ,
			'comentario'          ,
			'miembro_id'           
		);
		$this->level = 10;
		parent::__construct();
	}
	function getTable(){
		return '{
			"add"      : "true",
			"edit"     : "true",
			"delete"   : "true",
			"colModel" : [
				{"type":"text", "display": "Título",   "name" : "titulo",   "width" : 150 },
				{"type":"image", "display": "Foto",    "name" : "foto",     "width" : 250 },
				{"type":"textarea", "display": "Comentario", "name" : "comentario", "width" : 250 },
				{"type":"lookup",  "display": "Miembro",     "name" : "miembro_id",   "width" : 250 }
			]
		}';
	}
	function getForm(){
		return '{
			"colModel" : [
				{"type":"text", "display": "Título",   "name" : "titulo",   "width" : 150 },
				{"type":"image", "display": "Foto",    "name" : "foto",     "width" : 250 },
				{
					"type"     : "textarea"     , 
					"display"  : "Comentarios"  ,     
					"value"    : "comentario"   ,     
					"width"    : 50             , 
					"height"   : 2 
				},
				{
					"type"       :"lookup"       , 
					"display"    :"Miembro"      ,   
					"value"      :"miembro_id"   ,
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
		$this->errors= null;
		return true;
	}
}
?>
