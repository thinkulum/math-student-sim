import cmd

class CLI(cmd.Cmd):
    """
    Class for defining the command interface.
    """

    def do_q(self, arg):
        """Quit the application."""
        print('Bye!')
        return True

