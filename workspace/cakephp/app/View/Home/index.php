<div class="home">
    <div class="buttons-container">
        <!-- Button to redirect to profile view -->
        <a href="<?php echo $this->Html->url(array('controller' => 'Profile', 'action' => 'profileview')); ?>" class="btn btn-primary btn-large">
            View Profile
        </a>

        <!-- Button to redirect to new message -->
        <a href="<?php echo $this->Html->url(array('controller' => 'Messages', 'action' => 'newmessage')); ?>" class="btn btn-primary btn-large">
            New Message
        </a>
    </div>
</div>

<!-- Add some basic styles for the buttons and container -->

