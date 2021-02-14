card_session_create <- bs4Card(
  inputID = "session_create",
  title = "New session",
  status = "primary",
  closable = FALSE,
  collapsible = FALSE,
  width = 6,
  textInput(
    inputId = "session_new",
    label = NULL,
    value = NULL,
    placeholder = "new_session_name"
  ),
  actionBttn(
    inputId = "session_create",
    label = "Create new session",
    style = "simple",
    color = "primary",
    size = "sm",
    block = FALSE,
    no_outline = TRUE
  )
)

card_session_manage <- bs4Card(
  inputID = "session_manage",
  title = "Active session",
  status = "primary",
  closable = FALSE,
  collapsible = FALSE,
  width = 6,
  pickerInput(
    inputId = "session_choose",
    label = NULL,
    choices = c("main", "other"),
    selected = "main",
    multiple = FALSE
  ),
  actionBttn(
    inputId = "session_delete",
    label = "Delete active session",
    style = "simple",
    color = "primary",
    size = "sm",
    block = FALSE,
    no_outline = TRUE
  )
)

card_models <- bs4Card(
  inputID = "models",
  title = "Models",
  status = "primary",
  closable = FALSE,
  collapsible = FALSE,
  width = 6,
  pickerInput(
    inputId = "biomarkers",
    label = "Biomarkers",
    choices = c("albumin", "log_bilirubin", "log_platelet"),
    selected = c("albumin", "log_bilirubin"),
    multiple = TRUE,
    options = pickerOptions(
      actionsBox = TRUE,
      deselectAllText = "none",
      selectAllText = "all",
      noneSelectedText = "no label"
    )
  ),
  shinyWidgets::chooseSliderSkin("Flat", color = "blue"),
  shiny::sliderInput(
    inputId = "iterations",
    label = "Iterations",
    value = 1000,
    min = 100,
    max = 10000,
    step = 100,
    ticks = FALSE
  )
)

card_run <- bs4Card(
  inputID = "run",
  title = "Run",
  status = "primary",
  closable = FALSE,
  collapsible = FALSE,
  width = 6,
  actionBttn(
    inputId = "run_start",
    label = "Run pipeline",
    style = "simple",
    color = "success",
    size = "sm",
    block = FALSE,
    no_outline = TRUE
  ),
  br(),
  br(),
  actionBttn(
    inputId = "run_cancel",
    label = "Cancel run",
    style = "simple",
    color = "danger",
    size = "sm",
    block = FALSE,
    no_outline = TRUE
  )
)

tab_control <- bs4TabItem(
  "control",
  fluidRow(
    card_session_manage,
    card_session_create
  ),
  fluidRow(
    card_run,
    card_models
  )
)

tabs <- bs4TabItems(
  tab_control
)

menu <- bs4SidebarMenu(
  id = "menu",
  bs4SidebarMenuItem("Control", tabName = "control", icon = "cog")
)

sidebar <- bs4DashSidebar(
  skin = "light",
  inputId = "sidebar",
  menu
)

ui <- bs4DashPage(
  title = "app",
  body = bs4DashBody(tabs),
  navbar = bs4DashNavbar(controlbarIcon = NULL),
  sidebar = sidebar
)