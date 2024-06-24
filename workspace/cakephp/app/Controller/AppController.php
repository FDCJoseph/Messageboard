<?php
/**
 * Application level Controller
 *
 * This file is application-wide controller file. You can put all
 * application-wide controller-related methods here.
 *
 * CakePHP(tm) : Rapid Development Framework (https://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (https://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright (c) Cake Software Foundation, Inc. (https://cakefoundation.org)
 * @link          https://cakephp.org CakePHP(tm) Project
 * @package       app.Controller
 * @since         CakePHP(tm) v 0.2.9
 * @license       https://opensource.org/licenses/mit-license.php MIT License
 */

App::uses('Controller', 'Controller');

/**
 * Application Controller
 *
 * Add your application-wide methods in the class below, your controllers
 * will inherit them.
 *
 * @package		app.Controller
 * @link		https://book.cakephp.org/2.0/en/controllers.html#the-app-controller
 */
class AppController extends Controller {
    // this will tell cakek to support php files for the view for rendering
    public $ext = '.php';

    // include the Post Model
    public $uses = array(
        'User'
    );

    public $components = array(
        'Flash',
        'Auth' => array(
            'authenticate' => array(
                'Form' => array(
                    'fields' => array(
                        'username' => 'email',
                        'password' => 'password'
                    ),
                    'passwordHasher' => 'Blowfish'
                )
            ),
            'loginRedirect' => array('controller' => 'Home', 'action' => 'index'),
            'logoutRedirect' => array('controller' => 'Login', 'action' => 'index'),
            'authError' => 'You are not authorized to access that location.',
            'authorize' => array('Controller'),
            'loginAction' => array('controller' => 'Login', 'action' => 'index') // Specify the custom login action
        )
    );

    public function beforeFilter() {
        // Allow access to login and register actions without authentication
        //$this->Auth->deny();
        $this->Auth->allow('Login.index', 'Register.index', 'Register.thankyou');
        //$this->Auth->allow();
        $this->set('authUser', $this->Auth->user()); 
    }

    public function isAuthorized($user) {
        // By default deny access.
        return true;
    }
}
