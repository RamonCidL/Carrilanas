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

	function isValidForm($formvars) {
		$this->error = null;
		return true;
	}
}
?>
