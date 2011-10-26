<?php
require_once(LIB_DIR .'MasterTable.php');
class Video extends MasterTable{
	function __construct() {
		$this->table        = 'video';
		$this->listTable = 'videoConMiembro';
		$this->fields= array(
			'titulo',
			'video' ,
			'comentario',
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
				{"type":"text", "display": "Video",		"name" : "video",	"width" : 150 },
				{"type":"text", "display": "Comentario", "name" : "comentario", "width" : 250 },
				{"type":"lookup", "display": "Miembro",   "name" : "nombre","width" : 250 }
			]
		}';
	}
	function getForm(){
		return '{
			"colModel" : [
				{"type":"text", "display": "Título",   "value" : "titulo",   "width" : 150 },
				{"type":"text", "display": "Video",		"value" : "video",		"width" : 150 },
				{"type":"text", "display": "Comentario", "value" : "comentario", "width" : 250 },
				
				{
					"type"       :"lookup"      , 
					"display"    :"Miembro"      ,   
					"value"      :"miembro_id"   ,
					"width"      : 5            , 
					"id"         :"idDelMiembro" ,
					"database"   :"carrilana"  ,
					"table"      :"miembro"      ,
					"fieldSearch":"nombre"      ,
					"fieldRet"   :"id"
				},
					{
					"type"       :"external"      ,
					"display"    :"Video"  ,             
					"value"      :"miembro_id"          ,
					"database"   :"carrilana"         ,
					"table"      :"miembro"             ,
					"value_id"   :"miembro_id"          ,
					"fieldRet"   :"nombre"
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
