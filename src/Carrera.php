<?php
require_once(LIB_DIR .'MasterTable.php');
class Carrera extends MasterTable{
	function __construct() {
		$this->table        = 'carrera';
		$this->formTemplate = 'carreraForm.tpl';
		$this->listTemplate = 'carreraList.tpl';
		$this->fields= array(
				'lugar', 
				'fecha', 
				'distancia', 
				'mapaRecorrido', 
				'comoLlegar',
				'prediccionTiempo',
				'comentario',
				
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
				
				{"display": "lugar",            "name" : "lugar",           "width" : 150 },
				{"display": "Fecha",            "name" : "fecha",           "width" : 250 },
				{"display": "Distancia",        "name" : "distancia",       "width" : 250 },
				{"display": "MapaRecorrido",    "name" : "Maparecorrido",   "width" : 250 },
				{"display": "ComoLlegar",       "name" : "comollegar",      "width" : 250 },
				{"display": "PrediccionTiempo", "name" : "predicciontiempo","width" : 250 },
				{"display": "Comentario",       "name" : "comentario",      "width" : 250 }
			]
		}';
		return $ret;
	}
	function getForm(){
		return '{
			"colModel" : [
				{"type":"text",  "display": "Lugar",           "value" : "lugar",   		  "width" : 150 },
				{"type":"date",  "display": "Fecha",    	   "value" : "fecha",             "width" : 250 },
				{"type":"text",  "display": "Distancia",       "value" : "distancia",    	  "width" : 25 },
				{"type":"image", "display": "Mapareccorido",   "value" : "maparecorrido",     "width" : 25 }
				{"type":"text",  "display": "MComoLlegar",     "value" : "comollegar",   	  "width" : 25 },
				{"type":"text",  "display": "PrediccionTiempo","value" : "predicciontiempo",  "width" : 25 },
				{
					"type"     : "textarea"     , 
					"display"  : "Comentarios"  ,     
					"value"    : "comentario"   ,     
					"width"    : 50             , 
					"height"   : 2 
				},
				
			]
		}';
	}

	function isValidForm($formvars) {
		$this->error = null;
		return true;
	}
}
?>
