module m_command_copy
  use m_command, only: command_t, command_copy_t
  implicit none
  private 

  public :: Cmd_copy

contains
  subroutine Cmd_copy(cmd)
    type(command_copy_t), intent(in) :: cmd
    
    print*, "Executing command ",cmd%name
    print*, "on file ",cmd%file
  end subroutine Cmd_copy
end module m_command_copy