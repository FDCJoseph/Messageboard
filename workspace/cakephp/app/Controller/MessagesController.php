<?php
App::uses('AppController', 'Controller');

class MessagesController extends AppController {
	public $uses = array('User', 'NewMsg');

	public function index (){
		$user = $this->Auth->user();
        $this->set('user', $user);
        
	}

    public function newmessage (){
		$user = $this->Auth->user();
        $this->set('user', $user);

        if ($this->request->is('post')) {
            $data = $this->request->data;
            $newMessageData = [
                'NewMsg' => [
                    'sender_id' => $this->Auth->user('id'),
                    'recipient_id' => $data['User']['id'],
                    'message' => $data['User']['message']
                ]
            ];

            if ($this->NewMsg->save($newMessageData)) {
                $recipientId = $data['User']['id'];
                $this->Flash->success('Message sent successfully.');
                return $this->redirect(array('controller' => 'Messages', 'action' => 'messagelist', '?' => array('recipient_id' => $recipientId)));
            } else {
                $this->Flash->error('Failed to send message. Please try again.');
            }
        }
	}

    public function search() {
        $this->autoRender = false;
        $this->response->type('json');

        $query = $this->request->query('q');
        $users = $this->User->find('all', [
            'conditions' => ['User.name LIKE' => '%' . $query . '%'],
            'fields' => ['User.id', 'User.name']
        ]);

        $results = [];
        foreach ($users as $user) {
            $results[] = [
                'id' => $user['User']['id'],
                'text' => $user['User']['name']
            ];
        }

        echo json_encode($results);
    }

    public function messagelist() {
        $recipientId = $this->request->query('recipient_id');
        $userId = $this->Auth->user('id');
        $page = $this->request->query('page', 1);
        $limit = 10;

        if ($recipientId) {
            //$recipientId = $this->request->query('recipient_id');
            $user = $this->Auth->user();

            $conditions = [
                'OR' => [
                    ['NewMsg.sender_id' => $userId, 'NewMsg.recipient_id' => $recipientId],
                    ['NewMsg.sender_id' => $recipientId, 'NewMsg.recipient_id' => $userId]
                ],
                'NewMsg.is_deleted' => false // Exclude deleted message
            ];
            $messages = $this->NewMsg->find('all', [
                'conditions' => $conditions,
                'order' => ['NewMsg.created' => 'ASC'],
                'limit' => $limit,
                'page' => $page
            ]);
    
            // Set pagination options
            //$messages = $this->paginate($this->NewMsg);
            // Check if there are more messages
            $totalMessages = $this->NewMsg->find('count', ['conditions' => $conditions]);
            $hasMore = ($page * $limit) < $totalMessages;

            // Fetch user names
            $senderName = $this->User->field('name', ['User.id' => $user['id']]);
            $recipientName = $this->User->field('name', ['User.id' => $recipientId]);

            $this->set(compact('messages', 'recipientId', 'user', 'senderName', 'recipientName', 'page', 'hasMore'));
        } else {
            $this->Flash->error('Recipient ID is missing.');
        }
    }
    
    public function ajaxLoadMoreMessages() {
        $this->autoRender = false; // We don't need a view for this action
        $this->response->type('json');
    
        $recipientId = $this->request->query('recipient_id');
        $userId = $this->Auth->user('id');
        $page = $this->request->query('page', 1);
        $limit = 10;
    
        if ($recipientId) {
            $conditions = [
                'OR' => [
                    ['NewMsg.sender_id' => $userId, 'NewMsg.recipient_id' => $recipientId],
                    ['NewMsg.sender_id' => $recipientId, 'NewMsg.recipient_id' => $userId]
                ]
            ];
    
            $messages = $this->NewMsg->find('all', [
                'conditions' => $conditions,
                'order' => ['NewMsg.created' => 'ASC'],
                'limit' => $limit,
                'page' => $page
            ]);
    
            // Fetch user names
            $senderName = $this->User->field('name', ['User.id' => $userId]);
            $recipientName = $this->User->field('name', ['User.id' => $recipientId]);
    
            // Check if there are more messages
            $totalMessages = $this->NewMsg->find('count', ['conditions' => $conditions]);
            $hasMore = ($page * $limit) < $totalMessages;
    
            $response = [
                'success' => true,
                'messages' => $messages,
                'hasMore' => $hasMore,
                'senderName' => $senderName,
                'recipientName' => $recipientName,
            ];
        } else {
            $response = ['success' => false, 'error' => 'Recipient ID is missing.'];
        }
    
        echo json_encode($response);
    }

