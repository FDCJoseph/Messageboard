<?php
/**
 * Application model for CakePHP.
 *
 * This file is application-wide model file. You can put all
 * application-wide model-related methods here.
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
 * @package       app.Model
 * @since         CakePHP(tm) v 0.2.9
 * @license       https://opensource.org/licenses/mit-license.php MIT License
 */

App::uses('Model', 'Model');
App::uses('BlowfishPasswordHasher', 'Controller/Component/Auth');

/**
 * Application model for Cake.
 *
 * Add your application-wide methods in the class below, your models
 * will inherit them.
 *
 * @package       app.Model
 */
class User extends AppModel {
    public $useTable = 'msgUsers';
    public $validate = array(
        'name' => array(
            'rule' => array('lengthBetween', 5, 20),
            'message' => 'Name must be 5-20 characters'
        ),
        'email' => array(
            'email' => array(
                'rule' => array('email', true),
                'message' => 'Email is invalid'
            ),
            'unique' => array(
                'rule' => 'isUnique',
                'message' => 'This email is already taken'
            )
        ),
        'password' => array(
            'rule' => 'notBlank',
            'message' => 'Password cannot be empty'
        ),
        'confpassword' => array(
            'compare' => array(
                'rule' => array('comparePasswords', 'password'),
                'message' => 'Passwords do not match'
            )
        ),
        'birthdate' => array(
            'rule' => array('date', 'ymd'),
            'message' => 'Please provide a valid birthdate'
        ),
        'hobby' => array(
            'rule' => 'notBlank',
            'message' => 'Hobby cannot be empty'
        ),
        'gender' => array(
            'rule' => array('inList', array('male', 'female')),
            'message' => 'Please select a valid gender',
            'allowEmpty' => true // Make sure it's not required if it can be empty
        )
    );

    public function beforeSave($options = array()) {
        if (isset($this->data[$this->alias]['password'])) {
            $passwordHasher = new BlowfishPasswordHasher();
            $this->data[$this->alias]['password'] = $passwordHasher->hash(
                $this->data[$this->alias]['password']
            );
        }
        //return true;

        $ipAddress = env('REMOTE_ADDR');

        // If it's a new record, set the created_ip
        if ($this->isNewRecord()) {
            $this->data[$this->alias]['created_ip'] = $ipAddress;
        }

        // Always set the modified_ip
        $this->data[$this->alias]['modified_ip'] = $ipAddress;

        if (!$this->id && !isset($this->data[$this->alias]['last_login_time'])) {
            $this->data[$this->alias]['last_login_time'] = date('Y-m-d H:i:s');
        }

        // Unset the confirm password field so it is not saved to the database
        unset($this->data[$this->alias]['confpassword']);
        return true;
    }

    public function comparePasswords($check, $passwordField) {
        $password = $this->data[$this->alias][$passwordField];
        $confirmPassword = current($check);
        return $password === $confirmPassword;
    }

    public function isNewRecord() {
        return !isset($this->data[$this->alias][$this->primaryKey]);
    }
}