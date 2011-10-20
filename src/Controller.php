<?php
require(LIB_DIR . 'BasicController.php');




require(SRC_DIR . 'Equipo.php');
require(SRC_DIR . 'Carrera.php');
require(SRC_DIR . 'Miembro.php');
require(SRC_DIR . 'Usuario.php');
require(SRC_DIR . 'Logger.php');
require(SRC_DIR . 'Inicio.php');
require(SRC_DIR . 'Rechazo.php');
class Controller extends BasicController{
	function __construct() {
		parent::__construct();
		$this->assign('opciones', array(
			'Inicio'=>'inicio',
			'Equipos'=>'equipo',
			'Carreras' =>'carrera',
			'Miembros' =>'miembro',
			'Usuarios'=>'usuario',
			'Login'=>'login',
			'Logout'=>'logout'
		));
	}
	function dispatch(){
		if(isset($_SESSION['view'])){
			$this->view = $_SESSION['view'];	
		}
		if(isset($_REQUEST['view'])){
			$this->view= $_REQUEST['view']; 
			$_SESSION['view'] = $this->view;
			//decide cambiar o no de vista, segun permisos
		}
		switch($this->view){
		case 'equipo':
			$object = new Equipo;
			break;
		case 'carrera':
			$object = new Carrera;
			break;
		case 'miembro':
			$object = new Miembro;
			break;
		
		case 'usuario':
			$object = new Usuario; 
			break;
		case 'login':
			$object = new Logger; 
			if($object->login($this)){
				$object = new Inicio; 
			}
			break;
		case 'logout':
			$object = new Logger; 
			$object->logout();
			$object = new Inicio; 
			break;
		case 'inicio':
		default:
			$object = new Inicio; 
			break;
		}
		if(!isset($_SESSION['nivel'])){
			$_SESSION['nivel']=0;
		}
		if($object->getLevel() > $_SESSION['nivel']){
			$object = new Rechazo; 
			$this->assign('nivel_usuario',  0); 
		}else{
			$this->assign('id_usuario',     $_SESSION['id']); 
			$this->assign('nombre_usuario', $_SESSION['nombre']); 
			$this->assign('nivel_usuario',  $_SESSION['nivel']); 
		}
		$object->dispatch($this);
	}
}
?>
