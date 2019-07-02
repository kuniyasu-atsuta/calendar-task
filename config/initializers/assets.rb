# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w( landing/bootstrap.min.css
                                                  landing/font-awesome.min.css
                                                  landing/owl.carousel.css
                                                  landing/owl.theme.css
                                                  landing/owl.transitions.css
                                                  landing/style.css
                                                  js/bootstrap.min.js
                                                  js/jquery.app.js
                                                  js/jquery.easing.1.3.min.js
                                                  js/jquery.js
                                                  js/jquery.min.js
                                                  js/jquery.sticky.js
                                                  js/owl.carousel.min.js
                                                  js/popper.min.js
                                                  js/scrollspy.min.js
                                                  js/SmoothScroll.js
                                                  js/owl-testi.js

                                                  bootstrap.min.css
                                                  charts.scss
                                                  custom.scss
                                                  extras.scss
                                                  forms.scss
                                                  icons.css

                                                  sessions.scss
                                                  style_dark.css
                                                  style.css
                                                  tables.scss
                                                  uis.scss
                                                  users.scss

                                                  bootstrap.min.js
                                                  cable.js
                                                  detect.js
                                                  fastclick.js

                                                  jquery.app.js
                                                  jquery.blockUI.js
                                                  jquery.core.js
                                                  jquery.min.js
                                                  jquery.nicescroll.js
                                                  jquery.scrollTo.min.js
                                                  jquery.slimscroll.js
                                                  jquery.steps.js
                                                  jquery.steps.min.js
                                                  modernizr.min.js
                                                  pace.min.js
                                                  popper.min.js
                                                  waves.js
                                                  wow.min.js

                                                  plugins/fullcalendar/css/fullcalendar.min.css
                                                  plugins/morris/morris.css

                                                  plugins/jquery-knob/jquery.knob.js
                                                  plugins/jquery-knob/excanvas.js
                                                  plugins/morris/morris.min.js
                                                  plugins/raphael/raphael-min.js
                                                  plugins/jquery-ui/jquery-ui.min.js
                                                  plugins/moment/moment.js
                                                  plugins/fullcalendar/js/fullcalendar.min.js
                                                  plugins/bootstrap-wizard/jquery.bootstrap.wizard.js
                                                  plugins/jquery-validation/dist/jquery.validate.min.js
                                                  plugins/custombox/dist/custombox.min.js
                                                  plugins/custombox/dist/legacy.min.js

                                                  pages/jquery.chartist.init.js
                                                  pages/jquery.chartjs.init.js
                                                  pages/jquery.dashboard.js
                                                  pages/jquery.flot.init.js
                                                  pages/jquery.fullcalendar.js
                                                  pages/jquery.gmaps.js
                                                  pages/jquery.inbox.js
                                                  pages/jquery.morris.init.js
                                                  pages/jquery.other-charts.js
                                                  pages/jquery.peity.init.js
                                                  pages/jquery.sweet-alert.init.js
                                                  pages/jquery.tree.js
                                                  pages/jquery.ui-sliders.js
                                                  pages/jquery.xeditable.js
                                                  pages/jvectormap.init.js
                                                  pages/jquery.dashboard.js
                                                  pages/jquery.fullcalendar.js

                                                  piano.css
                                                  piano.js
                                                  vend/jquery-1.7.2.min.js
                                                  vend/jquery-ui-1.8.20.custom.min.js
                                                  keys.css)
