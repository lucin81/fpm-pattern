module m_command_test
  use m_command, only: command_t, command_test_t

  implicit none
  private 

  public :: Cmd_test

contains

  subroutine Cmd_test(cmd)
    type(command_test_t), intent(in) :: cmd
    
    print*, "Executing command ",cmd%name
    print*, "with argument ",cmd%x
  end subroutine Cmd_test
  
end module m_command_test