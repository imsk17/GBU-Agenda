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
  1: "08:30AM - 09:30AM",
  2: "09:30AM - 10:30AM",
  3: "10:30AM - 11:30AM",
  4: "11:30AM - 12:30PM",
  5: "12:30PM - 01:30PM",
  6: "01:30PM - 02:30PM",
  7: "02:30PM - 03:30PM",
  8: "03:30PM - 04:30PM",
  9: "04:30PM - 05:30PM",
  10: "05:30PM - 06:30PM",
};
