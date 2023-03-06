-- js
local p5js = [[function setup() {{
  createCanvas(400, 400);
  {}
}}

function draw() {{
  background(220);
  {}
}}]]

-- html
local basichtml = [[<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{}</title>
  </head>
  <body>
    {}
  </body>
</html>]]

local p5html = [[<html lang="en">
  <head>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.5.0/p5.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.5.0/addons/p5.sound.min.js"></script>
    <link rel="stylesheet" type="text/css" href="style.css">
    <meta charset="utf-8" />
  </head>
  <body>
    <main>
    </main>
    <script src="sketch.js"></script>
  </body>
</html>]]

-- latex and bibtex
local bibtexmisc = [[@misc{{{},
  title={{{}}},
  url={{{}}},
  howpublished={{\url{{{}}}}},
  journal={{{}}},
  author={{{}}},
  publisher={{{}}},
  year={{{}}},
  month={{{}}}
}}]]

local bibtexarticle = [[@article{{{},
  title={{{}}},
  author={{{}}},
  journal={{{}}},
  volume={{{}}},
  number={{{}}},
  pages={{{}}},
  year={{{}}},
  publisher={{{}}}
}}]]

return { p5js = p5js, misc = bibtexmisc, basichtml = basichtml, p5html = p5html, bibtexarticle = bibtexarticle }
