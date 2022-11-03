# ATUS 2018 2019 2020 2021
# data downloaded from ipums Oct 2022

# install.packages('ipumsr')
require(ipumsr)
require(plyr)

ddi <- read_ipums_ddi("atus_00002.xml")
data <- read_ipums_micro(ddi)


attach(data)

# I recode the levels in 2 ways - sloppy & stupid (as with SEX where there's little worry) and then with join() which should be more accurate in cases where all the listed codes might not be represented in the data

levels_n <- read.csv("levels_REGION.csv")
REGION <- as.factor(REGION)
levels_orig <- levels(REGION) 
levels_new <- join(data.frame(levels_orig),data.frame(levels_n))
levels(REGION) <- levels_new$New_Level

levels_n <- read.csv("levels_STATEFIP.csv")
STATEFIP <- as.factor(STATEFIP)
levels_orig <- levels(STATEFIP) 
levels_new <- join(data.frame(levels_orig),data.frame(levels_n))
levels(STATEFIP) <- levels_new$New_Level


METRO <- as.factor(METRO)
levels(METRO) <- c("Metropolitan, central city",
                   "Metropolitan, balance of MSA",
                   "Metropolitan, not identified",
                   "Nonmetropolitan",
                   "Not identified")

MSASIZE <- as.factor(MSASIZE)
levels(MSASIZE) <- c("Not identified or non-metropolitan",
                     "100,000 - 249,999",
                     "250,000 - 499,999",
                     "500,000 - 999,999",
                     "1,000,000 - 2,499,999",
                     "2,500,000 - 4,999,999",
                     "5,000,000+")

levels_n <- read.csv("levels_METAREA.csv")
METAREA <- as.factor(METAREA)
levels_orig <- levels(METAREA) 
levels_new <- join(data.frame(levels_orig),data.frame(levels_n))
levels(METAREA) <- levels_new$New_Level

levels_n <- read.csv("levels_FAMINCOME.csv")
FAMINCOME <- as.factor(FAMINCOME)
levels_orig <- levels(FAMINCOME) 
levels_new <- join(data.frame(levels_orig),data.frame(levels_n))
levels(FAMINCOME) <- levels_new$New_Level

is.na(HH_SIZE) <- which(HH_SIZE == 999) 

HHTENURE <- as.factor(HHTENURE)
levels(HHTENURE) <- c("Owned or being bought by a household member",
                      "Rented for cash",
                      "Occupied without payment of cash rent",
                      "NIU")

# levels_n <- read.csv("levels_HOUSETYPE.csv")
# HOUSETYPE <- as.factor(HOUSETYPE)
# levels_orig <- levels(HOUSETYPE) 
# levels_new <- join(data.frame(levels_orig),data.frame(levels_n))
# levels(HOUSETYPE) <- levels_new$New_Level


is.na(HH_NUMKIDS) <- which(HH_NUMKIDS == 99) 
# is.na(AGEYCHILD) <- which(AGEYCHILD == 999) 

# is.na(AGE) <- which((AGE == 999) | (AGE == 997) | (AGE == 996)) 

SEX <- as.factor(SEX)
levels(SEX) <- c("Male","Female")

levels_n <- read.csv("levels_RACE.csv")
RACE <- as.factor(RACE)
levels_orig <- levels(RACE) 
levels_new <- join(data.frame(levels_orig),data.frame(levels_n))
levels(RACE) <- levels_new$New_Level

levels_n <- read.csv("levels_HISPAN.csv")
HISPAN <- as.factor(HISPAN)
levels_orig <- levels(HISPAN) 
levels_new <- join(data.frame(levels_orig),data.frame(levels_n))
levels(HISPAN) <- levels_new$New_Level

levels_n <- read.csv("levels_MARST.csv")
MARST <- as.factor(MARST)
levels_orig <- levels(MARST) 
levels_new <- join(data.frame(levels_orig),data.frame(levels_n))
levels(MARST) <- levels_new$New_Level

levels_n <- read.csv("levels_YRIMMIG.csv")
YRIMMIG <- as.factor(YRIMMIG)
levels_orig <- levels(YRIMMIG) 
levels_new <- join(data.frame(levels_orig),data.frame(levels_n))
levels(YRIMMIG) <- levels_new$New_Level

CITIZEN <- as.factor(CITIZEN)
levels(CITIZEN) <- c("Native, born in United States",
                     "Native, born in Puerto Rico or U.S. Outlying Area",
                     "Native, born abroad of American parent or parents",
                     "Foreign born, U.S. citizen by naturalization",
                     "Foreign born, not a U.S. citizen",
                     "NIU")

