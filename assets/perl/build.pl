#!/usr/bin/perl -w
# Copyright 2022 Isaac Neuhaus.  All rights reserved.

my $RAW = "../text/raw.txt";
my $PAGE = "";
my $TITLE = "";
my $DESC = "";
my $NAME = "";
my $TOC = "";
my $DATA = {};

&main;

sub main {

  my ($buffer, $current);

  open (RAW, "$RAW") or die "Couldn't open $RAW: $!\n";
  while (<RAW>) {
    chomp;
    if (/^--/) {
      &process_buffer($buffer, $current);
      &write_page();
      &reset();
      $NAME = <RAW>;
      if ($NAME eq 'END') {
        return;
      }
      chomp($NAME);
      $TITLE = <RAW>;
      chomp($TITLE);
      $_ = <RAW>;
      $DESC = <RAW>;
      chomp($DESC);
      $current = "Usage";
      $buffer = [];
    } elsif (/^Arguments/) {
      &process_buffer($buffer, $current);
      $current = $_;
      $buffer = [];
    } elsif (/^Aesthetics/) {
      &process_buffer($buffer, $current);
      $current = $_;
      $buffer = [];
    } elsif (/^Value/) {
      &process_buffer($buffer, $current);
      $current = $_;
      $buffer = [];
    } elsif (/^Details/) {
      &process_buffer($buffer, $current);
      $current = $_;
      $buffer = [];
    } elsif (/^Quasiquotation/) {
      &process_buffer($buffer, $current);
      $current = $_;
      $buffer = [];
    } elsif (/^See also/) { 
      &process_buffer($buffer, $current);
      $current = $_;
      $buffer = [];
    } elsif (/^Examples/) { 
      &process_buffer($buffer, $current);
      $current = $_;
      $buffer = [];
    } elsif (/^Orientation/) {
      &process_buffer($buffer, $current);
      $current = $_;
      $buffer = [];
    } elsif (/^Computed variables/) { 
      &process_buffer($buffer, $current);
      $current = $_;
      $buffer = [];
    } elsif (/^Summary statistics/) {
      &process_buffer($buffer, $current);
      $current = $_;
      $buffer = [];
    } elsif (/^References/) {
      &process_buffer($buffer, $current);
      $current = $_;
      $buffer = [];
    } elsif (/^Missing value handling/) {
      &process_buffer($buffer, $current);
      $current = $_;
      $buffer = [];
    } elsif (/^Overplotting/) {
      &process_buffer($buffer, $current);
      $current = $_;
      $buffer = [];
    } elsif (/^geom_label\(\)/) {
      &process_buffer($buffer, $current);
      $current = $_;
      $buffer = [];
    } elsif (/^Summary functions/) {
      &process_buffer($buffer, $current);
      $current = $_;
      $buffer = [];
    } elsif (/^Theme inheritance/) {   
      &process_buffer($buffer, $current);
      $current = $_;
      $buffer = [];           
    } else {
      push @$buffer, $_;
    }
  }
  close RAW;

}

