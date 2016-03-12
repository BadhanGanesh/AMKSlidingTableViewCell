Pod::Spec.new do |s|
  s.name         = "AMKSlidingTableViewCell"
  s.version      = "1.0.0"
  s.summary      = "An iOS 8+ compatible sliding table view cell that adds sliding behaviours with 3d transforms."
  s.description  = "Allows any view to be hidden under a foreground view inside a table cell."
  s.homepage     = "https://github.com/PublicStaticVoidMain/MKSlidingTableViewCell"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Andrzej Michnia" => "amichnia@gmail.com", "Michael Kirk" => "michael.winter.kirk@gmail.com", "Sam Corder" => "sam.corder@gmail.com" }
  s.platform     = :ios, '8.0'
  s.source       = { :git => "https://github.com/amichnia/AMKSlidingTableViewCell.git" }
  s.source_files  = 'MKSlidingTableViewCell/Source'
  s.requires_arc = true
end
