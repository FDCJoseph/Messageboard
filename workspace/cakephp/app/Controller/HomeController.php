<?php
class HomeController extends AppController {
	public $uses = array();

	public function index (){
		$user = $this->Auth->user();
        $this->set('user', $user);
	}
}