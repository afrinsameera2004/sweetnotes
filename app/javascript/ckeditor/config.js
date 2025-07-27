
CKEDITOR.editorConfig = function(config) {
  config.toolbar = [
    { name: 'basicstyles', items: ['Bold', 'Italic', 'Underline', 'Strike'] },
    { name: 'paragraph', items: ['NumberedList', 'BulletedList', 'Blockquote'] },
    { name: 'links', items: ['Link', 'Unlink'] },
    { name: 'insert', items: ['Image', 'Table', 'HorizontalRule', 'SpecialChar'] },
    { name: 'styles', items: ['Format', 'FontSize'] },
    { name: 'colors', items: ['TextColor', 'BGColor'] },
    { name: 'tools', items: ['Maximize'] },
    { name: 'document', items: ['Source'] }
  ];

  config.removeDialogTabs = 'image:advanced;link:advanced';
  config.height = 300;
  config.language = 'en';
};
