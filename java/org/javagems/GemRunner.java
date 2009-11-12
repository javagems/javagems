package org.javagems;

class GemRunner {
  public static final String[] rubyOpts = {"-e", "require 'org/javagems/javagems'"};
  
  public static void main(String[] args) {
    String[] concatenatedOpts = new String[rubyOpts.length + args.length];
    
    System.arraycopy(rubyOpts, 0, concatenatedOpts, 0, rubyOpts.length);
    System.arraycopy(args, 0, concatenatedOpts, rubyOpts.length, args.length);
    
    org.jruby.Main.main(concatenatedOpts);
  }
}
