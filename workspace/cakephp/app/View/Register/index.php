<!-- app/View/Users/add.ctp -->
<div class="users form">
<?php echo $this->Form->create('User'); ?>
    <fieldset>
        <legend><?php echo __('Registration'); ?></legend>
        <?php 
        echo $this->Form->input('name',[
            'class' => 'input-space', 
            'maxlength' => 20],);
        echo $this->Form->input('email', [
            'class' => 'input-space']);
        echo $this->Form->input('password', [
            'class' => 'input-space',
            'type' => 'password']);
        echo $this->Form->input('confpassword', [
            'class' => 'input-space',
            'type' => 'password']);
    ?>
    </fieldset>
<?php echo $this->Form->end(__('Register')); ?>
</div>