program main
  use m_command, only: command_t, command_copy_t, command_test_t, Parse
  use m_command_copy, only : Cmd_copy
  use m_command_test, only : Cmd_test
  implicit none

  class(command_t), allocatable :: cmd 

  call Parse(cmd)

  select type (cmd)
  type is (command_copy_t)
    call cmd_copy(cmd)
  type is (command_test_t)
    call cmd_test(cmd)
  end select

end program main
