<?php

class RegisterController extends AppController {
    public $uses = ['User'];

    public function beforeFilter() {
        parent::beforeFilter();
        $this->Auth->allow('index', 'thankyou'); // Allow registration actions

        if ($this->Auth->user() && $this->request->action === 'index') {
            return $this->redirect(array('controller' => 'Home', 'action' => 'index'));
        }
        if ($this->Auth->user() && $this->request->action === 'thankyou') {
            return $this->redirect(array('controller' => 'Home', 'action' => 'index'));
        }
    }

    public function index (){
        if ($this->request->is('post')) {
            $this->User->create();
            if ($this->User->save($this->request->data)) {
                $this->Flash->success(__('The user has been saved'));
                return $this->redirect(array('controller' => 'Register', 'action' => 'thankyou'));
            } else {
                // Retrieve validation errors
                $errors = $this->User->validationErrors;
                $this->Flash->error(
                    __('The user could not be saved. Please, try again.')
                );
                // Optionally set validation errors to the view to display
                $this->set('errors', $errors);
            }
        }
    }

    public function thankyou (){

    }
}
