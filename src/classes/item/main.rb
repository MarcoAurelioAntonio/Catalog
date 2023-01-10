require_relative 'app'

def main
  system('cls') # for windows
  system('clear') # for linux
  puts '*************************************************'
  puts '*** Hi there! this is a Catalog Of My Things! ***'
  puts '*************************************************'
  app = App.new
  app.run
end

main
