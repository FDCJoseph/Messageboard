<?php

class ProfileController extends AppController {
    public $uses = array('User');

    public function index() {
        $user = $this->Auth->user();

        if ($this->request->is(['post', 'put'])) {
            $this->User->id = $user['id'];
            $this->User->set($this->request->data);

            // Validate the user data
            if ($this->User->validates()) {
                $data = array();

                // Handle name update
                if (isset($this->request->data['User']['name']) && !empty($this->request->data['User']['name'])) {
                    $data['User']['name'] = $this->request->data['User']['name'];
                }

                // Handle birthdate update
                if (isset($this->request->data['User']['birthdate']) && !empty($this->request->data['User']['birthdate'])) {
                    $data['User']['birthdate'] = $this->request->data['User']['birthdate'];
                }

                // Handle gender update
                if (isset($this->request->data['User']['gender']) && !empty($this->request->data['User']['gender'])) {
                    $data['User']['gender'] = $this->request->data['User']['gender'];
                }

                // Handle hobby update
                if (isset($this->request->data['User']['hobby']) && !empty($this->request->data['User']['hobby'])) {
                    $data['User']['hobby'] = $this->request->data['User']['hobby'];
                }

                // Handle email update
                if (isset($this->request->data['User']['email']) && !empty($this->request->data['User']['email'])) {
                    $data['User']['email'] = $this->request->data['User']['email'];
                }

                // Handle password update
                if (isset($this->request->data['User']['password']) && !empty($this->request->data['User']['password'])) {
                    $passwordHasher = new BlowfishPasswordHasher();
                    $data['User']['password'] = $passwordHasher->hash(
                        $this->request->data['User']['password']
                    );
                }

                // Handle file upload
                if (!empty($this->request->data['User']['profile_picture']['name'])) {
                    $file = $this->request->data['User']['profile_picture'];
                    //$ext = substr(strtolower(strrchr($file['name'], '.')), 1); // Get the extension
                    $ext = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));
                    $allowed_ext = array('jpg', 'jpeg', 'png', 'gif');

                    if (in_array($ext, $allowed_ext)) {
                        // Generate a unique file name
                        $fileName = uniqid() . '.' . $ext;
                        $uploadPath = WWW_ROOT . 'img' . DS . 'uploads' . DS . $fileName;

                        if (move_uploaded_file($file['tmp_name'], $uploadPath)) {
                            $data['User']['profile_picture'] = 'uploads/' . $fileName;
                        } else {
                            $this->Flash->error('Failed to upload the image. Please try again.');
                        }
                    } else {
                        //echo $ext;
                        //echo $allowed_ext;
                        $data['User']['profile_picture'] = '256px-Unknown_person.jpg';
                        $this->Flash->error('Invalid file type. Only JPG, JPEG, PNG, and GIF are allowed. Changed to unknown picture.');
                        //$this->request->data['User']['profile_picture'] = null;
                    }
                } else {
                    // User did not upload a new picture, set default profile picture
                    //$data['User']['profile_picture'] = '256px-Unknown_person.jpg';
                    $data['User']['profile_picture'] = null;
                }

                // Save the user data
                if (!isset($this->Flash->message['error'])) {
                    if ($this->User->save($data)) {
                        $this->Flash->success('Profile updated successfully.');
                        return $this->redirect(array('controller' => 'Profile', 'action' => 'profileview'));
                    } else {
                        $this->Flash->error('Failed to update profile. Please try again.');
                    }
                }
            } else {
                $errors = $this->User->validationErrors;
                $this->set('errors', $errors);
            }
        }

        $this->request->data = $user;
        $this->set('user', $user);
    }

    public function profileview(){
        // Retrieve the currently authenticated user's data
        $user = $this->Auth->user();
        
        // Retrieve the user's full data from the database using the user ID
        $user = $this->User->findById($user['id']);
        
        // Pass the user data to the view
        $this->set('user', $user['User']);
    }
}
