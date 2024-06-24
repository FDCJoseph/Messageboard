<?php
App::uses('AppModel', 'Model');

class NewMsg extends AppModel {
    public $useTable = 'newMsg';
    public $primaryKey = 'msg_id';

    public function beforeSave($options = array()) {
        $ipAddress = env('REMOTE_ADDR');

        // Check if it's a new record by verifying the presence of 'id' in the data
        if (empty($this->data[$this->alias]['id'])) {
            $this->data[$this->alias]['created_ip'] = $ipAddress;
        }

        // Always set the modified_ip
        $this->data[$this->alias]['modified_ip'] = $ipAddress;

        return true;
    }
}
?>
