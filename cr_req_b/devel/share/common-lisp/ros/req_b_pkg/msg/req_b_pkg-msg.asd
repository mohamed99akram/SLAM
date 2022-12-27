
(cl:in-package :asdf)

(defsystem "req_b_pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "HeaderAndReading" :depends-on ("_package_HeaderAndReading"))
    (:file "_package_HeaderAndReading" :depends-on ("_package"))
  ))