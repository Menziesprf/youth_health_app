

source("cleaning_scripts/part1_cleaning.R")

wellbeing <- scotland_survey_cleaned

wellbeing <- wellbeing %>% 
  filter(scottish_health_survey_indicator == "Mental wellbeing") %>% 
  arrange(date_code)

wellbeing_plot <- wellbeing %>% 
  ggplot(aes(x = date_code, y = mean, colour = sex, group = sex)) +
  geom_point() +
  scale_x_continuous(breaks = c(2008, 2009, 2010, 2011, 2012, 2013,
                                2014, 2015, 2016, 2017, 2018, 2019), limits = c(2010, 2019)) +
  scale_y_continuous(limits = c(40,60)) +
  geom_line() +
  labs(x = "Year", y = "WEMWBS Score (mean)", title = "Mental Wellbeing") +
  theme_light()+
  scale_colour_manual(
    values = c(
      "Male" = "Blue",
      "Female" = "Green",
      "All" = "Red"
    )) +
  theme(axis.text.x = element_text(angle = 90))


