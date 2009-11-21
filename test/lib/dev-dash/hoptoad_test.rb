# require File.dirname(__FILE__) << "/../../test_helper"

class HoptoadTest < Test::Unit::TestCase

  def setup
    @ht = DevDash::Hoptoad.new
    @ht.file_path = File.dirname(__FILE__) << '/../../fixtures/hoptoad.xml'
  end
  
  def do_fetch
    @ht.fetch    
  end
  
  def test_fetch
    assert @ht.fetch
  end
  
  def test_fetch_grabs_error_groups
    do_fetch
    
    assert_equal Array, @ht.errors.class
    assert !@ht.errors.empty?
  end

  def test_display
    crack_display = Crack::XML.parse File.read(@ht.file_path)
    
    yaml_display = crack_display.to_yaml
  
    assert_equal yaml_display, @ht.display
  end

end