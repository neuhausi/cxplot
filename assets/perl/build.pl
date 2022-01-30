#!/usr/bin/perl -w
# Copyright 2022 Isaac Neuhaus.  All rights reserved.

my $RAW = "../text/raw.txt";
my $PAGE = "";
my $TITLE = "";
my $DESC = "";
my $NAME = "";

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

  my ($line, $name, $desc, $arg, $det, $aes, $sin, $ori, $sum, $ref, $cmp);

  if ($buffer) {

    if ($current =~ /^Usage/) {
      $PAGE .= "         <div class=\"ref-usage sourceCode\">\n           <pre class=\"sourceCode r\"><code>";
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
      $PAGE .= "         </div>\n\n";
    } elsif ($current =~ /^Arguments/) {
      $arg  = "         <h2 class=\"hasAnchor\" id=\"arguments\"><a class=\"anchor\" href=\"\#arguments\"></a>Arguments</h2>\n";
      $arg .= "         <table class=\"ref-arguments\">\n           <tbody>\n";
      $PAGE .= $arg;
      while (scalar @$buffer > 0) {
        $line = shift(@$buffer);
        $line =~ s/\s*$//;
        $name = "             <tr>\n               <th>$line</th>";
        $line = shift(@$buffer);
        $line =~ s/\s*$//;
        $desc = "               <td>\n                 <p>$line</p>\n";
        $line = shift(@$buffer);
        $collect = scalar @$buffer > 1 && $buffer->[0] =~ /\w+/ && $buffer->[1] =~ /^$/;
        while ($collect) {
          $line = shift(@$buffer);
          $line =~ s/\s*$//;
          $desc .= "                 <p>$line</p>\n";
          shift(@$buffer);
          $collect = scalar @$buffer > 1 && $buffer->[0] =~ /\w+/ && $buffer->[1] =~ /^$/;
        }
        $desc .= "               <td>\n             </tr>";
        $PAGE .= "$name\n$desc\n";
      }
      $arg = "           </tbody>\n         </table>\n\n";
      $PAGE .= $arg;
    } elsif ($current =~ /^Aesthetics/) {
      $PAGE .= "         <h2 class=\"hasAnchor\" id=\"details\"><a class=\"anchor\" href=\"\#details\"></a>Details</h2>\n";
      while (scalar @$buffer > 0) {
        $line = shift(@$buffer);
        $line =~ s/\s*$//;
        $sin = [ split(/\s/, $line) ];
        if (scalar @$sin < 4) {
          $aes = "         <p><b>&nbsp;&nbsp;&nbsp;&bull;&nbsp;&nbsp;&nbsp;</b>$line</p>\n";
        } else {
          $aes = "         <p>$line</p>\n";
        }
        $line = shift(@$buffer);
        $PAGE .= $aes;
      }
      $PAGE .= "\n";
    } elsif ($current =~ /^Value/) {
  
    } elsif ($current =~ /^Details/) {
      $PAGE .= "         <h2 class=\"hasAnchor\" id=\"aesthetics\"><a class=\"anchor\" href=\"\#aesthetics\"></a>Aesthetics</h2>\n";
      while (scalar @$buffer > 0) {
        $line = shift(@$buffer);
        $line =~ s/\s*$//;
        $det = "         <p>$line</p>\n";
        $line = shift(@$buffer);
        $PAGE .= $det;
      }
      $PAGE .= "\n";
    } elsif ($current =~ /^Quasiquotation/) {
  
    } elsif ($current =~ /^See also/) { 
  
    } elsif ($current =~ /^Examples/) { 
  
    } elsif ($current =~ /^Orientation/) {
      $PAGE .= "         <h2 class=\"hasAnchor\" id=\"orientation\"><a class=\"anchor\" href=\"\#orientation\"></a>Orientation</h2>\n";
      while (scalar @$buffer > 0) {
        $line = shift(@$buffer);
        $line =~ s/\s*$//;
        $ori = "         <p>$line</p>\n";
        $line = shift(@$buffer);
        $PAGE .= $ori;
      }
      $PAGE .= "\n";  
    } elsif ($current =~ /^Computed variables/) { 
      $PAGE .= "         <h2 class=\"hasAnchor\" id=\"computed-variables\"><a class=\"anchor\" href=\"\#computed-variables\"></a>Computed variables</h2>\n";
      while (scalar @$buffer > 0) {
        $line = shift(@$buffer);
        $line =~ s/\s*$//;
        $sin = [ split(/\s/, $line) ];
        if (scalar @$sin < 4) {
          $cmp = "         <p><b>$line</b></p>\n";
        } else {
          $cmp = "         <p>$line</p>\n";
        }
        $line = shift(@$buffer);
        $PAGE .= $cmp;
      }
      $PAGE .= "\n";
    } elsif ($current =~ /^Summary statistics/) {
      $PAGE .= "         <h2 class=\"hasAnchor\" id=\"summary-statistics\"><a class=\"anchor\" href=\"\#summary-statistics\"></a>Summary Statistics</h2>\n";
      while (scalar @$buffer > 0) {
        $line = shift(@$buffer);
        $line =~ s/\s*$//;
        $sum = "         <p>$line</p>\n";
        $line = shift(@$buffer);
        $PAGE .= $sum;
      }
      $PAGE .= "\n";   
    } elsif ($current =~ /^References/) {
      $PAGE .= "         <h2 class=\"hasAnchor\" id=\"references\"><a class=\"anchor\" href=\"\#references\"></a>References</h2>\n";
      while (scalar @$buffer > 0) {
        $line = shift(@$buffer);
        $line =~ s/\s*$//;
        $ref = "         <p>$line</p>\n";
        $line = shift(@$buffer);
        $PAGE .= $ref;
      }
      $PAGE .= "\n";  
    } elsif ($current =~ /^Missing value handling/) {
  
    } elsif ($current =~ /^Overplotting/) {
  
    } elsif ($current =~ /^geom_label\(\)/) {
  
    } elsif ($current =~ /^Summary functions/) {
  
    } elsif ($current =~ /^Theme inheritance/) {   
           
    }

  }

}

sub write_page {

  if ($NAME ne "") {
    print $PAGE;
    exit;
  }

}

sub reset {

  $PAGE = "";
  $TITLE = "";
  $DESC = "";
  $NAME = "";

}