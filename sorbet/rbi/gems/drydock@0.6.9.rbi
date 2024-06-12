# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `drydock` gem.
# Please instead update this file by running `bin/tapioca gem drydock`.


# source://drydock//lib/drydock/console.rb#9
module Console
  extend ::Console

  # source://drydock//lib/drydock/console.rb#122
  def height; end

  # source://drydock//lib/drydock/console.rb#88
  def print_at(str, props = T.unsafe(nil)); end

  # source://drydock//lib/drydock/console.rb#83
  def print_center(str, props = T.unsafe(nil)); end

  # source://drydock//lib/drydock/console.rb#59
  def print_left(str, props = T.unsafe(nil)); end

  # source://drydock//lib/drydock/console.rb#65
  def print_right(str, props = T.unsafe(nil)); end

  # source://drydock//lib/drydock/console.rb#71
  def print_spaced(*args); end

  # source://drydock//lib/drydock/console.rb#114
  def reset; end

  # @return [Boolean]
  #
  # source://drydock//lib/drydock/console.rb#54
  def valid_color?(colour); end

  # @return [Boolean]
  #
  # source://drydock//lib/drydock/console.rb#54
  def valid_colour?(colour); end

  # source://drydock//lib/drydock/console.rb#118
  def width; end

  class << self
    # source://drydock//lib/drydock/console.rb#110
    def clear; end

    # source://drydock//lib/drydock/console.rb#102
    def style(col, bgcol = T.unsafe(nil), att = T.unsafe(nil)); end
  end
end

# ANSI escape sequence numbers for text attributes
#
# source://drydock//lib/drydock/console.rb#15
Console::ATTRIBUTES = T.let(T.unsafe(nil), Hash)

# ANSI escape sequence numbers for background colours
#
# source://drydock//lib/drydock/console.rb#41
Console::BGCOLOURS = T.let(T.unsafe(nil), Hash)

# ANSI escape sequence numbers for text colours
#
# source://drydock//lib/drydock/console.rb#27
Console::COLOURS = T.let(T.unsafe(nil), Hash)

# source://drydock//lib/drydock/console.rb#127
module Cursor
  extend ::Cursor

  # source://drydock//lib/drydock/console.rb#193
  def clear_line; end

  # source://drydock//lib/drydock/console.rb#169
  def down(n = T.unsafe(nil)); end

  # source://drydock//lib/drydock/console.rb#177
  def left(x = T.unsafe(nil)); end

  # source://drydock//lib/drydock/console.rb#181
  def line(n = T.unsafe(nil)); end

  # source://drydock//lib/drydock/console.rb#160
  def move=(*args); end

  # Returns [x,y] for the current cursor position.
  #
  # source://drydock//lib/drydock/console.rb#131
  def position; end

  # source://drydock//lib/drydock/console.rb#189
  def restore; end

  # source://drydock//lib/drydock/console.rb#173
  def right(x = T.unsafe(nil)); end

  # source://drydock//lib/drydock/console.rb#185
  def save; end

  # source://drydock//lib/drydock/console.rb#165
  def up(n = T.unsafe(nil)); end

  # source://drydock//lib/drydock/console.rb#157
  def x; end

  # source://drydock//lib/drydock/console.rb#158
  def y; end
end

