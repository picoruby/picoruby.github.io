module EditorEventHandler
  def self.init
    editor = JS.document.getElementById('editor')
    return if editor.nil?

    plain_button = JS.document.getElementById('editor-mode-plain')
    ide_button = JS.document.getElementById('editor-mode-ide')
    editor_wrapper = JS.document.getElementById('editor-wrapper')

    # Prevent the textarea's native Enter from adding a second newline beside auto-indent.
    disable_native_enter_in_ide(editor)

    on editor, 'input' do
      next unless EditorMode.ide?

      editor.dispatchEvent(JS.global[:Event].new('auto-outdent'))
      editor.dispatchEvent(JS.global[:Event].new('refresh-highlight'))
      editor.dispatchEvent(JS.global[:Event].new('refresh-line-numbers'))
    end

    on editor, 'scroll' do
      next unless EditorMode.ide?

      editor.dispatchEvent(JS.global[:Event].new('render-highlight-viewport'))
      editor.dispatchEvent(JS.global[:Event].new('sync-line-number-scroll'))
    end

    on editor, 'selectionchange' do
      next unless EditorMode.ide?

      editor.dispatchEvent(JS.global[:Event].new('refresh-active-line-number'))
    end

    on plain_button, 'click' do
      plain_button[:classList].add('active')
      ide_button[:classList].remove('active')
      EditorMode.apply(editor, editor_wrapper, 'plain')
    end

    on ide_button, 'click' do
      plain_button[:classList].remove('active')
      ide_button[:classList].add('active')
      EditorMode.apply(editor, editor_wrapper, 'ide')
      editor.dispatchEvent(JS.global[:Event].new('refresh-line-numbers'))
      editor.dispatchEvent(JS.global[:Event].new('sync-line-number-scroll'))
    end

    on editor, "keydown" do |ev|
      next unless EditorMode.ide? && ev[:key].to_s == 'Enter'

      editor.dispatchEvent(JS.global[:Event].new('auto-indent'))
      editor.dispatchEvent(JS.global[:Event].new('refresh-highlight'))
      editor.dispatchEvent(JS.global[:Event].new('refresh-line-numbers'))
    end

    EditorMode.apply(editor, editor_wrapper, 'plain')
    editor.dispatchEvent(JS.global[:Event].new('refresh-line-numbers'))
    editor.dispatchEvent(JS.global[:Event].new('sync-line-number-scroll'))
  end

  def self.on(target, event_name, &block)
    target.addEventListener(event_name, &block)
  end

  def self.disable_native_enter_in_ide(editor)
    editor.send(:method_missing, :addEventListener, 'keydown') do |ev|
      next unless EditorMode.ide? && ev[:key].to_s == 'Enter'

      ev.preventDefault
    end
  end
end

EditorEventHandler.init
