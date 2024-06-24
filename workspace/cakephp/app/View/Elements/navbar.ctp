<!-- app/View/Elements/navbar.ctp -->
<div class="navbar">
    <div class="navbar-inner">
        <?php echo $this->Html->link('Jose MessageBoard', ['controller' => 'Home', 'action' => 'index'], ['class' => 'brand']); ?>
        <ul class="nav">
            <li><a href="<?php echo $this->Html->url(array('controller' => 'Profile', 'action' => 'index')); ?>"><?php echo __('Welcome, ') . h($authUser['name']); ?></a></li>
            <li><?php echo $this->Html->link(__('Logout'), array('controller' => 'Login', 'action' => 'logout')); ?></li>
        </ul>
    </div>
</div>