# Drydock is a DSL for command-line apps.
# See bin/example for usage examples.
#
# source://drydock//lib/drydock.rb#6
module Drydock
  extend ::Drydock

  # Provide a description for a command
  #
  # source://drydock//lib/drydock.rb#706
  def about(txt); end

  # Define a command-specific action.
  #
  # This is functionally very similar to option, but with an exciting and buoyant twist:
  # Drydock keeps track of actions for each command (in addition to treating it like an option).
  # When an action is specified on the command line Drydock looks for command_action or
  # action_command methods in the command class.
  #
  #     action :E, :eat, "Eat something"
  #     command :oysters => Fresh::Oysters
  #
  #     # Drydock will look for Fresh::Oysters#eat_oysters and Fresh::Oysters#oysters_eat.
  #
  # source://drydock//lib/drydock.rb#593
  def action(*args, &b); end

  # Define a block to be called after the command.
  # This is useful for stopping, closing, etc... the stuff in the before block.
  #
  # source://drydock//lib/drydock.rb#507
  def after(&b); end

  # Used to create an alias to a defined command.
  # Here's an example:
  #
  #    command :task do; ...; end
  #    alias_command :pointer, :task
  #
  # Either name can be used on the command-line:
  #
  #    $ yourscript task [options]
  #    $ yourscript pointer [options]
  #
  # Inside of the command definition, you have access to the
  # command name that was used via obj.alias.
  #
  # source://drydock//lib/drydock.rb#667
  def alias_command(aliaz, cmd); end

  # Provide names for CLI arguments, in the order they appear.
  #
  #     $ yourscript sample malpeque zinqy
  #     argv :name, :flavour
  #     command :sample do |obj|
  #       obj.argv.name        # => malpeque
  #       obj.argv.flavour     # => zinqy
  #     end
  #
  # source://drydock//lib/drydock.rb#421
  def argv(*args); end

  # Define a block to be called before the command.
  # This is useful for opening database connections, etc...
  #
  # source://drydock//lib/drydock.rb#501
  def before(&b); end

  # Canonizes a string (+cmd+) to the symbol for command names
  # '-' is replaced with '_'
  #
  # source://drydock//lib/drydock.rb#784
  def canonize(cmd); end

  # source://drydock//lib/drydock.rb#764
  def capture(io); end

  # @return [Boolean]
  #
  # source://drydock//lib/drydock.rb#772
  def capture?; end

  # Capture STDOUT or STDERR to prevent it from being printed.
  #
  #    capture(:stdout) do
  #      ...
  #    end
  #
  # source://drydock//lib/drydock.rb#803
  def capture_io(stream, &block); end

  # source://drydock//lib/drydock.rb#768
  def captured; end

  # Define a command.
  #
  #     command :task do
  #       ...
  #     end
  #
  # A custom command class can be specified using Hash syntax. The class
  # must inherit from Drydock::Command (class CustomeClass < Drydock::Command)
  #
  #     command :task => CustomCommand do
  #       ...
  #     end
  #
  # source://drydock//lib/drydock.rb#611
  def command(*cmds, &b); end

  # Returns true if a command with the name +cmd+ has been defined.
  #
  # @return [Boolean]
  #
  # source://drydock//lib/drydock.rb#777
  def command?(cmd); end

  # Identical to +alias_command+ with reversed arguments.
  # For whatever reason I forget the order so Drydock supports both.
  # Tip: the argument order matches the method name.
  #
  # source://drydock//lib/drydock.rb#675
  def command_alias(cmd, aliaz); end

  # An array of the currently defined commands names
  #
  # source://drydock//lib/drydock.rb#686
  def command_names; end

  # A hash of the currently defined Drydock::Command objects
  #
  # source://drydock//lib/drydock.rb#681
  def commands; end

  # Enable or disable debug output.
  #
  #     debug :on
  #     debug :off
  #
  # Calling without :on or :off will toggle the value.
  #
  # source://drydock//lib/drydock.rb#398
  def debug(toggle = T.unsafe(nil)); end

  # Returns true if debug output is enabled.
  #
  # @return [Boolean]
  #
  # source://drydock//lib/drydock.rb#408
  def debug?; end

  # Returns a string version of +cmd+, decanonized.
  # Lowercase, '_' is replaced with '-'
  #
  # source://drydock//lib/drydock.rb#792
  def decanonize(cmd); end

  # Define a default command. You can specify a command name that has
  # been or will be defined in your script:
  #
  #     default :task
  #
  # Or you can supply a block which will be used as the default command:
  #
  #     default do |obj|            # This command will be named "default"
  #       # ...
  #     end
  #
  #     default :hullinspector do   # This one will be named "hullinspector"
  #       # ...
  #     end
  #
  # If +with_args+ is specified, the default command will receive all unknown
  # values as arguments. This is necessary to define explicitly because drydock
  # parses arguments expecting a command name. If the default command accepts
  # arguments and with_args is not specified, drydock will raise an unknown
  # command exception for the first argument.
  #
  # source://drydock//lib/drydock.rb#468
  def default(cmd = T.unsafe(nil), with_args = T.unsafe(nil), &b); end

  # Is +cmd+ the default command?
  #
  # @return [Boolean]
  #
  # source://drydock//lib/drydock.rb#478
  def default?(cmd); end

  # @return [Boolean]
  #
  # source://drydock//lib/drydock.rb#484
  def default_with_args?; end

  # Deprecated. Use about.
  #
  # source://drydock//lib/drydock.rb#712
  def desc(txt); end

  # Define a global option. See +option+ for more info.
  #
  # source://drydock//lib/drydock.rb#539
  def global(*args, &b); end

  # Define a global option. See +option+ for more info.
  #
  # source://drydock//lib/drydock.rb#539
  def global_option(*args, &b); end

  # Define the default global usage banner. This is displayed
  # with "script -h".
  #
  # source://drydock//lib/drydock.rb#513
  def global_usage(msg); end

  # Return true if a command has been executed.
  #
  # @return [Boolean]
  #
  # source://drydock//lib/drydock.rb#730
  def has_run?; end

  # Tell the Drydock parser to ignore something.
  # Drydock will currently only listen to you if you tell it to "ignore :options",
  # otherwise it will ignore you!
  #
  # +what+ the thing to ignore. When it equals :options Drydock will not parse
  # the command-specific arguments. It will pass the arguments directly to the
  # Command object. This is useful when you want to parse the arguments in some a way
  # that's too crazy, dangerous for Drydock to handle automatically.
  #
  # source://drydock//lib/drydock.rb#534
  def ignore(what = T.unsafe(nil)); end

  # Define a command-specific option.
  #
  # +args+ is passed directly to OptionParser.on so it can contain anything
  # that's valid to that method. If a class is included, it will tell
  # OptionParser to expect a value otherwise it assumes a boolean value.
  # Some examples:
  #
  #     option :h, :help, "Displays this message"
  #     option '-l x,y,z', '--lang=x,y,z', Array, "Requested languages"
  #
  #     You can also supply a block to fiddle with the values. The final
  #     value becomes the option's value:
  #
  #     option :m, :max, Integer, "Maximum threshold" do |v|
  #       v = 100 if v > 100
  #       v
  #     end
  #
  # All calls to +option+ must come before the command they're associated
  # to. Example:
  #
  #     option :t, :tasty,          "A boolean switch"
  #     option     :reason, String, "Requires a parameter"
  #     command :task do |obj|;
  #       obj.options.tasty       # => true
  #       obj.options.reason      # => I made the sandwich!
  #     end
  #
  # When calling your script with a specific command-line option, the value
  # is available via obj.longname inside the command block.
  #
  # source://drydock//lib/drydock.rb#576
  def option(*args, &b); end

  # The project name. This is currently only used when printing
  # list of commands (see: Drydock::Command#show_commands). It may be
  # used elsewhere in the future.
  #
  # source://drydock//lib/drydock.rb#429
  def project(txt = T.unsafe(nil)); end

  # Has the project been set?
  #
  # @return [Boolean]
  #
  # source://drydock//lib/drydock.rb#443
  def project?; end

  # Execute the given command.
  # By default, Drydock automatically executes itself and provides handlers for known errors.
  # You can override this functionality by calling +Drydock.run!+ yourself. Drydock
  # will only call +run!+ once.
  #
  # source://drydock//lib/drydock.rb#738
  def run!(argv = T.unsafe(nil), stdin = T.unsafe(nil)); end

  # Disable automatic execution (enabled by default)
  #
  #     Drydock.run = false
  #
  # source://drydock//lib/drydock.rb#725
  def run=(v); end

  # Returns true if automatic execution is enabled.
  #
  # @return [Boolean]
  #
  # source://drydock//lib/drydock.rb#718
  def run?; end

  # Define a block for processing STDIN before the command is called.
  # The command block receives the return value of this block as obj.stdin:
  #
  #     command :task do |obj|;
  #       obj.stdin   # => ...
  #     end
  #
  # If a stdin block isn't defined, +stdin+ above will be the STDIN IO handle.
  #
  # source://drydock//lib/drydock.rb#495
  def stdin(&b); end

  # The trawler catches any and all unknown commands that pass through
  # Drydock. It's like the captain of aliases.
  # +cmd+ is the name of the command to direct unknowns to.
  #
  #     trawler :command_name
  #
  # source://drydock//lib/drydock.rb#696
  def trawler(cmd); end

  # Has the trawler been set?
  #
  # @return [Boolean]
  #
  # source://drydock//lib/drydock.rb#701
  def trawler?; end

  # Define a command-specific usage banner. This is displayed
  # with "script command -h"
  #
  # source://drydock//lib/drydock.rb#519
  def usage(msg); end

  private

  # source://drydock//lib/drydock.rb#903
  def current_command_action; end

  # Grab the current list of command-specific option names. This is a list of the
  # long names.
  #
  # source://drydock//lib/drydock.rb#899
  def current_command_option_names; end

  # Returns the Drydock::Command object with the name +cmd+
  #
  # source://drydock//lib/drydock.rb#818
  def get_command(cmd); end

  # source://drydock//lib/drydock.rb#907
  def get_command_index(cmd); end

  # Grab the options parser for the current command or create it if it doesn't exist.
  # Returns an instance of OptionParser.
  #
  # source://drydock//lib/drydock.rb#913
  def get_current_option_parser; end

  # Grabs the options parser for the given command.
  # +arg+ can be an index or command name.
  # Returns an instance of OptionParser.
  #
  # source://drydock//lib/drydock.rb#920
  def get_option_parser(arg); end

  # Processes calls to option and global_option. Symbols are converted into
  # OptionParser style strings (:h and :help become '-h' and '--help').
  #
  # source://drydock//lib/drydock.rb#825
  def option_parser(args = T.unsafe(nil), &b); end

  # Split the +argv+ array into global args and command args and
  # find the command name.
  # i.e. ./script -H push -f (-H is a global arg, push is the command, -f is a command arg)
  # returns [global_options, cmd, command_options, argv]
  #
  # source://drydock//lib/drydock.rb#860
  def process_arguments(argv = T.unsafe(nil)); end
