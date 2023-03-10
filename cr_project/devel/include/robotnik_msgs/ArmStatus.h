// Generated by gencpp from file robotnik_msgs/ArmStatus.msg
// DO NOT EDIT!


#ifndef ROBOTNIK_MSGS_MESSAGE_ARMSTATUS_H
#define ROBOTNIK_MSGS_MESSAGE_ARMSTATUS_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace robotnik_msgs
{
template <class ContainerAllocator>
struct ArmStatus_
{
  typedef ArmStatus_<ContainerAllocator> Type;

  ArmStatus_()
    : position()  {
    }
  ArmStatus_(const ContainerAllocator& _alloc)
    : position(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _position_type;
  _position_type position;





  typedef boost::shared_ptr< ::robotnik_msgs::ArmStatus_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robotnik_msgs::ArmStatus_<ContainerAllocator> const> ConstPtr;

}; // struct ArmStatus_

typedef ::robotnik_msgs::ArmStatus_<std::allocator<void> > ArmStatus;

typedef boost::shared_ptr< ::robotnik_msgs::ArmStatus > ArmStatusPtr;
typedef boost::shared_ptr< ::robotnik_msgs::ArmStatus const> ArmStatusConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robotnik_msgs::ArmStatus_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robotnik_msgs::ArmStatus_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::robotnik_msgs::ArmStatus_<ContainerAllocator1> & lhs, const ::robotnik_msgs::ArmStatus_<ContainerAllocator2> & rhs)
{
  return lhs.position == rhs.position;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::robotnik_msgs::ArmStatus_<ContainerAllocator1> & lhs, const ::robotnik_msgs::ArmStatus_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace robotnik_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::robotnik_msgs::ArmStatus_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robotnik_msgs::ArmStatus_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robotnik_msgs::ArmStatus_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robotnik_msgs::ArmStatus_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robotnik_msgs::ArmStatus_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robotnik_msgs::ArmStatus_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robotnik_msgs::ArmStatus_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d6afdd327a64a50f94a7d3a2de5435e3";
  }

  static const char* value(const ::robotnik_msgs::ArmStatus_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd6afdd327a64a50fULL;
  static const uint64_t static_value2 = 0x94a7d3a2de5435e3ULL;
};

template<class ContainerAllocator>
struct DataType< ::robotnik_msgs::ArmStatus_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robotnik_msgs/ArmStatus";
  }

  static const char* value(const ::robotnik_msgs::ArmStatus_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robotnik_msgs::ArmStatus_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Current arm position\n"
"string position\n"
;
  }

  static const char* value(const ::robotnik_msgs::ArmStatus_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robotnik_msgs::ArmStatus_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.position);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ArmStatus_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robotnik_msgs::ArmStatus_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robotnik_msgs::ArmStatus_<ContainerAllocator>& v)
  {
    s << indent << "position: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.position);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBOTNIK_MSGS_MESSAGE_ARMSTATUS_H
