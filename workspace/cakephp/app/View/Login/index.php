<div class="users form">
<?php echo $this->Flash->render('auth'); ?>
<?php echo $this->Form->create('User'); ?>
    <fieldset>
        <legend>
            <?php echo __('Please enter your email and password'); ?>
        </legend>
        <?php echo $this->Form->input('email', [
            'class' => 'input-space']);
        echo $this->Form->input('password', [
            'class' => 'input-space',
            'type' => 'password']);
    ?>
    </fieldset>
<?php echo $this->Form->end(__('Login')); ?>
</div>