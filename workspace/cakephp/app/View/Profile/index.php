<div class="profile form">
    <?php echo $this->Form->create('User', ['type' => 'file']); ?>
    <fieldset>
        <legend><?php echo __('User Profile'); ?></legend>
        
        <!-- Profile Picture Upload -->
        <div class="form-group profile-picture-group">
            <div class="profile-picture-preview">
                <?php 
                $profilePic = !empty($user['profile_picture']) ? $user['profile_picture'] : '256px-Unknown_person.jpg';
                //echo $profilePic;
                echo $this->Html->image($profilePic, [
                    'alt' => 'Profile Picture Preview',
                    'class' => 'input-space',
                    'id' => 'profile-picture-preview'
                ]); ?>
            </div>
            <div class="profile-picture-input">
                <?php echo $this->Form->input('User.profile_picture', [
                    'type' => 'file',
                    'class' => 'profile-picture-input',
                    'id' => 'profile-picture-input',
                    'label' => false
                ]); ?>
            </div>
        </div>

        <!-- Name Input -->
        <div class="form-group">
            <?php echo $this->Form->input('User.name', [
                'class' => 'input-space', 
                'maxlength' => 20,
                'placeholder' => 'Enter your name'
            ]); ?>
            <?php if (isset($errors['name'])): ?>
                <div class="error-message"><?php echo $errors['name'][0]; ?></div>
            <?php endif; ?>
        </div>

        <!-- Birthdate Input with jQuery Date Picker -->
        <div class="form-group">
            <?php echo $this->Form->input('User.birthdate', [
                'class' => 'input-space',
                'type' => 'text',
                'id' => 'birthdate',
                'placeholder' => 'Select your birthdate'
            ]); ?>
        </div>

        <!-- Gender Input -->
        <div class="form-group">
            <?php echo $this->Form->input('User.gender', [
                'type' => 'radio',
                'options' => [
                    'male' => 'Male',
                    'female' => 'Female'
                ],
                'legend' => false // Optional: hides the default legend
            ]); ?>
        </div>

        <!-- Hobbies Input (Multi-text box) -->
        <div class="form-group">
            <?php echo $this->Form->input('User.hobby', [
                'class' => 'input-space',
                'type' => 'textarea',
                'placeholder' => 'Enter your hobbies'
            ]); ?>
        </div>

        <div class="form-group">
            <?php echo $this->Form->input('User.email', [
            'class' => 'input-space'
            ]);?>
        </div>

        <div class="form-group">
            <?php echo $this->Form->input('User.password', [
            'class' => 'input-space',
            'type' => 'password'
            ]);?>
        </div>

        <!-- Update Button -->
        <div class="form-group">
            <?php echo $this->Form->button(__('Update Profile'), [
                'type' => 'submit',
                'class' => 'btn btn-primary'
            ]); ?>
        </div>

    </fieldset>

    <?php echo $this->Form->end(); ?>
</div>

<!-- jQuery and jQuery UI (for Date Picker) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script>
    // jQuery Date Picker for Birthdate
    $(function() {
        $('#birthdate').datepicker({
            dateFormat: 'yy-mm-dd',
            changeMonth: true,
            changeYear: true,
            yearRange: '-100:+0'
        });
    });

    // Image Preview for Profile Picture
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#profile-picture-preview').attr('src', e.target.result).show();
            }
            reader.readAsDataURL(input.files[0]);
        }
    }


    $("#profile-picture-input").change(function(){
        readURL(this);
    });

    $("#profile-picture-form").submit(function(event) {
        event.preventDefault(); // Prevent default form submission

        var form = $(this)[0];
        var formData = new FormData(form);

        // Perform AJAX submission to handle image upload
        $.ajax({
            url: '/upload-profile-picture', // Replace with your server URL
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false
        });

        // Update the image preview immediately after form submission
        var input = document.getElementById('profile-picture-input');
        readURL(input); // Assuming readURL function is defined elsewhere to update preview
    });
</script>
