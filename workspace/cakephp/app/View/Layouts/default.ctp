<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <?php echo $this->Html->css('msgBoard'); ?>
    <title>Message Board</title>
    
    <!-- Other head elements -->
</head>
<body>
    <header>
        <?php if ($authUser): ?>
            <?php echo $this->element('navbar'); ?>
        <?php endif; ?>
    </header>
    <div class="container">
        <?php echo $this->Flash->render(); ?>
        <?php echo $this->fetch('content'); ?>
    </div>
    
    <!-- Other body elements -->
</body>
</html>