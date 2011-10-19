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
				'equipo_id',  
				
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
