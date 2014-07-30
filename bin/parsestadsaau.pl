#!/usr/bin/perl
use strict;
use warnings;
use WWW::Mechanize;
use HTTP::Cookies;
use HTML::TableExtract;

my $robot = WWW::Mechanize->new();
my $user = '';
my $pass = '';
my $starturl = 'https://sb.aau.dk/sb-ad/sb/index.jsp';
my $resurl = 'https://sb.aau.dk/sb-ad/sb/resultater/studresultater.jsp';
my $login, my $response, my $reslink, my $te, my $t, my %tmp, my %avg;

######################### LOGIN ################################################
$robot->agent('User-Agent=Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.1.5) Gecko/20091102 Firefox/3.5.5');  # look like a real person
$robot->cookie_jar(HTTP::Cookies->new);

$robot->get($starturl);
$robot->success or die "Login GET fail.";

$login = $robot->form_name("form1");  # <form name="form1">
$login->value('lang'          => 'null');
$login->value('submit_action' => 'login');
$login->value('brugernavn'    => $user);
$login->value('adgangskode'   => $pass);
$robot->submit();
$robot->success or die "Login POST fail.";

$reslink  = $robot->get($resurl);
$response = $robot->response->content;

######################### PARSE, PRINT AND AVERAGE #############################
$te = HTML::TableExtract->new(attribs => {id => 'resultTable'});
$te->parse($response);

for my $table ($te->tables) { 
    for my $row ($table->rows) {
        %tmp = (
            Navn     => @$row[0],
            Bedoemt  => @$row[1],
            Karakter => @$row[2],
            ECTSkar  => @$row[3],
            ECTS     => @$row[4],
        );
        $tmp{'Navn'} =~ s/^\s+//;  # Trim leading and trailing whitespace
        $tmp{'ECTS'} = $1 if $tmp{'ECTS'} =~ m/([\w\d.]+)/;

        printf "%-34s %10s %10s %10s %6s\n", $tmp{'Navn'}, $tmp{'Bedoemt'}, 
                                             $tmp{'Karakter'}, $tmp{'ECTSkar'}, 
                                             $tmp{'ECTS'}; 

        if ($tmp{'Karakter'} =~ m/\d+/) {  # Average of grades that are digits
            $avg{'sum'}  += $tmp{'Karakter'};
            $avg{'n'}    += 1;
            $avg{'wsum'} += $tmp{'Karakter'} * $tmp{'ECTS'};
            $avg{'wn'}   += $tmp{'ECTS'}
        }
    }
}
printf "
Average:                 %5.2f.
Average weighed by ECTS: %5.2f.\n", 1.0*$avg{'sum'}/$avg{'n'}, 
                                    1.0*$avg{'wsum'}/$avg{'wn'};
