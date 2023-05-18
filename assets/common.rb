# frozen_string_literal: true

def safe_gets
  gets
rescue Errno::EIO
  warn 'Произошла ошибка ввода-вывода (EOF). Завершение программы.'
  exit(1)
rescue Interrupt
  warn 'Процесс прерван пользователем (Ctrl+C). Завершение программы.'
  exit(1)
end