end

# source://drydock//lib/drydock.rb#43
class Drydock::ArgError < ::RuntimeError
  # @return [ArgError] a new instance of ArgError
  #
  # source://drydock//lib/drydock.rb#45
  def initialize(*args); end

  # Returns the value of attribute arg.
  #
  # source://drydock//lib/drydock.rb#44
  def arg; end

  # Returns the value of attribute cmd.
  #
  # source://drydock//lib/drydock.rb#44
  def cmd; end

  # source://drydock//lib/drydock.rb#51
  def message; end

  # Returns the value of attribute msg.
  #
  # source://drydock//lib/drydock.rb#44
  def msg; end

  # source://drydock//lib/drydock.rb#52
  def usage; end
end

# The base class for all command objects. There is an instance of this class
# for every command defined. Global and command-specific options are added
# as attributes to this class dynamically.
#
#     i.e. "example -v select --location kumamoto"
#
#     global :v, :verbose, "I want mooooore!"
#     option :l, :location, String, "Source location"
#     command :select do |obj|
#       puts obj.global.verbose   #=> true
#       puts obj.option.location  #=> "kumamoto"
#     end
#
# You can sub-class it to create your own:
#
#     class Malpeque < Drydock::Command
#       # ... sea to it
#     end
#
# And then specify your class in the command definition:
#
#     command :eat => Malpeque do |obj|
#       # ... do stuff with your obj
#     end
#
# source://drydock//lib/drydock.rb#83
class Drydock::Command
  # The default constructor sets the short name of the command
  # and stores a reference to the block (if supplied).
  # You don't need to override this method to add functionality
  # to your custom Command classes. Define an +init+ method instead.
  # It will be called just before the block is executed.
  # +cmd+ is the short name of this command.
  # +b+ is the block associated to this command.
  #
  # @return [Command] a new instance of Command
  #
  # source://drydock//lib/drydock.rb#117
  def initialize(cmd, &b); end

  # An array of action names specified in the command definition
  #
  # source://drydock//lib/drydock.rb#101
  def actions; end

  # An array of action names specified in the command definition
  #
  # source://drydock//lib/drydock.rb#101
  def actions=(_arg0); end

  # The name used to evoke this command (it's either the canonical name or the alias used).
  #
  # source://drydock//lib/drydock.rb#90
  def alias; end

  # An instance of Drydock::FancyArray. Acts like an array of unnamed arguments
  # but also allows field names if supplied.
  #
  # source://drydock//lib/drydock.rb#104
  def argv; end

  # An instance of Drydock::FancyArray. Acts like an array of unnamed arguments
  # but also allows field names if supplied.
  #
  # source://drydock//lib/drydock.rb#104
  def argv=(_arg0); end

  # The block that will be executed when this command is evoked. If the block is nil
  # it will check if there is a method named +cmd+. If so, that will be executed.
  #
  # source://drydock//lib/drydock.rb#93
  def b; end

  # Calls the command in the following order:
  #
  # * print_header
  # * validation (if methodname_valid? exists)
  # * command block (@b)
  # * print_footer
  #
  # source://drydock//lib/drydock.rb#174
  def call; end

  # The canonical name of the command (the one used in the command definition). If you
  # inherit from this class and add a method named +cmd+, you can leave omit the block
  # in the command definition. That method will be called instead. See bin/examples.
  #
  # source://drydock//lib/drydock.rb#88
  def cmd; end

  # A friendly description of the command.
  #
  # source://drydock//lib/drydock.rb#99
  def desc; end

  # A friendly description of the command.
  #
  # source://drydock//lib/drydock.rb#99
  def desc=(_arg0); end

  # The basename of the executable or script: File.basename($0)
  #
  # source://drydock//lib/drydock.rb#108
  def executable; end

  # An OpenStruct object containing the global options specified at run-time.
  #
  # source://drydock//lib/drydock.rb#97
  def global; end

  # Returns the command name (not the alias)
  #
  # source://drydock//lib/drydock.rb#131
  def name; end

  # An OpenStruct object containing the command options specified at run-time.
  #
  # source://drydock//lib/drydock.rb#95
  def option; end

  # Prepare this command object to be called.
  #
  # Calls self.init after setting attributes (if the method exists). You can
  # implement an init method in your subclasses of Drydock::Command to handle
  # your own initialization stuff.
  #
  # <li>+cmd_str+ is the short name used to evoke this command. It will equal @cmd
  # unless an alias was used used to evoke this command.</li>
  # <li>+argv+ an array of unnamed arguments. If ignore :options was declared this</li>
  # will contain the arguments exactly as they were defined on the command-line.</li>
  # <li>+stdin+ contains the output of stdin do; ...; end otherwise it's a STDIN IO handle.</li>
  # <li>+global_options+ a hash of the global options specified on the command-line</li>
  # <li>+options+ a hash of the command-specific options specific on the command-line.</li>
  #
  # source://drydock//lib/drydock.rb#148
  def prepare(cmd_str = T.unsafe(nil), argv = T.unsafe(nil), stdin = T.unsafe(nil), global_options = T.unsafe(nil), options = T.unsafe(nil)); end

  # Print the list of available commands to STDOUT. This is used as the
  # "default" command unless another default commands is supplied. You
  # can also write your own Drydock::Command#show_commands to override
  # this default behaviour.
  #
  # The output was worked on here:
  # http://etherpad.com/SXjqQGRr8M
  #
  # source://drydock//lib/drydock.rb#256
  def show_commands; end

  # Either an IO handle to STDIN or the output of the Drydock#stdin handler.
  #
  # source://drydock//lib/drydock.rb#106
  def stdin; end

  # The name of the command
  #
  # source://drydock//lib/drydock.rb#319
  def to_s; end

  private

  # Compares the list of known actions to the list of boolean switches supplied
  # on the command line (if any).
  # <li>+options+ is a hash of the named command line arguments (created by
  # OptionParser#getopts)</li>
  # Returns an array of action names (empty if no action was supplied)
  #
  # source://drydock//lib/drydock.rb#239
  def find_action(options); end

  # <li>+meth+ The method name used to determine the name of the validation method.
  # If not supplied, the validation method is "valid?" otherwise it's "meth_valid?"</li>
  # If the command class doesn't have the given validation method, we'll just continue
  # on our way.
  #
  # Recognized validation methods are:
  #
  #     def valid?                  # if we're executing a command block
  #     def command_valid?          # if we're executing an object method
  #     def command_action_valid?   # if the main meth is command_action
  #     def action_command_valid?   # if the main meth is action_command
  #
  # This method raises a generic exception when the validation method returns false.
  # However, <strong>it's more appropriate for the validation methods to raise
  # detailed exceptions</strong>.
  #
  # source://drydock//lib/drydock.rb#227
  def run_validation(meth = T.unsafe(nil)); end
