<div class="message-list">
    <h2>Messages with <?php echo h($recipientName); ?></h2>

    <!-- 'New Message' button here-->
    <button id="new-message-button" style="text-align: right; float: right;">New Message</button>

    <!-- Reply Box (initially hidden) -->
    <div id="reply-box" style="display: none; text-align: right; float: right;">
        <?php echo $this->Form->create('NewMsg', ['id' => 'reply-form']); ?>
        <div class="form-group">
            <?php echo $this->Form->input('NewMsg.message', [
                'type' => 'textarea',
                'label' => false,
                'class' => 'form-control',
                'id' => 'new-message-content',
                'placeholder' => 'Type your message here...'
            ]); ?>
        </div>
        <?php echo $this->Form->button(__('Send'), ['type' => 'button', 'id' => 'send-message-button']); ?>
        <?php echo $this->Form->end(); ?>
    </div>

    <!--Content-->
    <?php if (!empty($messages)): ?>
        <ul class="messages">
            <?php foreach ($messages as $message): ?>
                <?php $messageContent = h($message['NewMsg']['message']); ?>
                <?php $isLongMessage = strlen($messageContent) > 1000; ?>
                <li class="<?php echo $message['NewMsg']['sender_id'] == $user['id'] ? 'sender' : 'recipient'; ?>" data-message-id="<?php echo $message['NewMsg']['msg_id']; ?>">
                    <div class="message-content">
                        <div class="text" data-full-text="<?php echo $messageContent; ?>">
                            <strong><?php echo h($message['NewMsg']['sender_id'] == $user['id'] ? $senderName : $recipientName); ?>:</strong>
                            <?php echo $isLongMessage ? substr($messageContent, 0, 1000) . '...' : $messageContent; ?>
                            <br>
                            <small><?php echo h($message['NewMsg']['created']); ?></small>
                        </div>
                        <?php if ($isLongMessage): ?>
                            <span class="show-more">Show more</span>
                        <?php endif; ?>
                    </div>
                </li>
            <?php endforeach; ?>
        </ul>

        <?php if ($hasMore): ?>
            <button id="show-more-button">Show More</button>
        <?php endif; ?>

    <?php else: ?>
        <p>No messages found.</p>
    <?php endif; ?>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    $(document).ready(function() {
        var page = <?php echo json_encode($page); ?>;
        var recipientId = <?php echo json_encode($recipientId); ?>;
        var userId = <?php echo json_encode($user['id']); ?>;
        var senderName = <?php echo json_encode($senderName); ?>;
        var recipientName = <?php echo json_encode($recipientName); ?>;
        var characterLimit = 1000;

        // Function to fetch new messages
        function fetchNewMessages() {
            $.ajax({
                url: '<?php echo $this->Html->url(['controller' => 'Messages', 'action' => 'fetchNewMessages']); ?>',
                method: 'GET',
                data: {
                    recipient_id: recipientId
                },
                dataType: 'json', // Ensure the response is treated as JSON
                success: function(response) {
                    if (response.success && response.newMessages.length > 0) {
                        response.newMessages.forEach(function(message) {
                            var truncatedText = message.message.length > characterLimit ? message.message.substring(0, characterLimit) + '...' : message.message;
                            // Append the new message to the message list
                            $('.messages').append(
                                '<li class="' + (message.sender_id == userId ? 'sender' : 'recipient') + '">' +
                                '<div class="message-content">' +
                                '<div class="text" data-full-text="' + message.message + '">' +
                                '<strong>' + (message.sender_id == userId ? senderName : recipientName) + ':</strong> ' + truncatedText +
                                '<br>' +
                                '<small>' + message.created + '</small>' +
                                '</div>' +
                                (message.message.length > characterLimit ? '<span class="show-more">... Show more</span>' : '') +
                                '</div>' +
                                '</li>'
                            );
                        });
                    }
                },
                error: function(xhr, status, error) {
                    console.error(xhr, status, error); // Log any error for debugging
                }
            });
        }

        // Set interval to fetch new messages every 10 seconds
        setInterval(fetchNewMessages, 10000);

        // Show the reply box when the New Message button is clicked
        $('#new-message-button').click(function() {
            $('#reply-box').toggle();
            $('#new-message-button').toggle(false);
        });

        // Handle the send message button click event
        $('#send-message-button').click(function() {
            var messageContent = $('#new-message-content').val();
            if (messageContent.trim() === '') {
                alert('Message content cannot be empty');
                return;
            }

            $.ajax({
                url: '<?php echo $this->Html->url(['controller' => 'Messages', 'action' => 'ajaxAddMessage']); ?>',
                method: 'POST',
                data: {
                    message: messageContent,
                    recipient_id: recipientId
                },
                dataType: 'json', // Ensure the response is treated as JSON
                success: function(response) {
                    if (response.success) {
                        // Clear the message content
                        $('#new-message-content').val('');
                        var truncatedText = messageContent.length > characterLimit ? messageContent.substring(0, characterLimit) + '...' : messageContent;
                        // Append the new message to the message list
                        $('.messages').append(
                            '<li class="sender">' +
                            '<div class="message-content">' +
                            '<div class="text" data-full-text="' + messageContent + '">' +
                            '<strong>' + senderName + ':</strong> ' + truncatedText +
                            '<br>' +
                            '<small>' + response.created + '</small>' +
                            '</div>' +
                            (messageContent.length > characterLimit ? '<span class="show-more">... Show more</span>' : '') +
                            '</div>' +
                            '</li>'
                        );
                        // Hide the reply box and show the New Message button
                        $('#reply-box').toggle(false);
                        $('#new-message-button').toggle(true);
                    } else {
                        alert('Failed to send message');
                    }
                },
                error: function(xhr, status, error) {
                    console.error(xhr, status, error); // Log any error for debugging
                    alert('Error in sending message');
                }
            });
        });

        // Handle the Show More button click event
        $('#show-more-button').click(function() {
            page++;
            $.ajax({
                url: '<?php echo $this->Html->url(['controller' => 'Messages', 'action' => 'ajaxLoadMoreMessages']); ?>',
                method: 'GET',
                dataType: 'json',
                data: {
                    recipient_id: recipientId,
                    page: page
                },
                success: function(response) {
                    if (response.success) {
                        // Append the new messages to the message list
                        $.each(response.messages, function(index, message) {
                            var truncatedText = message.NewMsg.message.length > characterLimit ? message.NewMsg.message.substring(0, characterLimit) + '...' : message.NewMsg.message;
                            $('.messages').append(
                                '<li class="' + (message.NewMsg.sender_id == userId ? 'sender' : 'recipient') + '">' +
                                '<div class="message-content">' +
                                '<div class="text" data-full-text="' + message.NewMsg.message + '">' +
                                '<strong>' + (message.NewMsg.sender_id == userId ? senderName : recipientName) + ':</strong> ' + truncatedText +
                                '<br>' +
                                '<small>' + message.NewMsg.created + '</small>' +
                                '</div>' +
                                (message.NewMsg.message.length > characterLimit ? '<span class="show-more">... Show more</span>' : '') +
                                '</div>' +
                                '</li>'
                            );
                        });

                        // Hide the Show More button if there are no more messages
                        if (!response.hasMore) {
                            $('#show-more-button').hide();
                        }
                    } else {
                        alert('Failed to load more messages');
                    }
                },
                error: function() {
                    alert('Error in loading more messages');
                }
            });
        });

        // Handle message delete on click
        $('.messages').on('click', '.sender', function() {
            var messageId = $(this).data('message-id');
            if (confirm('Are you sure you want to delete this message?')) {
                $.ajax({
                    url: '<?php echo $this->Html->url(['controller' => 'Messages', 'action' => 'ajaxDeleteMessage']); ?>',
                    method: 'POST',
                    data: {
                        message_id: messageId
                    },
                    dataType: 'json',
                    success: function(response) {
                        if (response.success) {
                            $('li[data-message-id="' + messageId + '"]').remove();
                        } else {
                            alert('Failed to delete message');
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error(xhr, status, error); // Log any error for debugging
                        alert('Error in deleting message');
                    }
                });
            }
        });

        // Handle text truncation and expansion
        $('.messages').on('click', '.show-more', function() {
            var messageContent = $(this).closest('.message-content');
            var textElement = messageContent.find('.text');
            var fullText = textElement.data('full-text');
            if (messageContent.hasClass('less')) {
                textElement.text(fullText);
                messageContent.removeClass('less').addClass('more');
                $(this).text('Show less');
            } else {
                var truncatedText = fullText.substring(0, characterLimit) + '...';
                textElement.text(truncatedText);
                messageContent.removeClass('more').addClass('less');
                $(this).text('... Show more');
            }
        });

        // Hide show-more if text doesn't exceed limit
        $('.messages .message-content').each(function() {
            var textElement = $(this).find('.text');
            var fullText = textElement.data('full-text');
            if (fullText.length <= characterLimit) {
                $(this).find('.show-more').hide();
            }
        });
    });
</script>
