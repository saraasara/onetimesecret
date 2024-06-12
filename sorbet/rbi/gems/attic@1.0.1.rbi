# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `attic` gem.
# Please instead update this file by running `bin/tapioca gem attic`.


# = Attic
#
# == Usage:
#
#  require 'attic'
#  class MyClass
#    include Attic
#    attic :name, :age
#  end
#
#  obj = MyClass.new
#  obj.attic.nickname = 'My Classic Automobile'
#  obj.attic.secret_age  = 27
#
#  obj.nickname      #=> 'My Classic Automobile'
#  obj.secret_age    #=> 27
#  obj.to_h          #=> {}
#
#    OR
#
#  require 'attic'
#  Attic.construct MyClass, :nickname, :secret_age
#
#
# == Description:
#
# Attic is a module that allows you to store instance variables
# in a dedicated singleton class. This is useful for storing
# instance variables that you don't want to be available to
# the public interface of your class. e.g. you want to store
# a value for the running instance but want to prevent it
# from being serialized.
#
# == Why?
#
# == Important Notes:
#
# Some objects just straight up are not capable of contructing
# an attic. `Symbols`, `Integers`, and `Floats` specifically do not
# have a dedicated singleton classes. These are what ruby
# internals refer to as "immediate values". They're special
# in that they are not objects in the traditional sense.
# They're just values (they're not even instances of a
# class 😮‍💨).
#
# When you call attic on an immediate value you get an error.
#
# :sym.attic       #=> raises NoSingleton error
# 1.attic          #=> Ditto
# 1.0.1.attic      #=> Ditto again
#
#
# The other objects that do not have singleton classes are
# `true`, `false`, and `nil`. Calling attic on these don't
# raise an error but they simply return their class. This
# is because they are all instances of their same singleton
# class.
#
# true.attic       #=> TrueClass
# false.attic      #=> FalseClass
# nil.attic        #=> NilClass
#
# Note: this means that every instance of nil
# returns the exact same singleton class. This is different
# from the behaviour of all other objects.
#
# nil.attic.object_id   #=> 800
# nil.attic.object_id   #=> 800
#
#
# NilClass, TrueClass, and FalseClass on the otherhand each
# have their own singleton class. Calling attic on these
# returns the singleton class for each of them. But again
# a singleton class for each of them but again they all
#
# TrueClass.attic  #=> #<Class:TrueClass>
# FalseClass.attic #=> #<Class:FalseClass>
# NilClass.attic   #=> #<Class:NilClass>
#
#
# For comparison, here's what happens with a String (each
# time attic is called on a new string you get a new
# singleton)
#
# "".attic         #=> #<Class:#<String:0x0001234>>
# "".attic         #=> #<Class:#<String:0x0005678>>
# "".attic.object_id #=> 1234
# "".attic.object_id #=> 5678
#
# nil.attic        #=> NilClass
# nil.attic        #=> NilClass
# nil.attic.object_id #=> 800
# nil.attic.object_id #=> 800
#
# source://attic//lib/attic/class_methods.rb#4
module Attic
  # A class method for defining variables to store in the attic.
  # * +names+ is a list of variables names. Accessor methods are
  #   created for each variable name in the list.
  #
  # Returns an Array of all attic variables for the current
  # class unless no arguments are given in which case it
  # returns its singleton.
  #
  # e.g.
  #
  #     String.extend Attic
  #     String.attic :timestamp
  #
  # In this example, attic created two instance methods:
  # * <tt>String#timestamp</tt> for getting the value
  # * <tt>String#timestamp</tt> for setting the value
  #
  # source://attic//lib/attic.rb#182
  def attic(*names); end

  # @return [Boolean]
  #
  # source://attic//lib/attic.rb#206
  def attic?; end

  # @return [Boolean]
  #
  # source://attic//lib/attic.rb#229
  def attic_variable?(name); end

  # Returns an Array of attic variables for the current class.
  # e.g.
  #
  #     String.extend Attic
  #     String.attic :timestamp
  #     String.attic_variables     # => [:timestamp]
  #
  # source://attic//lib/attic.rb#223
  def attic_variables; end

  class << self
    # A convenince method at the class level for including
    # ConstructMethods in the given object specifically.
    #
    #   e.g.
    #
    #     Add Attic support to all objects available now and
    #     in the future:
    #
    #       Attic.construct(Object)
    #
    #     which is equivalent to:
    #
    #       class Object; include Attic::ClassMethods; end
    #
    # source://attic//lib/attic.rb#119
    def construct(obj); end

    # @private
    #
    # source://attic//lib/attic.rb#129
    def extended(obj); end

    # Friendly exception to say we're not to be included
    #
    # @raise [RuntimeError]
    #
    # source://attic//lib/attic.rb#125
    def included(obj); end
  end
