data <-read.csv(file.choose())
print(data)

head(data)
tail(data)
str(data)
summary(data)
mean(data$exam_score)
median(data$exam_score)
mode(data$exam_score)
var(data$exam_score)
sd(data$exam_score)

install.packages("ggplot2")
library(ggplot2)
#hist
ggplot(data, aes(x = exam_score)) +
  geom_histogram(
    bins = 30,
    fill = "#3498DB",
    color = "white") +
  labs(
    title = "Distribution of Exam Scores",
    x = "Exam Score",
    y = "Number of Students")

#box
ggplot(data, aes(y = exam_score)) +
  geom_boxplot(fill = "#9B59B6") +
  labs(
    title = "Exam Score Distribution (Boxplot)",
    y = "Exam Score")

#Scatter Plot With Linear Regression line
ggplot(data, aes(x = hours_studied, y = exam_score)) +
  geom_point(color = "#8E44AD", size = 3) +
  geom_smooth(method = "lm", color = "black") +
  labs(
    title = "Study Hours vs Exam Score",
    x = "Study Hours",
    y = "Exam Score")

#pie
attendance_category <- ifelse(data$attendance_percent >= 75 & data$exam_score >= 35,
                              "Good Attendance & Pass",
                              ifelse(data$attendance_percent >= 75 & data$exam_score < 35,
                                     "Good Attendance & Fail",
                                     ifelse(data$attendance_percent < 75 & data$exam_score >= 35,
                                            "Low Attendance & Pass",
                                            "Low Attendance & Fail")))
attendance_table <- table(attendance_category)

pie(attendance_table,
    col = c("green", "yellow", "orange", "red"),
    main = "Attendance and Result Distribution")

#line
ggplot(data, aes(attendance_percent, exam_score)) +
  geom_line(color = "steelblue") +
  geom_point(color = "steelblue") +
  theme_minimal()

#scatter
ggplot(data, aes(hours_studied, exam_score)) +
  geom_point(color = "darkorange", size = 2) +
  theme_minimal()