end

# source://drydock//lib/drydock.rb#84
Drydock::Command::VERSION = T.let(T.unsafe(nil), String)

# source://drydock//lib/drydock.rb#12
class Drydock::FancyArray < ::Array
  # source://drydock//lib/drydock.rb#14
  def add_field(n); end

  # Returns the value of attribute fields.
  #
  # source://drydock//lib/drydock.rb#13
  def fields; end

  # source://drydock//lib/drydock.rb#36
  def fields=(*args); end
end

# source://drydock//lib/drydock.rb#340
class Drydock::InvalidArgument < ::RuntimeError
  # @return [InvalidArgument] a new instance of InvalidArgument
  #
  # source://drydock//lib/drydock.rb#342
  def initialize(args); end

  # Returns the value of attribute args.
  #
  # source://drydock//lib/drydock.rb#341
  def args; end

  # Sets the attribute args
  #
  # @param value the value to set the attribute args to.
  #
  # source://drydock//lib/drydock.rb#341
  def args=(_arg0); end

  # source://drydock//lib/drydock.rb#345
  def message; end
end

# source://drydock//lib/drydock.rb#349
class Drydock::MissingArgument < ::Drydock::InvalidArgument
  # source://drydock//lib/drydock.rb#350
  def message; end
end

# source://drydock//lib/drydock.rb#335
class Drydock::NoCommandsDefined < ::RuntimeError
  # source://drydock//lib/drydock.rb#336
  def message; end
