from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import os
import subprocess

from ranger.api.commands import Command


# Utility methods for use within commands
def docker_compose_cmd(file, *args):
    process_list = ['docker-compose', '-f', file]
    process_list += args
    with open(os.devnull, 'w') as FNULL:
        subprocess.Popen(process_list, stdout=FNULL, stderr=subprocess.STDOUT)


def find_compose_file(path):
    file_name = "docker-compose.yml"
    cur_dir = os.getcwd()

    while True:
        file_list = os.listdir(cur_dir)
        parent_dir = os.path.dirname(cur_dir)
        if file_name in file_list:
            return cur_dir + "/" + file_name
        else:
            if cur_dir == parent_dir:
                return None
            cur_dir = parent_dir


def get_clipboard_data():
    p = subprocess.Popen(['pbpaste'], stdout=subprocess.PIPE)
    data = p.stdout.read()
    return data


def set_clipboard_data(data):
    p = subprocess.Popen(['pbcopy'], stdin=subprocess.PIPE)
    p.stdin.write(data)
    p.stdin.close()
    p.wait()


class touch(Command):
    """:touch <filename>

    A command that creates a blank file with the given filename
    """

    def execute(self):
        if self.arg(1):
            target_filename = self.rest(1)
        else:
            self.fm.notify("No filename given!", bad=True)
            return

        if os.path.exists(target_filename):
            self.fm.notify("The filename given already exists!", bad=True)
            return
        else:
            self.fm.notify("Creating file " + target_filename)
            with open(target_filename, 'a') as file:
                file.write("")

    def tab(self, tabnum):
        return self._tab_directory_content()


class overwrite_contents_with_clipboard(Command):
    """:overwrite_contents_with_clipboard <filename>

    A command that overwrites the contents of a file with what is contained in
    the clipboard
    """

    def execute(self):
        if self.arg(1):
            target_filename = self.rest(1)
        else:
            target_filename = self.fm.thisfile.path

        self.fm.notify(
            "overwriting contents w/ clipboard to " + target_filename
        )
        if not os.path.exists(target_filename):
            self.fm.notify("The given file does not exist!", bad=True)
            return

        with open(target_filename, 'w') as file:
            file.write(get_clipboard_data())

    def tab(self, tabnum):
        return self._tab_directory_content()


class append_clipboard(Command):
    """:blank <filename>

    A simple command that blanks out a file
    """

    def execute(self):
        if self.arg(1):
            target_filename = self.rest(1)
        else:
            target_filename = self.fm.thisfile.path

        self.fm.notify("appending clipboard to " + target_filename)
        if not os.path.exists(target_filename):
            self.fm.notify("The given file does not exist!", bad=True)
            return

        with open(target_filename, 'a') as file:
            file.write(get_clipboard_data())

    def tab(self, tabnum):
        return self._tab_directory_content()


class copy_by_search(Command):
    """:copy_by_search <filename> <search_string>

    A simple command that copies a file's contents by search
    """

    def execute(self):
        if self.arg(2):
            target_filename = self.arg(1)
            search_string = self.rest(2)
        elif self.arg(1):
            target_filename = self.fm.thisfile.path
            search_string = self.rest(1)
        else:
            self.fm.notify("Missing search string argument!", bad=True)
            return

        self.fm.notify(
            "copying lines with " +
            search_string +
            " to " +
            target_filename
        )

        if not os.path.exists(target_filename):
            self.fm.notify("The given file does not exist!", bad=True)
            return
        with open(target_filename, 'r') as file:
            lines = file.readlines()
        matching = [line for line in lines if search_string in line]
        set_clipboard_data(''.join(matching))

    def tab(self, tabnum):
        return self._tab_directory_content()


class yank_contents(Command):
    """:yank_contents <filename>

    A simple command that copies a file's contents by search
    """

    def execute(self):
        target_filename = self.arg(1) if self.arg(1) else self.fm.thisfile.path
        self.fm.notify("yanking content of" + target_filename)
        if not os.path.exists(target_filename):
            self.fm.notify("The given file does not exist!", bad=True)
            return
        with open(target_filename, 'r') as file:
            set_clipboard_data(file.read())

    def tab(self, tabnum):
        return self._tab_directory_content()


class DockerCommand(Command):
    # The execute method is called when you run this command in ranger.
    def execute(self):
        compose_file = find_compose_file(self.fm.thisfile.path)
        if not os.path.exists(compose_file):
            self.fm.notify("No docker-compose.yml found", bad=True)
            return

        self.fm.notify(self.RUN_MESSAGE)

        docker_compose_cmd(compose_file, *self.DOCKER_ARGS)

    def tab(self, tabnum):
        return self._tab_directory_content()


class docker_compose_build(DockerCommand):
    """:docker_compose_build"""
    RUN_MESSAGE = "Rebuilding docker composition"
    DOCKER_ARGS = ["build"]


class docker_compose_kill(DockerCommand):
    """:docker_compose_restart"""
    RUN_MESSAGE = "Killing docker composition"
    DOCKER_ARGS = ["kill"]


class docker_compose_restart(DockerCommand):
    """:docker_compose_restart"""
    RUN_MESSAGE = "Restarting docker composition"
    DOCKER_ARGS = ["restart"]


class docker_compose_down(DockerCommand):
    """:docker_compose_down"""
    RUN_MESSAGE = "Spinning down docker composition"
    DOCKER_ARGS = ["down"]


class docker_compose_up(DockerCommand):
    """:docker_compose_up """
    RUN_MESSAGE = "Spinning up docker composition"
    DOCKER_ARGS = ["up", "-d"]


class blank(Command):
    # The so-called doc-string of the class will be visible in the built-in
    # help that is accessible by typing "?c" inside ranger.
    """:blank <filename>

    A simple command that blanks out a file
    """

    # The execute method is called when you run this command in ranger.
    def execute(self):
        # self.arg(1) is the first (space-separated) argument to the function.
        # This way you can write ":my_edit somefilename<ENTER>".
        if self.arg(1):
            # self.rest(1) contains self.arg(1) and everything that follows
            target_filename = self.rest(1)
        else:
            # self.fm is a ranger.core.filemanager.FileManager object and gives
            # you access to internals of ranger.
            # self.fm.thisfile is a ranger.container.file.File object and is a
            # reference to the currently selected file.
            target_filename = self.fm.thisfile.path

        # This is a generic function to print text in ranger.
        self.fm.notify("blanking out " + target_filename)

        # Using bad=True in fm.notify allows you to print error messages:
        if not os.path.exists(target_filename):
            self.fm.notify("The given file does not exist!", bad=True)
            return

        # This executes a function from ranger.core.acitons, a module with a
        # variety of subroutines that can help you construct commands.
        # Check out the source, or run "pydoc ranger.core.actions" for a list.
        with open(target_filename, 'w') as file:
            file.write("")

    # The tab method is called when you press tab, and should return a list of
    # suggestions that the user will tab through.
    # tabnum is 1 for <TAB> and -1 for <S-TAB> by default
    def tab(self, tabnum):
        # This is a generic tab-completion function that iterates through the
        # content of the current directory.
        return self._tab_directory_content()