    public function ajaxAddMessage() {
        $this->autoRender = false; // We don't need a view for this action
        $this->response->type('json');
    
        if ($this->request->is('post')) {
            $senderId = $this->Auth->user('id');
            $recipientId = $this->request->data['recipient_id'];
            $messageContent = $this->request->data['message'];
    
            $newMessageData = [
                'NewMsg' => [
                    'sender_id' => $senderId,
                    'recipient_id' => $recipientId,
                    'message' => $messageContent,
                    'created_ip' => $this->request->clientIp(),
                    'modified_ip' => $this->request->clientIp()
                ]
            ];

            $response = [];
    
            if ($this->NewMsg->save($newMessageData)) {
                $response = [
                    'success' => true,
                    'created' => date('Y-m-d H:i:s')
                ];
            } else {
                $response = ['success' => false];
            }
    
            echo json_encode($response);
            return;
        } else {
            echo json_encode(['success' => false, 'error' => 'Invalid request']);
            return;
        }
    }
    
    public function fetchNewMessages() {
        $this->autoRender = false; // We don't need a view for this action
        $this->response->type('json');
    
        if ($this->request->is('get')) {
            $recipientId = $this->request->query('recipient_id');
            $senderId = $this->Auth->user('id');
    
            // Fetch new messages for the conversation between the sender and recipient
            $conditions = [
                'OR' => [
                    [
                        'NewMsg.sender_id' => $senderId,
                        'NewMsg.recipient_id' => $recipientId,
                    ],
                    [
                        'NewMsg.sender_id' => $recipientId,
                        'NewMsg.recipient_id' => $senderId,
                    ]
                ],
                'NewMsg.is_deleted' => false, // Exclude deleted message
                'NewMsg.created >=' => date('Y-m-d H:i:s', strtotime('-10 seconds')) // Adjust the time interval as needed
            ];
            
            $newMessages = $this->NewMsg->find('all', [
                'conditions' => $conditions,
                'order' => ['NewMsg.created' => 'ASC']
            ]);
    
            $response = [
                'success' => true,
                'newMessages' => []
            ];
    
            foreach ($newMessages as $newMessage) {
                $response['newMessages'][] = [
                    'sender_id' => $newMessage['NewMsg']['sender_id'],
                    'message' => $newMessage['NewMsg']['message'],
                    'created' => $newMessage['NewMsg']['created']
                ];
            }
    
            echo json_encode($response);
            return;
        }
    
        echo json_encode(['success' => false, 'error' => 'Invalid request']);
    }
    
    /*public function ajaxDeleteMessage() {
        $this->autoRender = false;
        $this->response->type('json');
    
        if ($this->request->is('post')) {
            $messageId = $this->request->data('message_id');
            $userId = $this->Auth->user('id');
    
            $message = $this->NewMsg->findById($messageId);
            
            if ($message && $message['NewMsg']['sender_id'] == $userId) {
                if ($this->NewMsg->delete($messageId)) {
                    echo json_encode(['success' => true]);
                    return;
                }
            }
        }
        echo json_encode(['success' => false]);
    }*/

    public function ajaxDeleteMessage() {
        $this->autoRender = false; // We don't need a view for this action
        $this->response->type('json');
    
        if ($this->request->is('post')) {
            $messageId = $this->request->data['message_id'];
            $userId = $this->Auth->user('id');
    
            $message = $this->NewMsg->find('first', [
                'conditions' => [
                    'NewMsg.msg_id' => $messageId,
                    'NewMsg.sender_id' => $userId // Ensure the user is the sender of the message
                ]
            ]);
    
            if ($message) {
                $message['NewMsg']['is_deleted'] = true;
                if ($this->NewMsg->save($message)) {
                    echo json_encode(['success' => true]);
                } else {
                    echo json_encode(['success' => false]);
                }
            } else {
                echo json_encode(['success' => false, 'message' => 'Message not found or you are not the sender']);
            }
        } else {
            echo json_encode(['success' => false, 'message' => 'Invalid request']);
        }
    }
    
    
}