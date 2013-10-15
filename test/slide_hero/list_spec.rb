require 'minitest_helper'

module SlideHero
  describe List do
    it "takes a block of items to list" do
      list = List.new do 
        point "A thing"
        point "another"
      end

      assert_dom_match(list.compile, '<ul><li>A thing</li><li>another</li></ul>')
    end

    it "returns an ordered list" do
      list = List.new(:ordered) do 
        point "A thing"
        point "another"
      end

      assert_dom_match(list.compile, '<ol><li>A thing</li><li>another</li></ol>')
    end

    it "supports animations" do
      list = List.new do
        point "animated!", animation: true
      end
      assert_dom_match(list.compile, '<ul>' +
        '<li class="fragment ">' +
        'animated!' + 
        '</li>' +
        '</ul>')
    end

    it "supports specific animations" do
      supported_animations = %w{grow shrink roll-in fade-out 
      highlight-red highlight-green highlight-blue}
      supported_animations.each do |animation|
        list = List.new do
          point "all the animations!", animation: animation
        end
      assert_dom_match list.compile, '<ul>' +
        "<li class=\"fragment #{animation}\">" +
        'all the animations!' + 
        '</li>' +
        '</ul>'
      end
    end
  end
end