end

# Adds a few methods for accessing the metaclass of an
# object. We do this with great caution since the Object
# class is as global as it gets in Ruby.
#
# source://attic//lib/attic/class_methods.rb#8
module Attic::ClassMethods
  # source://attic//lib/attic/class_methods.rb#34
  def attic(name = T.unsafe(nil)); end

  # A quick way to check if the current object already has a
  # dedicated singleton class. We want to know this because
  # this is where our attic variables will be stored.
  #
  # @return [Boolean]
  #
  # source://attic//lib/attic/class_methods.rb#15
  def attic?; end

  # @return [Boolean]
  #
  # source://attic//lib/attic/class_methods.rb#47
  def attic_variable?(name); end

  # source://attic//lib/attic/class_methods.rb#58
  def attic_variable_get(name); end

  # source://attic//lib/attic/class_methods.rb#51
  def attic_variable_set(name, val); end

  # A list of all the attic variables defined for this class.
  #
  # source://attic//lib/attic/class_methods.rb#10
  def attic_variables; end

  protected

  # source://attic//lib/attic/class_methods.rb#64
  def normalize(name); end
end

# Adds a few methods for object instances to access the
# attic variables of their class.
#
# source://attic//lib/attic/instance_methods.rb#8
module Attic::InstanceMethods
  # source://attic//lib/attic/instance_methods.rb#10
  def attic; end

  # A quick way to check if this object instance already has a
  # dedicated singleton class. We like to know this upfront
  # because this is where our attic variables are to be stored.
  #
  # @return [Boolean]
  #
  # source://attic//lib/attic/instance_methods.rb#22
  def attic?; end

  # @return [Boolean]
  #
  # source://attic//lib/attic/instance_methods.rb#50
  def attic_variable?(name); end

  # source://attic//lib/attic/instance_methods.rb#60
  def attic_variable_get(name); end

  # @raise [FrozenError]
  #
  # source://attic//lib/attic/instance_methods.rb#54
  def attic_variable_set(name, val); end

  # source://attic//lib/attic/instance_methods.rb#46
  def attic_variables; end
end

# source://attic//lib/attic.rb#103
Attic::VERSION = T.let(T.unsafe(nil), String)

# source://attic//lib/attic/errors.rb#6
class NoMetaClass < ::RuntimeError; end

# = NoSingletonError
#
# This error is raised when an attempt is made to access the
# attic of an object which does not have a singleton class.
#
# This is a TypeError because it is not an exceptional
# condition. It is simply a condition that is not supported
# by the Attic module.
#
# == Usage
#
#   require 'attic'
#   class MyClass
#     include Attic
#     attic :name, :age
#   end
#
# source://attic//lib/attic/errors.rb#26
class NoSingletonError < ::TypeError
  class << self
    # source://attic//lib/attic/errors.rb#51
    def add_member(obj); end

    # Check if the given object is a member of the NoSingleton
    # members list. This checks for the object itself and all
    # of its ancestors. See the docs for `Enumerable#===` for
    # more details.
    #
    # @return [Boolean]
    #
    # source://attic//lib/attic/errors.rb#47
    def member?(obj); end
  end
end

# A Set of classes which do not have singleton classes
# (i.e. meta classes). This is used to prevent an exception
# the first time an attic is accessed. It's populated
# dynamically at start time by simply checking whether
# the object has a singleton. This only needs to be
# done once per class.
#
# We use a set here to avoid having to deal with duplicate
# values. Realistically there are only a few classes that
# do not have singleton classes. We could hard code them
# here which is not lost on us.
#
# source://attic//lib/attic/errors.rb#40
NoSingletonError::MEMBERS = T.let(T.unsafe(nil), Set)