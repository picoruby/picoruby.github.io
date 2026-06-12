module EditorMode
  IDE_MODE_VALUE = 'ide'
  PLAIN_MODE_VALUE = 'plain'

  def self.ide?
    JS.global[:editorMode].to_s == IDE_MODE_VALUE
  end

  def self.apply(editor, editor_wrapper, mode)
    if mode == IDE_MODE_VALUE
      JS.global[:editorMode] = IDE_MODE_VALUE
      # In IDE mode, make the editor textarea text and background transparent so the syntax highlight layer is visible.
      editor.style[:color] = 'transparent'
      editor.style[:background] = 'transparent'
      editor_wrapper[:classList].add('show-line-numbers')

      editor.dispatchEvent(JS.global[:Event].new('refresh-highlight'))
    else
      JS.global[:editorMode] = PLAIN_MODE_VALUE
      editor.style[:color] = '#f8f8f2'
      editor.style[:background] = '#1a1a1a'
      editor_wrapper[:classList].remove('show-line-numbers')
    end
  end
end