sub process_buffer {

  my ($buffer, $current) = @_;

  my ($line, $name, $desc, $arg, $det, $aes, $sin, $ori, $sum, $ref, $cmp, $cnt, $scr, $cid, $dat);

  if ($buffer) {

    if ($current =~ /^Usage/) {
      $PAGE .= "        <div class=\"ref-usage sourceCode\">\n          <pre class=\"sourceCode r\"><code>";
      foreach $line (@$buffer ) {
        $line =~ s/ (\.\.\.)/\<span class="va"\>"$1"\<\/span\>/; 
        $line =~ s/ ([^\s].+) = NA/\<span class="st"\>"$1"\<\/span\> \<span class="op"\>=\<\/span\> \<span class="cn"\>NA\<\/span\>/; 
        $line =~ s/ ([^\s].+) = NULL/\<span class="st"\>"$1"\<\/span\> \<span class="op"\>=\<\/span\> \<span class="cn"\>null\<\/span\>/; 
        $line =~ s/ ([^\s].+) = FALSE/\<span class="st"\>"$1"\<\/span\> \<span class="op"\>=\<\/span\> \<span class="cn"\>false\<\/span\>/; 
        $line =~ s/ ([^\s].+) = TRUE/\<span class="st"\>"$1"\<\/span\> \<span class="op"\>=\<\/span\> \<span class="cn"\>true\<\/span\>/; 
        $line =~ s/ ([^\s].+) = (\d+)/\<span class="st"\>"$1"\<\/span\> \<span class="op"\>=\<\/span\> \<span class="fl"\>$2\<\/span\>/; 
        $line =~ s/ ([^\s].+) = (\".+\")/\<span class="st"\>"$1"\<\/span\> \<span class="op"\>=\<\/span\> \<span class="st"\>$2\<\/span\>/; 
        $line =~ s/(.+)\(/\<span class="fu"\>$1\<\/span\>\<span class="op"\>\(\<\/span\>\<span class="op"\>\{\<\/span\>/; 
        $line =~ s/\)/\<span class="op"\>\}\<\/span\>\<span class="op"\>\)\<\/span\>/;
        $line =~ s/ ([^\s="]\w*),/\<span class="va"\>"$1"\<\/span\>,/;
        $PAGE .= "$line\n"; 
      }
      $PAGE .= "</span></code></pre>\n        </div>\n\n";
    } elsif ($current =~ /^Arguments/) {
      $arg  = "        <h2 class=\"hasAnchor\" id=\"arguments\"><a class=\"anchor\" href=\"\#arguments\"></a>Arguments</h2>\n";
      $arg .= "        <table class=\"ref-arguments\">\n          <tbody>\n";
      $PAGE .= $arg;
      $TOC .= "            <li><a href=\"#arguments\">Arguments</a></li>\n";
      while (scalar @$buffer > 0) {
        $line = shift(@$buffer);
        $line =~ s/\s*$//;
        $name = "            <tr>\n              <th>$line</th>";
        $line = shift(@$buffer);
        $line =~ s/\s*$//;
        $desc = "              <td>\n                <p>$line</p>\n";
        $line = shift(@$buffer);
        $collect = scalar @$buffer > 1 && $buffer->[0] =~ /\w+/ && $buffer->[1] =~ /^$/;
        while ($collect) {
          $line = shift(@$buffer);
          $line =~ s/\s*$//;
          $desc .= "                <p>$line</p>\n";
          shift(@$buffer);
          $collect = scalar @$buffer > 1 && $buffer->[0] =~ /\w+/ && $buffer->[1] =~ /^$/;
        }
        $desc .= "              <td>\n            </tr>";
        $PAGE .= "$name\n$desc\n";
      }
      $arg = "          </tbody>\n        </table>\n\n";
      $PAGE .= $arg;
    } elsif ($current =~ /^Details/) {
      $PAGE .= "        <h2 class=\"hasAnchor\" id=\"details\"><a class=\"anchor\" href=\"\#details\"></a>Details</h2>\n";
      while (scalar @$buffer > 0) {
        $line = shift(@$buffer);
        $line =~ s/\s*$//;
        $sin = [ split(/\s/, $line) ];
        if (scalar @$sin < 4) {
          $aes = "        <p><b>&nbsp;&nbsp;&nbsp;&bull;&nbsp;&nbsp;&nbsp;</b>$line</p>\n";
        } else {
          $aes = "        <p>$line</p>\n";
        }
        $line = shift(@$buffer);
        $PAGE .= $aes;
      }
      $PAGE .= "\n";
      $TOC .= "            <li><a href=\"#details\">Details</a></li>\n";
    } elsif ($current =~ /^Value/) {
  
    } elsif ($current =~ /^Aesthetics/) {
      $PAGE .= "        <h2 class=\"hasAnchor\" id=\"aesthetics\"><a class=\"anchor\" href=\"\#aesthetics\"></a>Aesthetics</h2>\n";
      while (scalar @$buffer > 0) {
        $line = shift(@$buffer);
        $line =~ s/\s*$//;
        $det = "        <p>$line</p>\n";
        $line = shift(@$buffer);
        $PAGE .= $det;
      }
      $PAGE .= "\n";
      $TOC .= "            <li><a href=\"#aesthetics\">Aesthetics</a></li>\n";
    } elsif ($current =~ /^Quasiquotation/) {
  
    } elsif ($current =~ /^See also/) { 
  
    } elsif ($current =~ /^Examples/) { 
      $PAGE .= "        <h2 class=\"hasAnchor\" id=\"examples\"><a class=\"anchor\" href=\"\#examples\"></a>Examples</h2>\n";
      $PAGE .= "        <div class=\"ref-usage sourceCode\">\n          <pre class=\"sourceCode r\"><code>";
      $line = shift(@$buffer);
      $cnt = 1;
      $scr = "";
      while (scalar @$buffer > 0) {
        if ($line =~ /^\s*$/) {
          if ($scr ne "") {
            $scr =~ s/(canvas)/$cid/;
            $PAGE .= "<span class=\"r-in\"><div><canvas id=\"$cid\" width=\"700\" height=\"433\"><\/canvas><\/div><script>$scr<\/script><\/span>\n";
            $scr = "";
          }
          $PAGE .= "<span class=\"r-in\"><\/span>\n"; 
        } else {
          if ($line =~ /(^\/\/.+)/) {
            $line = "<span class=\"co\">$1<\/span>";            
          } else {
            $scr .= $line;
            if ($line =~ /"canvas", (\w*),/) {
              $dat = $1;
              if ($dat ne "df") {
                $DATA->{$dat} = 1;
                $scr =~ s/$dat/JSON.parse\(JSON.stringify\($dat\)\)/;
              }
            }
            if ($line =~ /(origdata)/) {
              $dat = $1;
              $DATA->{$dat} = 1;
            }
            $line =~ s/"(\w*)"/\<span class="st"\>"$1"\<\/span\>/g;
            $line =~ s/(cxp)/<span class="va">$1<\/span>/;
            $line =~ s/([\{\}\(\)\[\]])/\<span class="op"\>$1\<\/span\>/g;
            $line =~ s/([\-*\d*\.*\d*])/\<span class="fl"\>$1\<\/span\>/g;
            $line =~ s/(geom_\w*)/<span class="fu"><a href=".\/$1.html">$1<\/a><\/span>/;
            $line =~ s/(aes)/<span class="fu"><a href=".\/aes.html">$1<\/a><\/span>/;
            if ($line =~ /canvas/) {
              $line =~ s/(canvas)/$1$cnt/;
              $cid = "canvas$cnt";
              $cnt++;
            }
          }
          $PAGE .= "<span class=\"r-in\">$line<\/span>\n";
        }
        $line = shift(@$buffer);
      }
      if ($scr ne "") {
        $scr =~ s/(canvas)/$cid/;
        $PAGE .= "<span class=\"r-in\"><div><canvas id=\"$cid\" width=\"700\" height=\"433\"><\/canvas><\/div><script>$scr<\/script><\/span>\n";
      }
      $PAGE .= "</span></code></pre>\n        </div>\n\n";
      $TOC .= "            <li><a href=\"#examples\">Examples</a></li>\n";
    } elsif ($current =~ /^Orientation/) {
      $PAGE .= "        <h2 class=\"hasAnchor\" id=\"orientation\"><a class=\"anchor\" href=\"\#orientation\"></a>Orientation</h2>\n";
      while (scalar @$buffer > 0) {
        $line = shift(@$buffer);
        $line =~ s/\s*$//;
        $ori = "        <p>$line</p>\n";
        $line = shift(@$buffer);
        $PAGE .= $ori;
      }
      $PAGE .= "\n";
      $TOC .= "            <li><a href=\"#orientation\">Orientation</a></li>\n";  
    } elsif ($current =~ /^Computed variables/) { 
      $PAGE .= "        <h2 class=\"hasAnchor\" id=\"computed-variables\"><a class=\"anchor\" href=\"\#computed-variables\"></a>Computed variables</h2>\n";
      while (scalar @$buffer > 0) {
        $line = shift(@$buffer);
        $line =~ s/\s*$//;
        $sin = [ split(/\s/, $line) ];
        if (scalar @$sin < 4) {
          $cmp = "        <p><b>$line</b></p>\n";
        } else {
          $cmp = "        <p>$line</p>\n";
        }
        $line = shift(@$buffer);
        $PAGE .= $cmp;
      }
      $PAGE .= "\n";
      $TOC .= "            <li><a href=\"#computed-variables\">Computed variables</a></li>\n";
    } elsif ($current =~ /^Summary statistics/) {
      $PAGE .= "        <h2 class=\"hasAnchor\" id=\"summary-statistics\"><a class=\"anchor\" href=\"\#summary-statistics\"></a>Summary Statistics</h2>\n";
      while (scalar @$buffer > 0) {
        $line = shift(@$buffer);
        $line =~ s/\s*$//;
        $sum = "        <p>$line</p>\n";
        $line = shift(@$buffer);
        $PAGE .= $sum;
      }
      $PAGE .= "\n";
      $TOC .= "            <li><a href=\"#summary-statistics\">Summary Statistics</a></li>\n";   
    } elsif ($current =~ /^References/) {
      $PAGE .= "        <h2 class=\"hasAnchor\" id=\"references\"><a class=\"anchor\" href=\"\#references\"></a>References</h2>\n";
      while (scalar @$buffer > 0) {
        $line = shift(@$buffer);
        $line =~ s/\s*$//;
        $ref = "        <p>$line</p>\n";
        $line = shift(@$buffer);
        $PAGE .= $ref;
      }
      $PAGE .= "\n";
      $TOC .= "            <li><a href=\"#references\">Referances</a></li>\n";  
    } elsif ($current =~ /^Missing value handling/) {
  
    } elsif ($current =~ /^Overplotting/) {
  
    } elsif ($current =~ /^geom_label\(\)/) {
  
    } elsif ($current =~ /^Summary functions/) {
  
    } elsif ($current =~ /^Theme inheritance/) {   
           
    }

  }

}

sub codify {

  my ($line);

  my @lines = split(/\n/, $PAGE);

  $PAGE = "";
  foreach $line (@lines) {
    if ($line !~ /r-in/) {
      $line =~ s/((geom_.+)\([\w,=\s]*?\))/<a href=\".\/$2.html\"><code>$1<\/code><\/a>/;
      $line =~ s/(cxplot\([\w,=\s]*?\))/<a href=\".\/cxplot.html\"><code>$1<\/code><\/a>/;
      $line =~ s/(aes\([\w,=\s]*?\))/<a href=\".\/aes.html\"><code>$1<\/code><\/a>/;
      $line =~ s/(aes_\([\w,=\s]*?\))/<a href=\".\/aes.html\"><code>$1<\/code><\/a>/;
      $line =~ s/(head\([\w,=\s]*?\))/<code>$1<\/code>/;
      $line =~ s/(layer\([\w,=\s]*?\))/<code>$1<\/code>/;
      $line =~ s/alpha/<code>alpha<\/code>/;
      $line =~ s/colour/<code>color<\/code>/;
      $line =~ s/linetype/<code>linetype<\/code>/;
      $line =~ s/size/<code>size<\/code>/;
      $line =~ s/slope /<code>slope<\/code> /;
      $line =~ s/(\w*intercept) /<code>$1<\/code> /;
      $line =~ s/(\w*intercept)<\/p>/<code>$1<\/code><\/p>/;
    }
    $PAGE .= "$line\n";
  }

}

sub write_page {

  if ($NAME ne "") {
    &codify;
    open (PAGE, ">../html/$NAME") or die "Couldn't open >../html/$NAME: $!\n";
    print PAGE &head;
    print PAGE $PAGE;
    print PAGE &foot;
    close PAGE;
  }

}

sub reset {

  $PAGE = "";
  $TITLE = "";
  $DESC = "";
  $NAME = "";
  $TOC = "";
  $DATA = {};

}

sub head {

  my ($d, $s);

  my $head = <<HEAD;
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>$TITLE • cxplot</title>
  <!-- favicons -->
  <link rel="icon" type="image/png" sizes="16x16" href="/assets/images/favicon-16x16.png">
  <link rel="icon" type="image/png" sizes="32x32" href="/assets/images/favicon-32x32.png">
  <link rel="apple-touch-icon" type="image/png" sizes="180x180" href="/assets/images/apple-touch-icon.png">
  <link rel="apple-touch-icon" type="image/png" sizes="120x120" href="/assets/images/apple-touch-icon-120x120.png">
  <link rel="apple-touch-icon" type="image/png" sizes="76x76" href="/assets/images/apple-touch-icon-76x76.png">
  <link rel="apple-touch-icon" type="image/png" sizes="60x60" href="/assets/images/apple-touch-icon-60x60.png">
  <!-- data -->
  __DATA__
  <!-- jquery -->
  <script src="/assets/js/jquery.min.js" crossorigin="anonymous"></script>
  <!-- Bootstrap -->
  <link href="/assets/css/tidyverse.css" rel="stylesheet">
  <script src="/assets/js/bootstrap.min.js" crossorigin="anonymous"></script>
  <!-- Font Awesome icons -->
  <link rel="stylesheet" href="/assets/css/all.min.css" crossorigin="anonymous">
  <link rel="stylesheet" href="/assets/css/v4-shims.min.css" crossorigin="anonymous">
  <!-- clipboard.js -->
  <script src="/assets/js/clipboard.min.js" crossorigin="anonymous"></script>
  <!-- headroom.js -->
  <script src="/assets/js/headroom.min.js" crossorigin="anonymous"></script>
  <script src="/assets/js/jQuery.headroom.min.js" crossorigin="anonymous"></script>
  <link href="/assets/css/tidyverse-2.css" rel="stylesheet">
  <!-- pkgdown -->
  <link href="/assets/css/pkgdown.css" rel="stylesheet">
  <!-- CanvasXpress -->
  <link rel="stylesheet" href="/assets/css/canvasXpress.css" type="text/css" />
  <script type="text/javascript" src="/assets/js/canvasXpress.min.js"></script>
  <!-- Google -->
  <!-- Global site tag (gtag.js) - Google Analytics -->
  <script async src="https://www.googletagmanager.com/gtag/js?id=G-XWN5F9X8DS"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', 'G-XWN5F9X8DS');
  </script>
  <!--optional theme-->
  <meta property="og:title" content="$TITLE">
  <meta property="og:description" content="$DESC">
  <meta property="og:image" content="/assets/images/logo.svg">
  <meta name="twitter:card" content="summary">
</head>

<body data-spy="scroll" data-target="#toc" style="padding-top: 60px;">

  <div class="container template-reference-topic">

    <header>
      <div class="navbar navbar-default navbar-fixed-top headroom headroom--top headroom--not-bottom" role="navigation">
        <div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
              aria-expanded="false">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <div class="navbar-brand-container">
              <a class="navbar-brand" href="/index.html">cxplot</a>
            </div>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
              <li>
                <a href="https://github.com/neuhausi/cxplot" class="external-link">
                  <span class="fab fa-github fa-lg"></span>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </header>

    <div class="row">

      <div class="col-md-9 contents">

        <div class="page-header">
          <h1>$TITLE</h1>
        </div>

        <div class="ref-description">
          <p>$DESC</p>
        </div>

HEAD

  foreach $d (keys %$DATA) {
    push(@$s, "<script type=\"text/javascript\" src=\"/assets/data/$d.js\"></script>");
  }
  if ($s) {
    $s = join("\n  ", @$s);
    $head =~ s/__DATA__/$s/;
  }

  return $head;

}

sub foot {

  my $foot = <<FOOT;
      </div>

      <div class="col-md-3 hidden-xs hidden-sm" id="pkgdown-sidebar">
        <nav id="toc" data-toggle="toc" class="sticky-top">
          <h2 data-toc-skip="">Contents</h2>
          <ul class="nav">
$TOC          </ul>
        </nav>
      </div>

    </div>

    <footer>

      <div class="tidyverse">
        <p>cxplot is a part of <strong>CanvasXpress</strong>, a Javascript library for data analytics.
          Learn more at <a href="https://canvasxpress.org/" class="external-link">canvasxpress.org</a>.</p>
      </div>

      <div class="author">
        <p>
          Developed by CanvasXpress
        </p>
      </div>

    </footer>

  </div>

</body>

</html>
FOOT

  return $foot;
}