class Profile < ApplicationRecord

  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.


  FACE_URL=[
      "https://us-mc-test-asset.oss-us-west-1.aliyuncs.com/mc-official/images/demo/demo-pic6.jpg",
      "https://us-mc-test-asset.oss-us-west-1.aliyuncs.com/mc-official/images/demo/demo-pic7.jpg",
      "https://us-mc-test-asset.oss-us-west-1.aliyuncs.com/mc-official/images/demo/demo-pic8.jpg",
      "https://us-mc-test-asset.oss-us-west-1.aliyuncs.com/mc-official/images/demo/demo-pic10.jpg",
      "https://us-mc-test-asset.oss-us-west-1.aliyuncs.com/mc-official/images/demo/demo-pic11.jpg"
  ]
end
