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

	function isValidForm($formvars) {
		$this->error = null;
		return true;
	}
}
?>