end

# source://drydock//lib/drydock.rb#54
class Drydock::OptError < ::Drydock::ArgError
  # source://drydock//lib/drydock.rb#55
  def message; end
end

# source://drydock//lib/drydock/screen.rb#4
module Drydock::Screen
  extend ::Drydock::Screen

  # source://drydock//lib/drydock/screen.rb#23
  def flush; end

  # source://drydock//lib/drydock/screen.rb#11
  def print(*msg); end

  # source://drydock//lib/drydock/screen.rb#17
  def puts(*msg); end
end

# source://drydock//lib/drydock.rb#326
class Drydock::UnknownCommand < ::RuntimeError
  # @return [UnknownCommand] a new instance of UnknownCommand
  #
  # source://drydock//lib/drydock.rb#328
  def initialize(name); end

  # source://drydock//lib/drydock.rb#331
  def message; end

  # Returns the value of attribute name.
  #
  # source://drydock//lib/drydock.rb#327
  def name; end
end

# source://drydock//lib/drydock.rb#361
Drydock::VERSION = T.let(T.unsafe(nil), Float)

# source://drydock//lib/drydock/mixins/object.rb#1
class Object < ::BasicObject
  include ::Kernel
  include ::PP::ObjectMixin

  # Executes tput +capnam+ with +args+. Returns true if tcap gives
  # 0 exit status and false otherwise.
  #
  #     tput :cup, 1, 4
  #     $ tput cup 1 4
  #
  # source://drydock//lib/drydock/mixins/object.rb#9
  def tput(capnam, *args); end

  # Executes tput +capnam+ with +args+. Returns the output of tput.
  #
  #     tput_val :cols  # => 16
  #     $ tput cols     # => 16
  #
  # source://drydock//lib/drydock/mixins/object.rb#18
  def tput_val(capnam, *args); end
