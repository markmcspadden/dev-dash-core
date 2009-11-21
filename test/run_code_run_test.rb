require File.dirname(__FILE__) << "/test_helper"

class RunCodeRunTest < Test::Unit::TestCase

  def setup
    @rcr = RunCodeRun.new
    @rcr.file_path = File.dirname(__FILE__) << '/fixtures/run_code_run.json'
  end
  
  def do_fetch
    @rcr.fetch    
  end
  
  def test_fetch
    assert @rcr.fetch
  end
  
  def test_fetch_grabs_username
    do_fetch
    
    assert_equal "markmcspadden", @rcr.username
  end
  
  def test_fetch_grabs_projects
    do_fetch
    
    assert_equal Array, @rcr.projects.class
    assert !@rcr.projects.empty?
  end
  
  def test_display
    json_display = JSON.parse File.read(@rcr.file_path)
    
    yaml_display = json_display.to_yaml
    
    puts yaml_display
    
    
    
    assert_equal yaml_display, @rcr.display
    
    
  end

end