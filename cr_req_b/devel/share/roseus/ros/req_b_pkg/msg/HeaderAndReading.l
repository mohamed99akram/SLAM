;; Auto-generated. Do not edit!


(when (boundp 'req_b_pkg::HeaderAndReading)
  (if (not (find-package "REQ_B_PKG"))
    (make-package "REQ_B_PKG"))
  (shadow 'HeaderAndReading (find-package "REQ_B_PKG")))
(unless (find-package "REQ_B_PKG::HEADERANDREADING")
  (make-package "REQ_B_PKG::HEADERANDREADING"))

(in-package "ROS")
;;//! \htmlinclude HeaderAndReading.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass req_b_pkg::HeaderAndReading
  :super ros::object
  :slots (_header _sensors_data _x _y _th ))

(defmethod req_b_pkg::HeaderAndReading
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:sensors_data __sensors_data) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:th __th) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _sensors_data __sensors_data)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _th (float __th))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:sensors_data
   (&optional __sensors_data)
   (if __sensors_data (setq _sensors_data __sensors_data)) _sensors_data)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:th
   (&optional __th)
   (if __th (setq _th __th)) _th)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64[] _sensors_data
    (* 8    (length _sensors_data)) 4
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _th
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64[] _sensors_data
     (write-long (length _sensors_data) s)
     (dotimes (i (length _sensors_data))
       (sys::poke (elt _sensors_data i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _th
       (sys::poke _th (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64[] _sensors_data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sensors_data (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _sensors_data i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _th
     (setq _th (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get req_b_pkg::HeaderAndReading :md5sum-) "a6826ae3bb61eb4a4d97f1f78b84604c")
(setf (get req_b_pkg::HeaderAndReading :datatype-) "req_b_pkg/HeaderAndReading")
(setf (get req_b_pkg::HeaderAndReading :definition-)
      "Header header
float64[] sensors_data
float64 x
float64 y
float64 th 
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :req_b_pkg/HeaderAndReading "a6826ae3bb61eb4a4d97f1f78b84604c")