end

# source://drydock//lib/drydock/mixins/string.rb#2
class String
  include ::Comparable

  # See colour
  #
  # source://drydock//lib/drydock/mixins/string.rb#33
  def att(a = T.unsafe(nil)); end

  # See colour
  #
  # source://drydock//lib/drydock/mixins/string.rb#24
  def bgcolor(bgcol = T.unsafe(nil)); end

  # See colour
  #
  # source://drydock//lib/drydock/mixins/string.rb#24
  def bgcolour(bgcol = T.unsafe(nil)); end

  # Shortcut for att(:bright)
  #
  # source://drydock//lib/drydock/mixins/string.rb#41
  def bright; end

  # +col+, +bgcol+, and +attribute+ are symbols corresponding
  # to Console::COLOURS, Console::BGCOLOURS, and Console::ATTRIBUTES.
  # Returns the string in the format attributes + string + defaults.
  #
  #     "MONKEY_JUNK".colour(:blue, :white, :blink)  # => "\e[34;47;5mMONKEY_JUNK\e[39;49;0m"
  #
  # source://drydock//lib/drydock/mixins/string.rb#15
  def color(col, bgcol = T.unsafe(nil), attribute = T.unsafe(nil)); end

  # +col+, +bgcol+, and +attribute+ are symbols corresponding
  # to Console::COLOURS, Console::BGCOLOURS, and Console::ATTRIBUTES.
  # Returns the string in the format attributes + string + defaults.
  #
  #     "MONKEY_JUNK".colour(:blue, :white, :blink)  # => "\e[34;47;5mMONKEY_JUNK\e[39;49;0m"
  #
  # source://drydock//lib/drydock/mixins/string.rb#15
  def colour(col, bgcol = T.unsafe(nil), attribute = T.unsafe(nil)); end

  # Returns the string with ANSI escape codes removed.
  #
  # NOTE: The non-printable attributes count towards the string size.
  # You can use this method to get the "visible" size:
  #
  #     "\e[34;47;5mMONKEY_JUNK\e[39;49;0m".noatt.size      # => 11
  #     "\e[34;47;5mMONKEY_JUNK\e[39;49;0m".size            # => 31
  #
  # source://drydock//lib/drydock/mixins/string.rb#61
  def noansi; end

  # Returns the string with ANSI escape codes removed.
  #
  # NOTE: The non-printable attributes count towards the string size.
  # You can use this method to get the "visible" size:
  #
  #     "\e[34;47;5mMONKEY_JUNK\e[39;49;0m".noatt.size      # => 11
  #     "\e[34;47;5mMONKEY_JUNK\e[39;49;0m".size            # => 31
  #
  # source://drydock//lib/drydock/mixins/string.rb#61
  def noatt; end

  # Print the string at +x+ +y+. When +minus+ is any true value
  # the length of the string is subtracted from the value of x
  # before printing.
  #
  # source://drydock//lib/drydock/mixins/string.rb#46
  def print_at(x = T.unsafe(nil), y = T.unsafe(nil), minus = T.unsafe(nil)); end

  class << self
    # source://drydock//lib/drydock/mixins/string.rb#5
    def disable_color; end

    # source://drydock//lib/drydock/mixins/string.rb#4
    def disable_colour; end

    # source://drydock//lib/drydock/mixins/string.rb#7
    def enable_color; end

    # source://drydock//lib/drydock/mixins/string.rb#6
    def enable_colour; end
  end
