<?php
class LoginController extends AppController {
    public $uses = array('User');

    public function beforeFilter() {
        parent::beforeFilter();
        $this->Auth->allow('index'); // Allow the login action to be accessed without authentication

        if ($this->Auth->user() && $this->request->action === 'index') {
            return $this->redirect(array('controller' => 'Home', 'action' => 'index'));
        }
    }

    public function index() {
        if ($this->request->is('post')) {
            if ($this->Auth->login()) {
                // Update last_login_time for the user
                $this->User->id = $this->Auth->user('id'); 
                $this->User->saveField('last_login_time', date('Y-m-d H:i:s'));

                // Redirect to a different page after login
                //$this->redirect(array('controller' => 'Home', 'action' => 'index'));
                return $this->redirect($this->Auth->redirectUrl());
            } else {
                $this->Flash->error(__('Invalid username or password, try again'));
            }
        }
    }

    public function logout() {
        $this->Auth->logout();
        $this->Flash->success(__('You have been logged out.'));
        return $this->redirect(array('controller' => 'Login', 'action' => 'index'));
    }
}
