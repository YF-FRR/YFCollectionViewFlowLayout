

Pod::Spec.new do |s|


  s.name         = "YFCollectionViewAutoFlowLayout"
  s.version      = "1.2.0"
  s.summary      = "自定义流水布局是实现自己想要的布局"

  s.description  = <<-DESC
                自定义流水布局,根据不同的属性实现自己想要的布局
                   DESC

  s.homepage     = "https://github.com/YFXPP/YFCollectionViewFlowLayout/tree/master/YFCollectionViewAutoFlowLayout"

  s.license      = "MIT"


  s.author             = { "ios_yangfei" => "YangeFei" }
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/YFXPP/YFCollectionViewFlowLayout.git", :tag => "#{s.version}" }

  s.source_files  = "YFCollectionViewAutoFlowLayout", "YFCollectionViewAutoFlowLayout/**/*.{h,m}"
  s.exclude_files = ""


end
