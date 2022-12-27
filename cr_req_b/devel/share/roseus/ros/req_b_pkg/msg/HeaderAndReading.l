;; Auto-generated. Do not edit!


(when (boundp 'req_b_pkg::HeaderAndReading)
  (if (not (find-package "REQ_B_PKG"))
    (make-package "REQ_B_PKG"))
  (shadow 'HeaderAndReading (find-package "REQ_B_PKG")))
(unless (find-package "REQ_B_PKG::HEADERANDREADING")
  (make-package "REQ_B_PKG::HEADERANDREADING"))

(in-package "ROS")
;;//! \htmlinclude HeaderAndReading.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass req_b_pkg::HeaderAndReading
  :super ros::object
  :slots (_header _angles _sensors_data _pose _twist ))

(defmethod req_b_pkg::HeaderAndReading
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:angles __angles) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:sensors_data __sensors_data) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:pose __pose) (instance geometry_msgs::PoseWithCovariance :init))
    ((:twist __twist) (instance geometry_msgs::TwistWithCovariance :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _angles __angles)
   (setq _sensors_data __sensors_data)
   (setq _pose __pose)
   (setq _twist __twist)
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
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:twist
   (&rest __twist)
   (if (keywordp (car __twist))
       (send* _twist __twist)
     (progn
       (if __twist (setq _twist (car __twist)))
       _twist)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64[] _angles
    (* 8    (length _angles)) 4
    ;; float64[] _sensors_data
    (* 8    (length _sensors_data)) 4
    ;; geometry_msgs/PoseWithCovariance _pose
    (send _pose :serialization-length)
    ;; geometry_msgs/TwistWithCovariance _twist
    (send _twist :serialization-length)
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
     ;; geometry_msgs/PoseWithCovariance _pose
       (send _pose :serialize s)
     ;; geometry_msgs/TwistWithCovariance _twist
       (send _twist :serialize s)
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
   ;; geometry_msgs/PoseWithCovariance _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; geometry_msgs/TwistWithCovariance _twist
     (send _twist :deserialize buf ptr-) (incf ptr- (send _twist :serialization-length))
   ;;
   self)
  )

(setf (get req_b_pkg::HeaderAndReading :md5sum-) "e4192da5cbce5c6aa57f03ea8780bdfb")
(setf (get req_b_pkg::HeaderAndReading :datatype-) "req_b_pkg/HeaderAndReading")
(setf (get req_b_pkg::HeaderAndReading :definition-)
      "Header header
float64[] angles
float64[] sensors_data

geometry_msgs/PoseWithCovariance pose
geometry_msgs/TwistWithCovariance twist

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
MSG: geometry_msgs/PoseWithCovariance
# This represents a pose in free space with uncertainty.

Pose pose

# Row-major representation of the 6x6 covariance matrix
# The orientation parameters use a fixed-axis representation.
# In order, the parameters are:
# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
float64[36] covariance

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/TwistWithCovariance
# This expresses velocity in free space with uncertainty.

Twist twist

# Row-major representation of the 6x6 covariance matrix
# The orientation parameters use a fixed-axis representation.
# In order, the parameters are:
# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
float64[36] covariance

================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

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



(provide :req_b_pkg/HeaderAndReading "e4192da5cbce5c6aa57f03ea8780bdfb")


