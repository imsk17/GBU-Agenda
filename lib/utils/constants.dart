abstract class Constants {
  static const baseUrl = 'https://gbu-api.herokuapp.com/';
  static const schoolBox = 'SchoolBox';
  static const sectionBox = 'SectionBox';
  static const timetableBox = 'TimetableBox';
  static const subjectBox = 'SubjectBox';
  static const teacherBox = 'TeacherBox';
  static const appBox = 'AppBox';
  static const timeTableFetchKey = 'LastTimetableFetchDate';
}

const Map<String, String> kDaysMap = {
  "1": "Monday",
  "2": "Tuesday",
  "3": "Wednesday",
  "4": "Thursday",
  "5": "Friday",
  "6": "Saturday"
};

const Map<int, String> kClassTimingsMap = {
  1: "08:00AM - 09:00AM",
  2: "09:00AM - 10:00AM",
  3: "10:00AM - 11:00AM",
  4: "11:00AM - 12:00 Noon",
  5: "12:00 Noon - 01:00PM",
  6: "01:00PM - 02:00PM",
  7: "02:00PM - 03:00PM",
  8: "03:00PM - 04:00PM",
  9: "04:00PM - 05:00PM",
  10: "05:00PM - 06:00PM",
};