levels_n <- read.csv("levels_BPL.csv")
BPL <- as.factor(BPL)
levels_orig <- levels(BPL) 
levels_new <- join(data.frame(levels_orig),data.frame(levels_n))
levels(BPL) <- levels_new$New_Level

# use same BPL codes
MBPL <- as.factor(MBPL)
levels_orig <- levels(MBPL) 
levels_new <- join(data.frame(levels_orig),data.frame(levels_n))
levels(MBPL) <- levels_new$New_Level

# use same BPL codes
FBPL <- as.factor(FBPL)
levels_orig <- levels(FBPL) 
levels_new <- join(data.frame(levels_orig),data.frame(levels_n))
levels(FBPL) <- levels_new$New_Level

levels_n <- read.csv("levels_RELATE.csv")
RELATE <- as.factor(RELATE)
levels_orig <- levels(RELATE) 
levels_new <- join(data.frame(levels_orig),data.frame(levels_n))
levels(RELATE) <- levels_new$New_Level

# levels_n <- read.csv("levels_GENHEALTH.csv")
# GENHEALTH <- as.factor(GENHEALTH)
# levels_orig <- levels(GENHEALTH) 
# levels_new <- join(data.frame(levels_orig),data.frame(levels_n))
# levels(GENHEALTH) <- levels_new$New_Level

levels_n <- read.csv("levels_EDUC.csv")
EDUC <- as.factor(EDUC)
levels_orig <- levels(EDUC) 
levels_new <- join(data.frame(levels_orig),data.frame(levels_n))
levels(EDUC) <- levels_new$New_Level

SCHLCOLL <- as.factor(SCHLCOLL)
levels(SCHLCOLL) <- c("Not enrolled",
                      "High school part time",
                      "High school full time",
                      "College/university part time",
                      "College/university full time",
                      "Refused",
                      "NIU")

levels_n <- read.csv("levels_VETSTAT.csv")
VETSTAT <- as.factor(VETSTAT)
levels_orig <- levels(VETSTAT) 
levels_new <- join(data.frame(levels_orig),data.frame(levels_n))
levels(VETSTAT) <- levels_new$New_Level

levels_n <- read.csv("levels_VETLAST.csv")
VETLAST <- as.factor(VETLAST)
levels_orig <- levels(VETLAST) 
levels_new <- join(data.frame(levels_orig),data.frame(levels_n))
levels(VETLAST) <- levels_new$New_Level

EMPSTAT <- as.factor(EMPSTAT)
levels(EMPSTAT) <- c("Employed - at work",
                     "Employed - absent",
                     "Unemployed - on layoff",
                     "Unemployed - looking",
                     "Not in labor force")
MULTJOBS <- as.factor(MULTJOBS)
levels(MULTJOBS) <- c("No",
                      "Yes",
                      "NIU")

levels_n <- read.csv("levels_OCC.csv")
OCC <- as.factor(OCC)
levels_orig <- levels(OCC) 
levels_new <- join(data.frame(levels_orig),data.frame(levels_n))
levels(OCC) <- levels_new$New_Level

levels_n <- read.csv("levels_IND.csv")
IND <- as.factor(IND)
levels_orig <- levels(IND) 
levels_new <- join(data.frame(levels_orig),data.frame(levels_n))
levels(IND) <- levels_new$New_Level

FULLPART <- as.factor(FULLPART)
levels(FULLPART) <- c("Full time",
                      "Part time",
                      "NIU")

is.na(UHRSWORKT) <- which((UHRSWORKT == 9999) | (UHRSWORKT == 9995)) 
UHRSWORKT <- as.numeric(UHRSWORKT)

SPOUSEPRES <- as.factor(SPOUSEPRES)
levels(SPOUSEPRES) <- c("Spouse present",
                        "Unmarried partner present",
                        "No spouse or unmarried partner present")
is.na(SPAGE) <- which((SPAGE == 999) | (SPAGE == 998) | (SPAGE == 997) | (SPAGE == 996)) 

SPSEX <- as.factor(SPSEX)
levels(SPSEX) <- c("Male",
                   "Female",
                   "NIU")

levels_n <- read.csv("levels_SPRACE.csv")
SPRACE <- as.factor(SPRACE)
levels_orig <- levels(SPRACE) 
levels_new <- join(data.frame(levels_orig),data.frame(levels_n))
levels(SPRACE) <- levels_new$New_Level

levels_n <- read.csv("levels_SPEDUC.csv")
SPEDUC <- as.factor(SPEDUC)
levels_orig <- levels(SPEDUC) 
levels_new <- join(data.frame(levels_orig),data.frame(levels_n))
levels(SPEDUC) <- levels_new$New_Level

