module EditorEventHandler
  def self.init
    editor = JS.document.getElementById('editor')
    return if editor.nil?

    plain_button = JS.document.getElementById('editor-mode-plain')
    ide_button = JS.document.getElementById('editor-mode-ide')
    editor_wrapper = JS.document.getElementById('editor-wrapper')

    input_callback_id = nil
    scroll_callback_id = nil
    selection_callback_id = nil
    keydown_callback_id = nil

    attach_ide_handlers = proc do
      next if input_callback_id

      input_callback_id = on editor, 'input' do
        editor.dispatchEvent(JS.global[:Event].new('auto-outdent'))
        editor.dispatchEvent(JS.global[:Event].new('refresh-highlight'))
        editor.dispatchEvent(JS.global[:Event].new('refresh-line-numbers'))
      end

      scroll_callback_id = on editor, 'scroll' do
        editor.dispatchEvent(JS.global[:Event].new('render-highlight-viewport'))
        editor.dispatchEvent(JS.global[:Event].new('sync-line-number-scroll'))
      end

      selection_callback_id = on editor, 'selectionchange' do
        editor.dispatchEvent(JS.global[:Event].new('refresh-active-line-number'))
      end

      keydown_callback_id = on editor, 'keydown', sync: true do |ev|
        next unless ev[:key].to_s == 'Enter'

        ev.preventDefault
        editor.dispatchEvent(JS.global[:Event].new('auto-indent'))
        editor.dispatchEvent(JS.global[:Event].new('refresh-highlight'))
        editor.dispatchEvent(JS.global[:Event].new('refresh-line-numbers'))
      end
    end

    detach_ide_handlers = proc do
      if input_callback_id
        JS::Object.removeEventListener(input_callback_id)
        input_callback_id = nil
      end
      if scroll_callback_id
        JS::Object.removeEventListener(scroll_callback_id)
        scroll_callback_id = nil
      end
      if selection_callback_id
        JS::Object.removeEventListener(selection_callback_id)
        selection_callback_id = nil
      end
      if keydown_callback_id
        JS::Object.removeEventListener(keydown_callback_id)
        keydown_callback_id = nil
      end
    end

    on plain_button, 'click' do
      detach_ide_handlers.call
      plain_button[:classList].add('active')
      ide_button[:classList].remove('active')
      EditorMode.apply(editor, editor_wrapper, 'plain')
    end

    on ide_button, 'click' do
      plain_button[:classList].remove('active')
      ide_button[:classList].add('active')
      EditorMode.apply(editor, editor_wrapper, 'ide')
      attach_ide_handlers.call
      editor.dispatchEvent(JS.global[:Event].new('refresh-line-numbers'))
      editor.dispatchEvent(JS.global[:Event].new('sync-line-number-scroll'))
    end

    EditorMode.apply(editor, editor_wrapper, 'plain')
    editor.dispatchEvent(JS.global[:Event].new('refresh-line-numbers'))
    editor.dispatchEvent(JS.global[:Event].new('sync-line-number-scroll'))
  end

  def self.on(target, event_name, sync: false, &block)
    target.addEventListener(event_name, sync:, &block)
  end
end

# To prevent editor initialization failures from affecting other features on /terminal, report the error and continue execution.
begin
  EditorEventHandler.init
rescue StandardError => e
  p 'Failed to initialize EditorEventHandler'
  p e
  nil
end
