<!-- new_message.ctp -->
<div class="message form">
    <?php echo $this->Form->create('User', ['type' => 'file']); ?>
    <fieldset>
        <legend><?php echo __('New Message'); ?></legend>

        <div class="form-group">
            <?php echo $this->Form->label('User Search', 'Search User:'); ?>
            <?php echo $this->Form->input('User.id', [
                'type' => 'select',
                'label' => false,
                'id' => 'user-search',
                'class' => 'form-control',
                'multiple' => false,
                'options' => [],
                'style' => 'min-width: 200px;'
            ]); ?>
        </div>
        
        <!-- Message Input (Multi-text box) -->
        <div class="form-group">
            <?php echo $this->Form->input('User.message', [
                'class' => 'input-space',
                'type' => 'textarea',
                'placeholder' => 'Type your message'
            ]); ?>
        </div>

        <!-- Update Button -->
        <div class="form-group">
            <?php echo $this->Form->button(__('Send message'), [
                'type' => 'submit'
            ]); ?>
        </div>

    </fieldset>

    <?php echo $this->Form->end(); ?>
</div>

<!-- Include jQuery and Select2 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<script>
        $(document).ready(function() {
            // Initialize Select2 for user search
            $('#user-search').select2({
                placeholder: 'Search for a user',
                minimumInputLength: 1,
                ajax: {
                    url: '<?php echo $this->Html->url(['controller' => 'Messages', 'action' => 'search']); ?>',
                    dataType: 'json',
                    delay: 250,
                    data: function (params) {
                        return {
                            q: params.term
                        };
                    },
                    processResults: function (data) {
                        return {
                            results: data
                        };
                    },
                    cache: true
                }
            });
        });
    </script>