end

# source://drydock//lib/drydock/console.rb#222
class Window
  # @return [Window] a new instance of Window
  #
  # source://drydock//lib/drydock/console.rb#226
  def initialize(*args); end

  # Returns the value of attribute bg.
  #
  # source://drydock//lib/drydock/console.rb#223
  def bg; end

  # Sets the attribute bg
  #
  # @param value the value to set the attribute bg to.
  #
  # source://drydock//lib/drydock/console.rb#223
  def bg=(_arg0); end

  # Returns the value of attribute col.
  #
  # source://drydock//lib/drydock/console.rb#223
  def col; end

  # Sets the attribute col
  #
  # @param value the value to set the attribute col to.
  #
  # source://drydock//lib/drydock/console.rb#223
  def col=(_arg0); end

  # Execute the given block every +n+ seconds in a separate thread.
  # The lower limit for +n+ is 1 second.
  # Returns a Thread object.
  #
  # source://drydock//lib/drydock/console.rb#254
  def every_n_seconds(n); end

  # Returns the value of attribute fg.
  #
  # source://drydock//lib/drydock/console.rb#223
  def fg; end

  # Sets the attribute fg
  #
  # @param value the value to set the attribute fg to.
  #
  # source://drydock//lib/drydock/console.rb#223
  def fg=(_arg0); end

  # Returns the value of attribute height.
  #
  # source://drydock//lib/drydock/console.rb#223
  def height; end

  # Sets the attribute height
  #
  # @param value the value to set the attribute height to.
  #
  # source://drydock//lib/drydock/console.rb#223
  def height=(_arg0); end

  # source://drydock//lib/drydock/console.rb#300
  def join_threads; end

  # source://drydock//lib/drydock/console.rb#242
  def position; end

  # source://drydock//lib/drydock/console.rb#237
  def position=(x, y = T.unsafe(nil)); end

  # Returns the value of attribute row.
  #
  # source://drydock//lib/drydock/console.rb#223
  def row; end

  # Sets the attribute row
  #
  # @param value the value to set the attribute row to.
  #
  # source://drydock//lib/drydock/console.rb#223
  def row=(_arg0); end

  # Print text to the screen via +type+ every +refresh+ seconds.
  # Print the return value of the block to the screen using the
  # print_+type+ method. +refresh+ is number of seconds to wait
  # +props+ is the hash sent to print_+type+.
  # Returns a Thread object.
  #
  #     # Print the time in the upper right corner every second
  #     thread1 = Console.static(:right, 1, {:y => 0}) do
  #       Time.now.utc.strftime("%Y-%m-%d %H:%M:%S").colour(:blue, :white, :underline)
  #     end
  #
  # source://drydock//lib/drydock/console.rb#284
  def static(type, refresh = T.unsafe(nil), props = T.unsafe(nil), &b); end

  # Returns the value of attribute text.
  #
  # source://drydock//lib/drydock/console.rb#223
  def text; end

  # Sets the attribute text
  #
  # @param value the value to set the attribute text to.
  #
  # source://drydock//lib/drydock/console.rb#223
  def text=(_arg0); end

  # Returns the value of attribute threads.
  #
  # source://drydock//lib/drydock/console.rb#224
  def threads; end

  # Returns the value of attribute width.
  #
  # source://drydock//lib/drydock/console.rb#223
  def width; end

  # Sets the attribute width
  #
  # @param value the value to set the attribute width to.
  #
  # source://drydock//lib/drydock/console.rb#223
  def width=(_arg0); end

  class << self
    # source://drydock//lib/drydock/console.rb#246
    def bar(len, unit = T.unsafe(nil)); end
  end
end
