module EditorEventHandler
  def self.init
    editor = JS.document.getElementById('editor')
    return if editor.nil?

    plain_button = JS.document.getElementById('editor-mode-plain')
    ide_button = JS.document.getElementById('editor-mode-ide')

    on editor, 'input' do
      next unless EditorMode.ide?

      editor.dispatchEvent(JS.global[:Event].new('refresh-highlight'))
    end

    on editor, 'scroll' do
      next unless EditorMode.ide?

      editor.dispatchEvent(JS.global[:Event].new('render-highlight-viewport'))
    end

    on plain_button, 'click' do
      plain_button[:classList].add('active')
      ide_button[:classList].remove('active')
      EditorMode.apply(editor, 'plain')
    end

    on ide_button, 'click' do
      plain_button[:classList].remove('active')
      ide_button[:classList].add('active')
      EditorMode.apply(editor, 'ide')
    end

    EditorMode.apply(editor, 'plain')
  end

  def self.on(target, event_name, &block)
    target.addEventListener(event_name, &block)
  end
end

EditorEventHandler.init
