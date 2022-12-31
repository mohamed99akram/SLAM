;; Auto-generated. Do not edit!


(when (boundp 'req_c_pkg::HeaderAndReadings)
  (if (not (find-package "REQ_C_PKG"))
    (make-package "REQ_C_PKG"))
  (shadow 'HeaderAndReadings (find-package "REQ_C_PKG")))
(unless (find-package "REQ_C_PKG::HEADERANDREADINGS")
  (make-package "REQ_C_PKG::HEADERANDREADINGS"))

(in-package "ROS")
;;//! \htmlinclude HeaderAndReadings.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass req_c_pkg::HeaderAndReadings
  :super ros::object
  :slots (_header _angles _sensors_data _poses ))

(defmethod req_c_pkg::HeaderAndReadings
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:angles __angles) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:sensors_data __sensors_data) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:poses __poses) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _angles __angles)
   (setq _sensors_data __sensors_data)
   (setq _poses __poses)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:angles
   (&optional __angles)
   (if __angles (setq _angles __angles)) _angles)
  (:sensors_data
   (&optional __sensors_data)
   (if __sensors_data (setq _sensors_data __sensors_data)) _sensors_data)
  (:poses
   (&rest __poses)
   (if (keywordp (car __poses))
       (send* _poses __poses)
     (progn
       (if __poses (setq _poses (car __poses)))
       _poses)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64[] _angles
    (* 8    (length _angles)) 4
    ;; float64[] _sensors_data
    (* 8    (length _sensors_data)) 4
    ;; geometry_msgs/Vector3[] _poses
    (apply #'+ (send-all _poses :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64[] _angles
     (write-long (length _angles) s)
     (dotimes (i (length _angles))
       (sys::poke (elt _angles i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _sensors_data
     (write-long (length _sensors_data) s)
     (dotimes (i (length _sensors_data))
       (sys::poke (elt _sensors_data i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; geometry_msgs/Vector3[] _poses
     (write-long (length _poses) s)
     (dolist (elem _poses)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64[] _angles
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _angles (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _angles i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _sensors_data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sensors_data (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _sensors_data i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; geometry_msgs/Vector3[] _poses
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _poses (let (r) (dotimes (i n) (push (instance geometry_msgs::Vector3 :init) r)) r))
     (dolist (elem- _poses)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get req_c_pkg::HeaderAndReadings :md5sum-) "b282dd3d5a07588f4f04a69f41539577")
(setf (get req_c_pkg::HeaderAndReadings :datatype-) "req_c_pkg/HeaderAndReadings")
(setf (get req_c_pkg::HeaderAndReadings :definition-)
      "Header header
float64[] angles
float64[] sensors_data

geometry_msgs/Vector3[] poses

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

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :req_c_pkg/HeaderAndReadings "b282dd3d5a07588f4f04a69f41539577")


