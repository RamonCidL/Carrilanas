<?php
require(LIB_DIR . 'BasicController.php');
require(SRC_DIR . 'Equipo.php');
require(SRC_DIR . 'Carrera.php');
require(SRC_DIR . 'Galeria.php');
require(SRC_DIR . 'Miembro.php');
require(SRC_DIR . 'Calendario.php');
require(SRC_DIR . 'CarreraConInscripciones.php');
require(SRC_DIR . 'Usuario.php');
require(SRC_DIR . 'Logger.php');
require(SRC_DIR . 'Inicio.php');
require(SRC_DIR . 'Foto.php');
require(SRC_DIR . 'Rechazo.php');
require(SRC_DIR . 'video.php');
class Controller extends BasicController{
	function __construct() {
		parent::__construct();
		$this->assign('opciones', array(
			'Inicio'=>'inicio',
			'Equipos'=>'equipo',
			'Miembros' =>'miembro',
			'Carreras' =>'carrera',
			'Inscripciones'   => 'carreraConInscripciones',
			'Calendario'=> 'calendario',
			'Fotos' => 'foto',
			'Galeria'=> 'galeria',
			'Videos' => 'video',
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
		case 'foto':
			$object = new Foto;
			break;
			case 'galeria':
			$object = new Galeria; 
			break;
		case 'calendario':
			$object = new Calendario; 
			break;
		case 'video':
			$object = new Video;
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
		if(!isset($_SESSION['nivel_usuario'])){
			$_SESSION['nivel_usuario']=0;
			$_SESSION['nombre_usuario']='';
			$_SESSION['id_usuario']=0;
		}
		if($object->getLevel() > $_SESSION['nivel_usuario']){
			$object = new Rechazo; 
			$this->assign('nivel_usuario',  0); 
		}else{
			$this->assign('id_usuario',     $_SESSION['id_usuario']); 
			$this->assign('nombre_usuario', $_SESSION['nombre_usuario']); 
			$this->assign('nivel_usuario',  $_SESSION['nivel_usuario']); 
		}
		$object->dispatch($this);
	}
}
?>
