library(xml2)
library(tidyverse)
library(stringr)

xml_file <- read_xml("input.xml")
xml_file_ns <- xml_ns_strip(xml_file)


lastname_real <- xml_file_ns %>%
  xml_find_first("//patientRole/patient/name/family") %>%
  xml_text()

firstname_real <- xml_file_ns %>%
  xml_find_first("//patientRole/patient/name/given") %>%
  xml_text()

xml_string <- as.character(xml_file)

lastname <- regex(lastname_real, ignore_case = TRUE)
firstname <- regex(firstname_real, ignore_case = TRUE)

updated_xml_string <- str_replace_all(xml_string, lastname, "Smith")
updated_xml_string <- str_replace_all(updated_xml_string, firstname, "Bob")

updated_xml_file <- read_xml(updated_xml_string)

write_xml(updated_xml_file, "output.xml")