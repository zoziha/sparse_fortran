module sparse_fortran_utils

    use, intrinsic :: iso_fortran_env, only: real64, real32, real128
    implicit none
    private

    public :: optval, wp

#ifdef REAL32
    integer, parameter :: wp = real32
#elif REAL128
    integer, parameter :: wp = real128
#else
    integer, parameter :: wp = real64
#endif

    interface optval
        module procedure optval_int
        module procedure optval_char
    end interface optval

contains

    function optval_int(i, default) result(res)
        integer, optional, intent(in) :: i
        integer, intent(in) :: default
        integer :: res
        if (present(i)) then
            res = i
        else
            res = default
        end if
    end function optval_int

    function optval_char(s, default) result(res)
        character, optional, intent(in) :: s
        character, intent(in) :: default
        character :: res
        if (present(s)) then
            res = s
        else
            res = default
        end if
    end function optval_char

end module sparse_fortran_utils
