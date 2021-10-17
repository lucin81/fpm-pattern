module m_command
  use M_CLI2, only : get_subcommand, set_args, rget, sget
  implicit none
  private

  public :: command_t, command_copy_t, command_test_t, Parse
  
  type, abstract :: command_t
  end type command_t

  type, extends(command_t) :: command_test_t
    character(len=:), allocatable :: name
    real :: x 
  end type command_test_t

  type, extends(command_t) :: command_copy_t
    character(len=:), allocatable :: name
    character(len=:), allocatable :: file
  end type command_copy_t


  contains

  subroutine Parse(cmd)
    class(command_t), allocatable, intent(out) :: cmd

    character(len=:), allocatable :: help_text(:), version_text(:)
    character(len=4096) :: args

    version_text=[character(len=80) :: &
      '@(#)PROGRAM:     demo6            >', &
      '@(#)DESCRIPTION: My demo program  >', &
      '@(#)VERSION:     1.0 20200715     >', &
      '@(#)AUTHOR:      me, myself, and I>', &
      '@(#)LICENSE:     Public Domain    >', &
      '' ]

    args = get_subcommand()

    select case (args) 
    case('test')
      help_text=[character(len=80) :: &
      '                                  ', &
      ' Help for subcommand "test"   ', &
      '                                  ', &
      '' ]
      call set_args('-x 10',help_text, version_text)
      cmd = command_test_t(name=trim(args), x=rget('x')) 
    case('copy')
      help_text=[character(len=80) :: &
      '                                  ', &
      ' Help for subcommand "copy"        ', &
      '                                  ', &
      '' ]
      call set_args('--file "name"',help_text, version_text)
      cmd = command_copy_t(name=trim(args), file=sget('file')) 
    case default
      call set_args(' ', help_text, version_text)
      write(*,'(*(a))')'unknown or missing subcommand [',trim(args),']'
      write(*,'(a)')[character(len=80) ::  &
        ' allowed subcommands are          ', &
        '   * copy --file "name"           ', &
        '   * test -x 10                   ', &
        '' ]
      stop
    end select
  end subroutine Parse
end module m_command
