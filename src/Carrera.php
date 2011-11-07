<?php
require_once(LIB_DIR .'MasterTable.php');
class Carrera extends MasterTable{
	function __construct() {
		$this->table        = 'carrera';
	    $this->fields= array(
				'lugar', 
				'fecha', 
				'distancia', 
				'mapaRecorrido', 
				'nombre'
				
				
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
				
				{"type":"text",		"display": "Lugar",             "name" : "lugar",           "width" : 150 },
				{"type":"date",		"display": "Fecha",             "name" : "fecha",           "width" : 250 },
				{"type":"text",		"display": "Distancia",         "name" : "distancia",       "width" : 250 },
				{"type":"image",	"display": "Mapa",				"name" : "mapaRecorrido",   "width" : 250 },
				{"type":"text",		"display": "nombre",       		"name" : "nombre",      	"width" : 250 }
				
		}';
		return $ret;
	}
	function getForm(){
		return '{
			"colModel" : [
				{"type":"text",  "display": "Lugar",             "value" : "lugar",   		    "width" : 150 },
				{"type":"date",  "display": "Fecha",    	     "value" : "fecha",             "width" : 250 },
				{"type":"text",  "display": "Distancia",         "value" : "distancia",    	    "width" : 25 },
				{"type":"image", "display": "Mapa recorrido",    "value" : "mapaRecorrido",     "width" : 25 },
				{"type":"text",  "display": "nombre",       	 "value" : "nombre",   	    	"width" : 25 }
				
				
			]
		}';
	}

	function isValidForm($formvars) {
		$this->error = null;
		return true;
	}
}
?>