# AGE SPAGE USLHR
AGE <- as.numeric(AGE)
SPAGE <- as.numeric(SPAGE)
# note Persons aged 80-84 are assigned a code of 80 and persons age 85+ are assigned a code of 85


dat_ATUS <- data.frame(CASEID,YEAR,REGION,STATEFIP, METRO, MSASIZE, METAREA, FAMINCOME, HH_SIZE, HHTENURE, 
                   HH_NUMKIDS, AGE, SEX, RACE, HISPAN, MARST, YRIMMIG, CITIZEN, BPL, MBPL, FBPL, RELATE, 
                   EDUC, SCHLCOLL, VETSTAT, VETLAST, EMPSTAT, MULTJOBS, OCC, IND, FULLPART, UHRSWORKT, EARNWEEK, 
                   SPOUSEPRES, SPAGE, SPSEX, SPRACE, SPEDUC, ACT_CAREHH, ACT_CARENHH, ACT_EDUC, ACT_FOOD, ACT_GOVSERV, 
                   ACT_HHACT, ACT_HHSERV, ACT_PCARE, ACT_PHONE, ACT_PROFSERV, ACT_PURCH, ACT_RELIG, ACT_SOCIAL, ACT_SPORTS, 
                   ACT_TRAVEL, ACT_VOL, ACT_WORK)

detach(data)

summary(dat_ATUS) # read carefully through to see if these all make sense

save(dat_ATUS, file = "ATUS_18192021.RData")

# variable labels
#   CASEID          "ATUS Case ID"
#   YEAR            "Survey year"
#   REGION          "Region"
#   STATEFIP        "FIPS State Code"
#   METRO           "Metropolitan/central city status"
#   MSASIZE         "MSA/PMSA size"
#   METAREA         "Consolidated MSA name"
#   FAMINCOME       "Family income"
#   HH_SIZE         "Number of people in household"
#   HHTENURE        "Living quarters owned, rented, or occupied without rent"
#   HH_NUMKIDS      "Number of children under 18 in household"
#   PERNUM          "Person number (general)"
#   LINENO          "Person line number"
#   WT06            "Person weight, 2006 methodology"
#   AGE             "Age"
#   SEX             "Sex"
#   RACE            "Race"
#   HISPAN          "Hispanic origin"
#   MARST           "Marital status"
#   YRIMMIG         "Year of immigration"
#   CITIZEN         "Citizenship status"
#   BPL             "Birthplace"
#   MBPL            "Mother's birthplace"
#   FBPL            "Father's birthplace"
#   RELATE          "Relationship to ATUS respondent"
#   GENHEALTH       "General health"
#   EDUC            "Highest level of school completed"
#   SCHLCOLL        "Enrollment in school or college"
#   VETSTAT         "Veteran status"
#   VETLAST         "Last period of service in armed forces"
#   EMPSTAT         "Labor force status"
#   MULTJOBS        "Has more than one job"
#   OCC             "Detailed occupation category, main job"
#   IND             "Detailed industry classification, main job"
#   FULLPART        "Full time/part time employment status"
#   UHRSWORKT       "Hours usually worked per week"
#   EARNWEEK        "Weekly earnings"
#   SPOUSEPRES      "Spouse or unmarried partner in household"
#   SPAGE           "Age of respondent's spouse or unmarried partner"
#   SPSEX           "Sex of respondent's spouse or unmarried partner"
#   SPRACE          "Race of respondent's spouse or unmarried partner"
#   SPEDUC          "Highest level of school completed of respondent's spouse or unmarried partner"
#   ACT_CAREHH      "ACT: Caring for and helping household members"
#   ACT_CARENHH     "ACT: Caring for and helping non-household members"
#   ACT_EDUC        "ACT: Educational activities"
#   ACT_FOOD        "ACT: Eat and drinking"
#   ACT_GOVSERV     "ACT: Government services and civic obligations"
#   ACT_HHACT       "ACT: Household activities"
#   ACT_HHSERV      "ACT: Household services"
#   ACT_PCARE       "ACT: Personal care"
#   ACT_PHONE       "ACT: Telephone calls"
#   ACT_PROFSERV    "ACT: Professional and personal care services"
#   ACT_PURCH       "ACT: Consumer purchases"
#   ACT_RELIG       "ACT: Religious and spiritual activities"
#   ACT_SOCIAL      "ACT: Socializing, relaxing, and leisure"
#   ACT_SPORTS      "ACT: Sports, exercise, and recreation"
#   ACT_TRAVEL      "ACT: Traveling"
#   ACT_VOL         "ACT: Volunteer activities"
#   ACT_WORK        "ACT: Working and Work-related Activities"
#

