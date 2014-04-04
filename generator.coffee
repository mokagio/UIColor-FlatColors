# Script to generate the UIColor Category to add flat colors, from the very cool FlatUI framework: http://designmodo.github.io/Flat-UI/

css = """
.palette-turquoise {
  background-color: #1abc9c;
}
.palette-green-sea {
  background-color: #16a085;
}
.palette-emerald {
  background-color: #2ecc71;
}
.palette-nephritis {
  background-color: #27ae60;
}
.palette-peter-river {
  background-color: #3498db;
}
.palette-belize-hole {
  background-color: #2980b9;
}
.palette-amethyst {
  background-color: #9b59b6;
}
.palette-wisteria {
  background-color: #8e44ad;
}
.palette-wet-asphalt {
  background-color: #34495e;
}
.palette-midnight-blue {
  background-color: #2c3e50;
}
.palette-sun-flower {
  background-color: #f1c40f;
}
.palette-orange {
  background-color: #f39c12;
}
.palette-carrot {
  background-color: #e67e22;
}
.palette-pumpkin {
  background-color: #d35400;
}
.palette-alizarin {
  background-color: #e74c3c;
}
.palette-pomegranate {
  background-color: #c0392b;
}
.palette-clouds {
  background-color: #ecf0f1;
}
.palette-silver {
  background-color: #bdc3c7;
}
.palette-concrete {
  background-color: #95a5a6;
}
.palette-asbestos {
  background-color: #7f8c8d;
}
.palette-clouds {
  color: #bdc3c7;
}
"""

h_template = """
- (UIColor *)_name_Color;

"""

m_template = """
- (UIColor *)_name_Color {
  return [UIColor colorWithRed:_red_ green:_green_ blue:_blue_];
}

"""

css_definitions = css.replace(/(\r\n|\n|\r)/gm,"").split "}"

colors_data = []
for color_definition in css_definitions 
  do () ->
    if color_definition != ''
      components = color_definition.split(' ')

      dashed_name =  components[0].replace /.palette-/, ''
      name_components = dashed_name.split '-'
      i = 0
      objc_components = []
      for name_component in name_components
        do () ->
          if i != 0
            objc_components.push name_component.charAt(0).toUpperCase() + name_component.slice(1)
          else
            objc_components.push name_component
          i++

      color_string = components[components.length - 1].replace /#/, ''
      red_string = color_string[0..1]
      green_string = color_string[2..3]
      blue_string = color_string[4..5]
      
      hex_to_dec = (string) ->
        letters = [ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' ]
        dec = letters.indexOf(string[0]) * 16
        uni = letters.indexOf(string[1])

        v = parseInt(dec) + parseInt(uni)

      r = parseFloat(hex_to_dec red_string) / 255.0
      g = parseFloat(hex_to_dec green_string) / 255.0
      b = parseFloat(hex_to_dec blue_string) / 255.0

      colors_data.push { 
        name: objc_components.join('')
        red: r
        green: g
        blue: b
      }

console.log colors_data

# headers
for data in colors_data
  do () ->
    console.log h_template.replace(/_name_/, data.name)

# implementations
for data in colors_data
  do () ->
    console.log m_template
      .replace(/_name_/, data.name)
      .replace(/_red_/, data.red)
      .replace(/_green_/, data.green)
      .replace(/_blue_/, data.blue)
