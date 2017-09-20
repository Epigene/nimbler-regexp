require "nimbler_regexp/version"
require "ffi"

module NimblerRegexp
  def self.root
    Pathname.new(File.expand_path('../..', __FILE__))
  end

  def self.ruby_platfrom_string
    RUBY_PLATFORM
  end

  def self.function_binary_path
    case ruby_platfrom_string
    when %r'64.*linux'i
      NimblerRegexp.root + "binaries/linux64.so"
    when %r'darwin'i
      NimblerRegexp.root + "binaries/mac64.so"
    else
      abort("Running on #{ruby_platfrom_string} for which there are no Nim functions included, sorry!")
    end
  end

  extend FFI::Library
  ffi_lib(function_binary_path.to_s)
  attach_function(:is_regexp_match, [ :string, :string ], :bool)
end
