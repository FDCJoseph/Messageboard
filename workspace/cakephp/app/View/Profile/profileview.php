<div class="profile view">
    <fieldset>
        <legend><?php echo __('User Profile'); ?></legend>
        
        <!-- Profile Picture -->
        <div class="form-group profile-picture-group">
            <div class="profile-picture-preview">
                <?php 
                $profilePic = !empty($user['profile_picture']) ? $user['profile_picture'] : '256px-Unknown_person.jpg';
                echo $this->Html->image($profilePic, [
                    'alt' => 'Profile Picture',
                    'class' => 'input-space',
                    'id' => 'profile-picture'
                ]); ?>
            </div>
        </div>

        <!-- Name Display -->
        <div class="form-group">
            <label>Name:</label>
            <div class="input-space"><?php echo h($user['name']); ?></div>
        </div>

        <!-- Birthdate Display -->
        <div class="form-group">
            <label>Birthdate:</label>
            <div class="input-space"><?php echo h($user['birthdate']); ?></div>
        </div>

        <!-- Gender Display -->
        <div class="form-group">
            <label>Gender:</label>
            <div class="input-space"><?php echo h($user['gender']); ?></div>
        </div>

        <!-- Hobbies Display -->
        <div class="form-group">
            <label>Hobbies:</label>
            <div class="input-space"><?php echo nl2br(h($user['hobby'])); ?></div>
        </div>

        <!-- Email Display -->
        <div class="form-group">
            <label>Email:</label>
            <div class="input-space"><?php echo h($user['email']); ?></div>
        </div>
    </fieldset>
</div>
