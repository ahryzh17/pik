module Pik

  class Refresh < Command
        
    it 'Refreshes the pik configuration file.'
    include ConfigFileEditor

    def execute
      old_config = @config.dup
      @config.clear
      adder = Pik::Add.new([], @config)
      old_config.each do |version,hash|
        adder.add(hash[:path])
      end 
    end

  end

end